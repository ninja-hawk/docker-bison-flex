%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int  yylex(void);
void yyerror(const char *s);
%}

%%

input : expr '\n' ;
expr : expr '+' term | expr '-' term | term ;
term : term '*' factor | term '/' factor | factor;
factor : 'i' | '(' expr ')';

%%

int yylex()
{
  return getchar();
}