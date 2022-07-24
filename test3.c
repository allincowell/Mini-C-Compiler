#include <stdio.h>

int main() {
	int num = 0;
    num++;
    num--;
    num = num * num;
    num = num - 12;
    num = num % 13;
    num = (((num >> 8) << 5) + 19) - 1100;
    num = 81 ^ 50;
    num <<= 5;
    num >>= 2;
    num &= 21;
    num ^= 122;

	return 0;
}