Steps to check the syntactic correctness of a C-program, say “check.c”,  are as follows:

1. Open the terminal in the NLP folder of the zipped file, and paste the “check.c” file in it.

2. Type “make” in the terminal.

3. There are two alternate ways from here on.

4. One way is to change Makefile directly:

	4.1) Open the “Makefile” in the folder and edit the file in two places.

	4.2) The first place is the “output.txt: a.out” label.

	4.3) Add “./a.out < check.c > out.txt” if one want to see the output in a file named out.txt.

	4.4) add “out.txt” in the “clean” label to remove the file “out.txt” once “make clean” is called.


5. The other way avoids Makefile altogether:
	Type the command “./a.out < check.c” to view the output in the terminal.

6. Command "make" is sufficient to view results of all the relevant test files in the repo.
