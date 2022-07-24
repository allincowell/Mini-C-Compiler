#include <stdio.h>

int main() {
	int n = 0;

	do {
		if(n % 2 == 0)
			n++;
		else if(n % 3 == 0)
			n += 2;
		else
			n += 4;

	} while(n < 100);

	while(1) {
		if(n == 0) {
			break;
		}

		if(n % 10 == 0)
			n /= 10;
		else if(n % 3 == 0)
			n /= 3;
		else
			n /= 2;
	}

	printf("%d\n", n);

	return 0;
}