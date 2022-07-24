#include <stdio.h>
#include "y.tab.h"
extern int yyparse();



int main()
{
    printf("Parsing begins\n\n");

    int check = yyparse();
    printf("\n");
    
    if (check)
        printf("Parsing Unsuccessful\n");
    else
        printf("Parsing Successful\n");

    return 0;
}
