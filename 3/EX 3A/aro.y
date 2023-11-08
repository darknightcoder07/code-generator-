%{
#include<stdio.h>
#include<conio.h>
%}
%token NUM
%left '+' '-'
%left '*' '/'
%left '(' ')'
%%
expr: e{
 printf("result:%d\n",$$);
 return 0;
 }
e:e'+'e {$$=$1+$3;}
|e'-'e {$$=$1-$3;}
|e'*'e {$$=$1*$3;}
|e'/'e {$$=$1/$3;}
|'('e')' {$$=$2;}
| NUM {$$=$1;}
;
%%
int main()
{
 printf("\n enter the arithematic expression:\n");
 yyparse();
 printf("\nvalid expression\n");
}
yyerror()
{
 printf("\n invalid expression\n");
}
int yywrap()
{
return 1;
}
