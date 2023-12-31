#pragma once
#ifndef EvaLLVM_h
#define EvaLLVM_h

#include <string>
#include <regex>
#include <iostream>

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"

#include "./Logger.h"
#include "./Environment.h"
#include "./parser/EvaParser.h"
using syntax::EvaParser;

using Env = std::shared_ptr<Environment>;

#define GEN_BINARY_OP(Op, varName)  \
  do{                               \
    auto op1 = gen(exp.list[1], env);\
    auto op2 = gen(exp.list[2], env);\
    return builder->Op(op1, op2, varName);\
  }while(false)
	
class EvaLLVM {
  public:
	EvaLLVM() :parser(std::make_unique<EvaParser>()) {moduleInit();
	setupExternFunctions();
	setupGlobalEnvironment();}
	/**
	* Executes a program.
	**/
	void exec(const std::string& program) {
		// 1. Parse the Program
		auto ast = parser->parse("(begin " + program + ")");

		// 2. Compile to LLVM IR;
		compile(ast);

		// Print generated code.
		module->print(llvm::outs(), nullptr);
		
		std::cout << "\n";
		// 3. Save module IR to file:
		saveModuleToFile("./out.ll");
	}
private:
	void compile(const Exp& ast){
		fn=createFunction(
		"main", llvm::FunctionType::get( builder->getInt32Ty(),
						  /* vararg */ false),
		GlobalEnv);
		createGlobalVar("VERSION", builder->getInt32(42));
		//auto result = gen(ast, GlobalEnv);
		gen(ast);
		//auto i32Result = builder->CreateIntCast(result, builder->getInt32Ty(), true);
		builder->CreateRet(builder->getInt32(0));
	}
	/**
	*
	*/
	llvm::Value* gen(const Exp& exp, Env env){
			switch (exp.type) {
				// Numbers
				case ExpType::NUMBER:
					return builder->getInt32(exp.number);
				// Strings
				case ExpType::STRING:{
				  auto re = std::regex("\\\\n");
				  auto str = std::regex_replace(exp.string, re, "\n");
				  return builder->CreateGlobalStringPtr(str);
				}
				// Symbols
				case ExpType::SYMBOL:
				if (exp.string=="true" || exp.string == "false") {
					return builder->getInt1(exp.string == "true" ? true : false);
				} else {
					auto varName = exp.string;
					auto value = env->lookup(varName);
					// Local Vars
					if (auto localVar = llvm:dyn_cast<llvm::AllocaInst>(value)){
						return builder->CreateLoad(localVar->getAllocatedType(), localVar,varName.c_str());
					}
					//Global Var
					else if(auto globalVar == llvm::dyn_cast<llvm::GlobalVariable>(value)){
						return builder->CreateLoad(globalVar->getInitializer()->getType(),globalVar, varName.c_str());
					}
					//return module->getNamedGlobal(exp.string)->getInitializer();
				}
				// Lists
				case ExpType::LIST:
					auto tag=exp.list[0];
					if (tag.type==ExpType::SYMBOL) {
						auto op=tag.string;
						if (op == "+") {
							GEN_BINARY_OP(CreateAdd, "tmpadd");
						}
						else if (op == "-"){
							GEN_BINARY_OP(CreateSub, "tmpsub");
						}
						else if (op == "*"){
							GEN_BINARY_OP(CreateMul, "tmpmul");
						}
						else if (op == "/"){
							GEN_BINARY_OP(CreateSDiv, "tmpdiv");
						}
						else if (op == ">"){
							GEN_BINARY_OP(CreateICmpUGT, "tmpcmp");
						}
						else if (op == "<"){
							GEN_BINARY_OP(CreateICmpULT, "tmpcmp");
						}
						else if (op == "=="){
							GEN_BINARY_OP(CreateICmpEQ, "tmpcmp");
						}
						else if (op == "!="){
							GEN_BINARY_OP(CreateICmpNE, "tmpcmp");
						}
						else if (op == ">="){
							GEN_BINARY_OP(CreateICmpUGE, "tmpcmp");
						}
						else if (op == "<="){
							GEN_BINARY_OP(CreateICmpULE, "tmpcmp");
						}
						else if (op == "if"){
							auto cond = gen(exp.list[1], env);
							//Then block;
							auto thenBlock = createBB("then", fn);
							
							auto elseBlock = createBB("else");
							auto ifEndBlock = createBB("ifend");
							//Condition branch:
							builder->CreateCondBr(cond, thenBlock, elseBlock);
							//Then branch:
							builder->SetInsertPoint(thenBlock);
							auto thenRes = gen(exp.list[2], env);
							builder->CreateBr(ifEndBlock);
							
							
							thenBlock = builder->GetInsertBlock();
							//Else branch
							fn->getBasicBlockList().push_back(elseBlock);
							
							
							
							//Else branch:
							builder->SetInsertPoint(elseBlock);
							auto elseRes = gen(exp.list[3], env);
							build->CreateBr(ifEndBlock);
							
							
							
							elseBlock = builder->GetInsertBlock();
							
							//
							//If-end block:
							fn->getBasicBlockList().push_back(ifEndBlock);
							
							
							builder->SetInsertPoint(ifEndBlock);
							//Result of the if expression is phi:
							auto phi = builder->CreatePHI(thenRes->getType(), 2, "tmpif");
							phi->addIncoming(thenRes, thenBlock);
							phi->addIncoming(elseRes, elseBlock);
							
							return phi;
						}
						else if (op == "while"){
							auto condBlock = createBB("cond", fn);
							builder->CreateBr(condBlock);
							
							auto bodyBlock = createBB("body");
							auto loopEndBlock = createBB("loopend");
							
							builder->SetInsertPoint(condBlock);
							auto cond = gen(exp.list[1], env);
							
							builder->CreateBondBr(cond, bodyBlock, loopEndBlock);
							
							fn->getBasicBlockList().push_back(bodyBlock);
							builder->SetInsertPoint(bodyBlock);
							get(exp.list[2], env);
							builder->CreateBr(condBlock);
							
							fn->getBasicBlockList().push_back(loopEndBlock);
							builder->SetInsertPoint(loopEndBlock);
							
							return builder->getInt32(0);
					}
					if(tag.type==ExpType::SYMBOL){
						auto op = tag.string;
						if(op=="var"){
							auto varNameDecl = exp.list[1];
							auto varName = extractVarName(varNameDecl);
							auto init = gen(exp.list[2], env);
							auto varTy = extractVarType(varNameDecl);
							auto varBinding = allocVar(varName, varTy, env);
							return builder->CreateStore(init, varBinding);
							//return createGlobalVar(varName,(llvm::Constant *) init);
						}
						else if (op == "set"){
							auto value = gen(exp.list[2], env);
							auto varName = exp.list[1].string;
							auto varBinding = env->lookup(varName);
							builder->CreateStore(value, varBinding);
							return value;
						}
						else if (op == "begin") {
						//
						auto blockEnv = std::make_shared<Environment>(
							std::map<std::string, llvm::Value*>{},env);
						llvm::Value* blockRes;
						for (auto i=1; i<exp.list.size();i++){
							blockRes =gen(exp.list[i], blockEnv);
						}
						return blockRes;
					}
					else if (op == "printf") {
						//
						auto printfFn = module->getFunction("printf");
						std::vector<llvm::Value*> args{};
						for (auto i=1; i<exp.list.size();i++){
							args.push_back(gen(exp.list[i], env));
						}
							  return builder->CreateCall(printfFn,args);

					}
				}
					  return builder->getInt32(0);

			}
	  //return builder->getInt32(0);
	  
	  //strings:
	  //return 
	  //auto str = builder->CreateGlobalStringPtr("Hello, world!\n");
	  
	  // call to printf:
	  /**
	  * Extracts var or parameter name considering type.
	  */
	std::string extractVarName(const Exp & exp){
		return exp.type == ExpType::LIST ? exp.list[0].string : exp.string;
	}
	
	llvm::Type* extractVarType(const Exp& exp) {
		return exp.type == ExpType::LIST ? getTypeFromString(exp.list[1].string)
										 : builder->getInt32Ty();
	}

	llvm::Type* getTypeFromString(const std::string& type_) {
		if(type_ == "number"){
			return builder->getInt32Ty();
		}
		
		if (type_ == "string") {
			return builder->getInt8Ty()->getPointerTo();
		}
		
		return builder->getInt32Ty();
	}
	/**
	*	Allocates a local variable on the stack. Result is the alloca instruction.
	*/
	llvm::Value* allocVar(const std::string& name, llvm::Type* type_, Env env){
		varsBuilder->SetInsertPoint(&fn->getEntryBlock());
		
		auto varAlloc = varsBuilder->CreateAlloca(type_, 0, name.c_str());
		
		env->define(name,varAlloc);
		return varAlloc;
	}
	  // args:
	llvm::GlobalVariable* createGlobalVar(const std::string& name, llvm::Constant* init)  {
		module->getOrInsertGlobal(name, init->getType());
		auto variable = module->getNamedGlobal(name);
		variable->setAlignment(llvm::MaybeAlign(4));
		variable->setConstant(false);
		variable->setInitializer(init);
		return variable;
	}
	void setupExternFunctions(){
	  auto bytePtrTy=builder->getInt8Ty()->getPointerTo();
	  
	  module->getOrInsertFunction("printf",llvm::FunctionType::get(
	  /* return type */ builder->getInt32Ty(),
	  /* format arg */ bytePtrTy,
	  true));
	}
	/**
	* Creates a function.
	**/
	llvm::Function* createFunction(const std::string& fnName,
				      llvm::FunctionType* fnType, Env env){
		// Function prototypr might already be defined:
	  auto fn = module->getFunction(fnName);
		// If not, allocate the function:
	  if (fn == nullptr) {
	    fn = createFunctionProto(fnName, fnType, env);
	  }
	  createFunctionBlock(fn);
	  return fn;	
	}
	/**
	*	Creates function prototype (defines the function, but not the body)
	**/
	llvm::Function* createFunctionProto(const std::string& fnName,
					    llvm::FunctionType* fnType) {
	auto fn = llvm::Function::Create(fnType, llvm::Function::ExternalLinkage,fnName, *module);
	verifyFunction(*fn);
	env->define(fnName, fn);
	return fn;	
	}
	/**
	* Create function block.
	**/
	void createFunctionBlock(llvm::Function* fn){
		auto entry = createBB("entry", fn);
		builder->SetInsertPoint(entry);
	}
	/**
	* Creates a basic block. If the 'fn' is passed, the block is
	* automatically appended to the parent function. Otherwise,
	* the block should later be appended manually via
	* fn->getBasicBlockList().push_back(block);
	*/
	llvm::BasicBlock* createBB(std::string name, llvm::Function* fn =nullptr) {
		return llvm::BasicBlock::Create(*ctx, name, fn);
	}
	
	/**
	*	Saves IR to file
	**/
	void saveModuleToFile(const std::string& fileName) {
		std::error_code errorCode;
		llvm::raw_fd_ostream outLL(fileName, errorCode);
		module->print(outLL, nullptr);
	}
	/**
	*	Initialize the module.
	*/
	void moduleInit() {
		// open a new context and module.
		ctx = std::make_unique<llvm::LLVMContext>();
		module = std::make_unique<llvm::Module>("EvaLLVM", *ctx);
		// Create a new builder for the module.
		builder = std::make_unique<llvm::IRBuilder<>>(*ctx);
		// Vars builder:
		varsBuilder = std::make_unique<llvm::IRBuilder<>>(*ctx);
	}
	/**
	* Sets up the Global Environment.
	**/
	void setupGlobalEnvironment() {
		std::map<std::string, llvm::Value*> globalObject{
			{"VERSION", builder->getInt32(42)},
		};
		std::map<std::string, llvm::Value*> globalRec{};
		for(auto& entry : globalObject){
			globalRec[entry.first] =
				createGlobalVar(entry.first, (llvm::Constant*)entry.second);
		}
		GlobalEnv = std::make_shared<Environment>(globalRec, nullptr);
	}
	/**
	* Parser
	**/
	std::unique_ptr<EvaParser> parser;
	/**
	*	Global compiling function
	**/
	std::shared_ptr<Environment> GlobalEnv;
	/**
	* Currently compiling function.
	**/
	llvm::Function* fn;
	/**
	* Global LLVM context.
	* It owns and manages the core "global" data of LLVM's core
	* infrastructure, including the type and constant unique tables/
	*/
	std::unique_ptr<llvm::LLVMContext> ctx;
	/**
	* A Module instance is used to store all the information related to an
	* LLVM module. Modules are the top level container of all other LLVM
	* Intermediate Representation (IR) objects. Each module directly contains a
	* list of globals variables, a list of functions, a list of libraries (or 
	* other modukes) this module depends on, a symbol table, and various data
	* about the target's characteristics.
	*
	* A module maintains a GlobalList object that is used to hold all
	* constant references to global variables in the module. When a global
	* variable is destroyed, it should have no entries in the GlobalList.
	* The main container class for the LLVM intermediate Representation.
	*/
	std::unique_ptr<llvm::Module> module;
	std::unique_prt<llvm::IRBuilder<>> varsBuilder;
	/**
	* IR Builder.
	*
	* This provide a uniform AP/i for creating instructions and inserting
	* them into a basic block: either at the end of a BasicBlock, or at a
	* specific iterator location in a block.
	*/
	std::unique_ptr<llvm::IRBuilder<>> builder;
};

#endif
