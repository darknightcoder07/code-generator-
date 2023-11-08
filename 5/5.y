%{
#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
int yylex();
void yyerror(const char *s);
%}
%union {
int integer;
char* string;
int boolean;
}
%token ID INTEGER BOOLEAN
%left '+' '-'
%left '*' '/'
%%
program : statements
statements : statement statements
| /* empty */
statement : expression ';' { printf("Statement OK\n"); }
expression : ID '=' expression {
// Type checking code here
printf("Assignment OK\n");
}
| expression '+' expression
| expression '-' expression
| expression '*' expression
| expression '/' expression
| '(' expression ')'
| INTEGER
| BOOLEAN
%%
void yyerror(const char *s) {
printf("Syntax error: %s\n", s);
}
int main() {
yyparse();
return 0;
}
int yywrap() {
return 1;
}