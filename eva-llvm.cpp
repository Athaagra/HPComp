#include <string>
#include "./src/EvaLLVM.h"
#include <chrono>

/* Only needed for the sake of this example. */
#include <iostream>
#include <thread>
    
void long_operation()
{
    /* Simulating a long, heavy operation. */

    using namespace std::chrono_literals;
    std::this_thread::sleep_for(150ms);
}


int main(int argc, char const* argv[]) {
	using std::chrono::high_resolution_clock;
    using std::chrono::duration_cast;
    using std::chrono::duration;
    using std::chrono::milliseconds;

    auto t1 = high_resolution_clock::now();
    long_operation();
    auto t2 = high_resolution_clock::now();

    /* Getting number of milliseconds as an integer. */
    auto ms_int = duration_cast<milliseconds>(t2 - t1);

    /* Getting number of milliseconds as a double. */
    duration<double, std::milli> ms_double = t2 - t1;

    std::cout << ms_int.count() << "ms\n";
    std::cout << ms_double.count() << "ms\n";
	/**
	*	Program to execute.
	*/
	std::string program = R"(
		(var z 138)
		(while (> z 0)
			(var x 250)
			(while (> x 0))
			(begin
				(set x (- x 1))
				(set z (- z 1))
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
