%{
#include<stdio.h>
#include<stdlib.h>
#include "3d.tab.h"
void yyerror(char *);
extern int yylval;
%}
%%
[\t]+ ;
[0-9]+ {yylval=atoi(yytext); return INTEGER;}
[- + * /] {return *yytext;}
"(" {return *yytext;}
")" {return *yytext;}
\n {return *yytext;}
. {char msg[25];
sprintf(msg,"%s<%s>","invalid character",yytext);
yyerror(msg);
}
