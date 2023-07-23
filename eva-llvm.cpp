#include <string>
#include "./src/EvaLLVM.h"

int main(int argc, char const* argv[]) {
	/**
	*	Program to execute.
	*/
	std::string program = R"(
		(var x 10)
		
		(while (> x 0)
			(begin 
				(set x (- x 1))
				(printf "%d " x)))
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
