#include<stdio.h>

#include<string.h>
#include<stdlib.h>
main(){
char a[100],temp[100];
char*word;
char delim[]=";><{}+)(&%#,=";
char variable[10][20],datatype[10][20];
int k,noofvar=0;
void*i;
FILE*p;
p=fopen("add.c","r");
fscanf(p,"%s",a);
strcpy(temp,"NULL");
printf("\nLexeme\tToken\n\n");
while(strcmp(a,"END")!=0){
for(k=0;k<strlen(a);k++){
if(a[k]==';'||a[k]=='<'||a[k]=='{'||a[k]=='>'||a[k]==')'||a[k]=='}'||a[k]=='#'||a[k]=='>'||a[k]==','||a[k]=='&'||a[k]=='='||a[k]=='(')
{
printf("\033[0;37m");
printf("\n%c\t Special Character",a[k]);
}
}
word=strtok(a,delim);
while(word!=NULL){
if((strcmp(word,"scanf")==0)||(strcmp(word,"printf")==0)||(strcmp(word,"main")==0))
{
printf("\033[0;36m");
printf("\n%s\t",word);
printf("BUILD IN FUNCTION\t");
}
else
if((strcmp(word,"int")==0)||(strcmp(word,"float")==0)||(strcmp(word,"char")==0)||(strcmp(word,"void")==0))
{
printf("\033[0;32m");
printf("\n%s\t",word);
printf("KEYWORD\t");
}
else if((strcmp(word,"include")==0))
{
printf("\033[0;32m");
printf( "\n%s\t",word);
printf("PROCESSOR\t");
}
else if((strcmp(temp,"int")==0)||(strcmp(temp,"float")==0)||(strcmp(temp,"char")==0))
{
printf("\033[0;36");
printf("\n%s\t",word);
printf("VARIABLE\t");
strcpy(variable[noofvar],word);
strcpy(datatype[noofvar],temp);
noofvar++;
}
word=strtok(NULL,delim);
}
strcpy(temp,a);
fscanf(p,"%s",a);}
fclose(p);
printf("\n\nSYMBOL TABLE\n");
printf("-------------------\n");
printf("symbol\taddr\ttype\n");
for(k=0;k<noofvar;k++)
{
i=malloc(variable[k][0]);
printf("\033[0;31m");
printf("%s\t%d\t%s\n",variable[k],i,datatype[k]);
}
return 0;
}
