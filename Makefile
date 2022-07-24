output.txt: a.out
	./a.out < test1.c > output1.txt
	./a.out < test2.c > output2.txt
	./a.out < test3.c > output3.txt
	./a.out < test4.c > output4.txt
	./a.out < test5.c > output5.txt
	./a.out < test6.c > output6.txt
	./a.out < test7.c > output7.txt
	./a.out < test8.c > output8.txt
	./a.out < test9.c > output9.txt
	./a.out < test10.c > output10.txt
	./a.out < incorrect1.c > incorrect_out1.txt
	./a.out < incorrect2.c > incorrect_out2.txt
	./a.out < incorrect3.c > incorrect_out3.txt
	./a.out < incorrect4.c > incorrect_out4.txt
	./a.out < incorrect5.c > incorrect_out5.txt

a.out: lex.yy.c y.tab.c main.o
	gcc lex.yy.c y.tab.c main.o -lfl

lex.yy.c: flex.l
	flex flex.l

y.tab.c: yacc.y
	yacc -dtv yacc.y

main.o: main.c
	gcc -c main.c

clean:
	rm y.tab.c y.tab.h a.out lex.yy.c y.output main.o *.txt