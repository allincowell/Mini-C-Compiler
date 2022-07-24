#include <stdio.h>
#include <stdlib.h>

#define MXN 1000

int dp[MXN];

void Fibo(int n) {
	dp[0] = 0;
	dp[1] = 1;
	for(int i = 2; i <= n; i++) {
		dp[i] = dp[i - 1] + dp[i - 2];
	}
}

int main() {
	int n = 50;

	Fibo(n);

	return 0;
}