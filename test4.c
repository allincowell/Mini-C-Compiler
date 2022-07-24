#include <stdio.h>

int main() {
	int input;
	input = 20;

	auto float check1 = -45.56;
    volatile int check2 = 89;

    float f = .87e-03;
    double d = 25.;
    float t = 43.46;
    const char ch = 'a';

    char buff[30] = "Here is a good one!\n\t";
    char arr[4] = "";
    int int_array[] = {10, 7, 8, 9, 1, 5};

    short int A = (5 ^ 7) | 9;
    signed int B = -A;
    unsigned long C = A + B;

    return 0;
}