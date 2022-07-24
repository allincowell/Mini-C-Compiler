#include <stdio.h>
#include <stdlib.h>

void swap(int *a, int *b) {
	int temp = *a;
	*a = *b;
	*b = temp;
}

void print_the_array(int A[], int n) {
	for(int i = 0; i < n; i++) {
		A[i] += 10;
		printf("%d ", A[i]);
	}
	printf("\n");
}

int main() {
	int A[] = {10, 7, 8, 9, 1, 5};
	int n = (int) sizeof(A) / (int) sizeof(A[0]);
	printf("Size of the array = %d\n", n);

	swap(&A[0], &A[n - 1]);
	print_the_array(A, n);

	return 0;
}