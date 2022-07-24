#include <stdio.h>
#define myGlobalInt 5
 
int main()
{
    int myLocalInt = 7;
    int myProd = myLocalInt * myGlobalInt;
    printf("My Calculator => %d * %d = %04d \n", myGlobalInt, myLocalInt, myProd);
    return 0;
}