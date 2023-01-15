/* 数式の計算 */

%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <math.h>
int  yylex(void);
void yyerror(const char *s);
%}

%start input /* 開始記号の宣言 */
%token NUM /* トークンの定義 */

%%
input   :input line
        |line
        ;

line    : expr  '\n' { printf("%d\n", $1); }
        ;

expr    : expr  '+' term { $$ = $1 + $3; }  
        | expr  '-' term { $$ = $1 - $3; }
        | term { $$ = $1; }
        ;

term    : term '*' factor { $$ = $1 * $3; }
        | term '/' factor { $$ = $1 / $3; }
        | term '^' factor { $$ = pow($1, $3); } /*累乗*/
        | term '%' factor { $$ = $1 % $3; } /* 剰余演算子 */
        | factor { $$ = $1; }    
        ;

factor  : '(' expr ')' { $$ = $2; }
        | '-' NUM { $$ = -$2; } /* 負の数 */ 
        | NUM 
        ;
%%

/* 字句解析関数 */
int yylex(){

        int c;
        int zero_div; /* 除算フラグ */

        char div_ope[] ={'/', '%'}; /* 除算発生 */
        char ope[] = {'(', ')', '+', '-', '*', '^', '<', '>'}; /* 演算子 */


        while((c = getchar()) != '\n'){ /* 改行まで軸解析 */
                /* 空白類文字（white space, 空白, タブ）*/ 
                while((c == ' ') || (c == '\t')){ c = getchar(); }
                if (isdigit(c)){ /* 数字の処理 */
                        yylval = c - '0';
                        while (isdigit(c = getchar())) /* 数字列をint型へ */
                                yylval = yylval*10 + (c-'0'); /* 入力文字をもとに戻す */
                        
                        if(zero_div && !(yylval)){
                                zero_div = 0;
                                printf("DivisionByZero\n");
                                exit(1); /* ゼロによる除算 */
                        }
                        ungetc(c, stdin); /* 空白、数字以外の文字 */
                        return NUM;  /* tokenを返す */
                }
                else{   
                        for(int i=0;div_ope[i]!='\0';i++){ /* 除算判定 by div_ope*/
                                if(c == div_ope[i]){ 
                                        zero_div = 1;
                                        return c;
                                }
                        }
                        
                        for(int i=0;ope[i]!='\0';i++){ /* 演算子判定 by ope */
                                if(c == ope[i]){ 
                                        zero_div = 0;
                                        return c; 
                                }
                        }
                }
        }
        return c;
                
}