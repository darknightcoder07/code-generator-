%{
#include "5.tab.h"
%}
%%
[0-9]+ { yylval.integer = atoi(yytext); return INTEGER; }
true|false { yylval.boolean = (*yytext == 't'); return BOOLEAN; }
[a-zA-Z][a-zA-Z0-9]* { yylval.string = strdup(yytext); return ID; }
[-+*/=;()] { return *yytext; }
[ \t\n] ; // Skip whitespace
. { printf("Float value not allowed: %s\n"); }
%%