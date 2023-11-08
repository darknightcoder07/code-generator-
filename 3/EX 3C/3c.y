%{
#include <stdio.h>
#include <stdlib.h>
int count = 0;
%}

%token IF RELOP S NUMBER ID NL

%%

stmt: if_stmt NL {
    printf("No of nested if statements = %d\n", count);
    exit(0);
}
;

if_stmt: IF '(' cond ')' '{' if_stmt '}' {
    count++;
}
| S
;

cond: x RELOP x
;

x: ID | NUMBER
;

%%

int yyerror(char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 1;
}

int main() {
    printf("Enter the statement:\n");
    yyparse();
    return 0;
}

int yywrap() {
    return 1;
}
