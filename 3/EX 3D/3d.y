%{ 
#include<stdio.h>
#include<stdlib.h>
%}
%token INTEGER
%%
stmt:expr '\n'{ printf("%d \n",$1);}
|'n'
expr:
expr '+' mulex {$$=$1+$3;}
|expr '-' mulex {$$=$1-$3;}
|mulex{$$=$1;}
mulex:
expr '*' term {$$=$1*$3;}
|expr '/'term {$$=$1/$3;}
|term{$$=$1;}
term:
')' expr ')' {$$=$2;}
|INTEGER {$$=$1;}
%%
int yyerror(char*s)
{
fprintf(stderr,"%s\n",s);
return;
}
yywrap()
{
return(1);
}
int main(void)
{
yyparse();
return 0;
}