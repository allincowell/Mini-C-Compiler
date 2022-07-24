#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NONE -1

int main() {
	int i, ans = 0;
	for(int i = 0; i < 100; i++) {
		switch(i) {
			case(50) : continue;
			case(60) : break;
			default : ans++;
		}
	}

	if(ans >= 50 && ((ans <= 75) || (ans % 10 == 0))) {
		ans--;
	}
	else {
		ans++;
	}

	if(ans < -100 || ans > 100) {
		ans = NONE;
	}
	else if(ans % 2 == 0) {
		ans /= 2;
	}
	else {
		if(ans % 3 == 0 && ans <= 69) {
			ans /= 3;
		}
		else {
			ans = (ans << 2);
		}
	}

	printf("%d\n", ans);


	return 0;
}