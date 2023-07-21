#pragma once
#ifndef EvaLLVM_h
#define EvaLLVM_h

#include <string>
#include <iostream>

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"

class EvaLLVM {
public:
	EvaLLVM() {moduleInit();}
	/**
	* Executes a program.
	**/
	void exec(const std::string& program) {
		// 1. Parse the Program
		// auto ast = parser->parser(program);

		// 2. Compile to LLVM IR;
		compile();

		// Print generated code.
		module->print(llvm::outs(), nullptr);
		// 3. Save module IR to file:
		saveModuleToFile("./out.ll");
	}
private:
	void compile(/* TODO: ast */){
		fn=createFunction("main", llvm::FunctionType::get( builder->getInte32Ty(),
																/* vararg */ false));
		auto result = gen(/* ast */);
		auto i32Result = builder->CreateIntCast(result, builder->getInt32Ty(), true);
		builder->CreateRet(i32Result);
	}
	/**
	*
	*/
	llvm::Value* gen(/* exp */){ return builder->getInt32(42);}
	
	/**
	* Creates a function.
	**/
	llvm::FunctioncreateFunction(const std::string& fnName,
								llvm::FunctionType* fnType){
		// Function prototypr might already be defined:
		auto fn = module->getFunction(fnName);
		
		// If not, allocate the function:
		if (fn == nullptr) {
			fn = createFunctionProto(fnName, fnType);
		}
		createFunctionBlock(fn);
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
		return llvm:BasicBlock::Create(*ctx, name, fn);
	}
	/**
	*	Creates function prototype (defines the function, but not the body)
	**/
	llvm::Function* createFunctionProto(const std::string& fnName,
										llvm::FunctionTypr* fnType) {
		auto fn = llvm::Function::Create(fnType, llvm::Function::ExternalLinkage,
											fnName, *module);
		verifyFunction(*fn);
		return fn;	
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
		builder = std::make_unique<llvm:IRBuilder<>>(*ctx);
	}
	/**
	* Currently compiling function.
	**/
	llvm::Function* fn;
	/**
	* Global LLVM context.
	* It owns and manages the core "global" data of LLVM's core
	* infrastructure, including the type and constant unique tables/
	*/
	std::unique_ptr < llv::LLVMContext> ctx;
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