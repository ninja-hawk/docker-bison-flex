/* 数式の計算 */

%{
#include <stdio.h>
#include <math.h>
int yylex(void);
void yyerror(const char *s);
%}
 
%union{
    int     ival;
    double  dval;
}
 
%start input /* 開始記号の宣言 */

%token SQRT SIN ARCSIN
%token <ival> INTNUM
%token <dval> DNUM
%type <dval> expr
%type <dval> term
%type <dval> factor

%%
input   :input line
        |line
        ;

line    : expr  '\n' { printf("%lf\n", $1); }
        | line  error    '\n'{ yyerrok; }
        ;
 
expr    : expr  '+' term { $$ = $1 + $3; }  
        | expr  '-' term { $$ = $1 - $3; }      
        | SQRT '(' expr ')' { $$ = sqrt($3); } /* 平方根 */
        | SIN  '(' expr ')' { $$ = sin($3); } /* 正弦関数 */
        | ARCSIN  '(' expr ')' { $$ = asin($3); } /* 逆正弦関数 */
        | term
        ;
 
term    : term '*' factor { $$ = $1 * $3; }
        | term '/' factor { $3 ? $$ = $1 / $3 : printf("DivisionByZero\n"); }
        | term '%' factor { $3 ? $$ = (int)$1 % (int)$3 : printf("DivisionByZero\n"); } /* 剰余演算子 */
        | term '^' factor { $$ = pow($1, $3); } /*累乗*/
        | factor { $$ = $1; }   
        ;
 
factor  : '(' expr ')' { $$ = $2; }
        | '-'INTNUM { $$ = -(double)$2; }
        | INTNUM { $$ = (double)$1; }
        | '-'DNUM { $$ = -$2; } /* 負の数 */
        | DNUM { $$ = $1; }
        ;
 
%%

int main(void)
{
    yyparse();
    return 0;
}
