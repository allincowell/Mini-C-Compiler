#include <stdio.h>

const int INF = (int) 1e9;

int max(int a, int b) {
	int ans;
	if(a > b) {
		ans = a;
	}
	else {
		ans = b;
	}
	return ans;
}

int main() {
	int value[100];
	int weight[100];
	int n;
	int W;
	printf("Enter the number of items and max. weight of Knapsack: ");
	scanf("%d %d", &n, &W);

	printf("Enter the value of items\n");
	for(int i = 0; i < n; i++) {
		scanf("%d", &value[i]);
	}
	printf("Enter the weight of items\n");
	for(int i = 0; i < n; i++) {
		scanf("%d", &weight[i]);
	}
	int dp[100][100];
	for(int i = 0; i <= n; i++) {
		for(int j = 0; j <= W; j++) {
			if(i == 0 || j == 0) {
				dp[i][j] = 0;
			}
			else {
				int choice1 = dp[i - 1][j];
				int choice2 = (j >= weight[i] ? (dp[i - 1][j - weight[i]] + value[i]) : -INF);
				dp[i][j] = max(choice1, choice2);
			}
		}
	}

	printf("%d", dp[n][W]);

	return 0;
}