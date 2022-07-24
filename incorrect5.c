#include <stdio.h>

int fib(int a, int b)
{
	if(a <= 1)
		return a;
	return fib(a - 1, b) + fib(a - 2, b - 1);
}

int main() 
{
	int n = 9;
	int sum = 0;
	for(int i = 1; i <= n; i++) {
		sum += fib(i, 0);

	printf("%d\n", sum);

	return 0;
}