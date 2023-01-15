/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TYPE = 258,
    IF = 259,
    ELSE = 260,
    WHILE = 261,
    DO = 262,
    FOR = 263,
    SWITCH = 264,
    CASE = 265,
    DEFAULT = 266,
    BREAK = 267,
    CONTI = 268,
    READ = 269,
    WRITE = 270,
    RELOP = 271,
    ADDOP = 272,
    MULOP = 273,
    PPMM = 274,
    NUM = 275,
    ID = 276,
    LOR = 277,
    LAND = 278,
    UM = 279,
    POSOP = 280
  };
#endif
/* Tokens.  */
#define TYPE 258
#define IF 259
#define ELSE 260
#define WHILE 261
#define DO 262
#define FOR 263
#define SWITCH 264
#define CASE 265
#define DEFAULT 266
#define BREAK 267
#define CONTI 268
#define READ 269
#define WRITE 270
#define RELOP 271
#define ADDOP 272
#define MULOP 273
#define PPMM 274
#define NUM 275
#define ID 276
#define LOR 277
#define LAND 278
#define UM 279
#define POSOP 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 16 "CntrlL.y" /* yacc.c:1909  */

  int   Int;
  char *Name;

#line 109 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
