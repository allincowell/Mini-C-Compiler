#include <stdio.h>
#include <stdlib.h>

extern double func();

const int INVALID = -1;

static int demo(int x) {
	if(x == 0) {
		return 0;
	}
	else if(x % 4 == 0) {
		if(x % 2 == 0) {
			return x / 2;
		}
		else return x + 4;
	}
	else if(x % 3 == 0) {
		return (x - 1) * (x - 1);
	}
	else {
		return (x + 1) * (x + 1);
	}

	return INVALID;
}

int main() {
	int N = 100;
	// This is the comment to check parsing
	int ans = demo(N);
	ans += N;

	/* This is another type of comment to check parsing */
	printf("%d\n", ans);

	return 0;
}