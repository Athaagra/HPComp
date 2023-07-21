//
// Created by childcity on 20.05.19.
//

//#include "astree.hpp"
//#include <iostream>
#include <stdio.h>
#include <string>
#include "./src/EvaLLVM.h"

int main(int argc, char const *argv[]) {
	/**
	*	Program to execute.
	*/
	std::string program = R"(
		42
	)";
	/**
	*	Compiler instance.
	*/
	EvaLLVM vm;

	/**
	* Generate LLVM IR.
	*/
	vm.exec(program);
	return 0;
}