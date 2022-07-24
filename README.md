Steps to check the syntactic correctness of a C-program, say “check.c”,  are as follows:

1. Open the terminal in the NLP folder of the zipped file, and paste the “check.c” file in it.
2. Type “make” in the terminal.
3. There are two alternate ways from here on:
	a) Using Makefile: Open the “Makefile” in the folder and edit the file in two places. The first place is the “output.txt: a.out” label. Add “./a.out < check.c > out.txt” if you want to see the output in a file named out.txt. Also, add “out.txt” in the “clean” label to remove the file “out.txt” once “make clean” is called.
	b) Without using Makefile: Type the command “./a.out < check.c” to view the output in the terminal.
