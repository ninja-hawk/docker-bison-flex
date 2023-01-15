%{
/* 文法ファイル"test.y"からコンパイルされた構文解析プログラム（パーサファイル）*/
#include "y.tab.h"
%}

/* 定義部 */
ws     [\t]
symbol [+\-*%/\^<>()[\]\n]
digit  [0-9]
other  .    /* 字句パターンを定義 */

/* 翻訳規則部 */
%%
{ws}+
{symbol}              { return(yytext[0]); }
"sqrt"                { return(SQRT); }
"sin"                 { return(SIN); }
"arcsin"              { return(ARCSIN); }
{digit} +             { sscanf(yytext, "%d", &yylval.ival); return(INTNUM); }
{digit} + "."{digit}* { sscanf(yytext, "%lf", &yylval.dval);
                        return(DNUM); }
{other}               { fprintf(stderr, "Illegal char '%c' ignored\n", yytext[0]); }
%%
