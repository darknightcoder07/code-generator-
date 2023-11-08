%{
#include <stdio.h>
%}

%%
int|char|float|return { printf("%s=> Keywords\n", yytext); }
#.* { printf("\n%s=>Preprocessor Directive", yytext); }
printf|scanf|main { printf("\n%s=>functions", yytext); }
[a-zA-Z]+ { printf("\n%s=>Identifiers", yytext); }
\"[a-zA-Z]*\" { printf("\n%s=>String Literals", yytext); }
[0-9]+ { printf("\n%s=>Integer Literals", yytext); }
[+\-*/%] { printf("\n%s=>Operators", yytext); }
[,\(\)\[\]\{\};&] { printf("\n%s=>Special Characters", yytext); }
%%

int main() {
    FILE *fp;
    fp = fopen("input.txt", "r");
    yyin = fp;
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
