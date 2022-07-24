%{
	#include <stdio.h>
	#include <string.h>
	#include "y.tab.h"
	int line = 1;
%}

%x COMMENT
%x SINGLE_LINE_COMMENT

PREPROCESSOR_DIRECTIVES		"#"[^("\n")]*
DIGIT						[0-9]
IDENTIFIER_NONDIGIT 		[a-zA-Z_]
IDENTIFIER 					{IDENTIFIER_NONDIGIT}({IDENTIFIER_NONDIGIT}|{DIGIT})*

NONZERO_DIGIT				[1-9]
NONZERO_INTEGER_CONST		{NONZERO_DIGIT}({NONZERO_DIGIT}|{DIGIT})*
INTEGER_CONST				{NONZERO_INTEGER_CONST}|"0"
CONST						{INTEGER_CONST}|{FLOATING_CONST}|{CHARACTER_CONST}

DIGIT_SEQUENCE				[0-9]+
EXPONENT_PART				([Ee]([+-]?)({DIGIT_SEQUENCE}))
FRACTIONAL_CONST			{DIGIT_SEQUENCE}\.|{DIGIT_SEQUENCE}?\.{DIGIT_SEQUENCE}
FLOATING_CONST				({DIGIT_SEQUENCE}{EXPONENT_PART})|({FRACTIONAL_CONST}{EXPONENT_PART}?)

ESCAPE_SEQUENCE				"\'"|"\""|"\?"|"\\"|"\a"|"\b"|"\f"|"\n"|"\r"|"\t"|"\v"
C_CHAR 						{ESCAPE_SEQUENCE}|[^("\'"|"\\"|"\n")]
C_CHAR_SEQUENCE				{C_CHAR}+
CHARACTER_CONST				"\'"{C_CHAR_SEQUENCE}"\'"

S_CHAR  					{ESCAPE_SEQUENCE}|[^("\""|"\\"|"\n")]
S_CHAR_SEQUENCE				{S_CHAR}+
STRING_LITERAL				"\""{S_CHAR_SEQUENCE}?"\""

%%
"void"						{ return (VOID) ;}
"char"		  				{ return (CHAR) ;}
"short"						{ return (SHORT) ;}
"int"						{ return (INT) ;}
"long"						{ return (LONG) ;}
"float"						{ return (FLOAT) ;}
"double"					{ return (DOUBLE) ;}
"signed"		  			{ return (SIGNED) ;}
"unsigned"					{ return (UNSIGNED) ;}
"const"						{ return (CONST) ;}
"auto"						{ return (AUTO) ;}
"static"					{ return (STATIC) ;}
"extern"					{ return (EXTERN) ;}

"inline"					{ return (INLINE) ;}
"return"					{ return (RETURN) ;}
"case"						{ return (CASE) ;}
"if"						{ return (IF) ;}
"else"						{ return (ELSE) ;}
"do"						{ return (DO) ;}
"while"						{ return (WHILE) ;}
"for"						{ return (FOR) ;}
"switch"					{ return (SWITCH) ;}
"default"					{ return (DEFAULT) ;}
"continue"					{ return (CONTINUE) ;}
"break"						{ return (BREAK) ;}
"goto"						{ return (GOTO) ;}

"register"					{ return (REGISTER) ;}
"volatile"					{ return (VOLATILE) ;}
"restrict"					{ return (RESTRICT) ;} 
"sizeof"					{ return (SIZEOF) ;}

"/*"                        { BEGIN(COMMENT); }
<COMMENT>"*/"               { BEGIN(INITIAL); }
<COMMENT>.                  { }
<COMMENT>"\n"               { line++; printf("%d\n", line); }
"//"                        { BEGIN(SINGLE_LINE_COMMENT); }
<SINGLE_LINE_COMMENT>"\n"   { line++; BEGIN(INITIAL); }
<SINGLE_LINE_COMMENT>.      { } 
"\n"						{ line++; printf("\n#################### LINE NO : %d ####################\n", line); }

"->" 						{ return (DEREF) ;}
"++"	 					{ return (INC) ;}
"--"						{ return (DEC) ;}
"." 						{ return (DOT) ;}
"..." 						{ return (DOTS) ;}


"+" 						{ return (ADD) ;}
"-" 						{ return (SUB) ;}
"*" 						{ return (MUL) ;}
"/" 						{ return (DIV) ;}
"~" 						{ return (NEG) ;}
"!" 						{ return (NOT) ;}
"%" 						{ return (MODULO) ;}

"==" 						{ return (EQ) ;}
"!=" 						{ return (NEQ) ;}
"&&"						{ return (AND) ;}
"||" 						{ return (OR) ;}

"(" 						{ return (LEFT_PAREN) ;}
")" 						{ return (RIGHT_PAREN) ;}
"[" 						{ return (LEFT_SQUARE_BRACKET) ;}
"]" 						{ return (RIGHT_SQUARE_BRACKET) ;}
"{" 						{ return (LEFT_BRACKET) ;}
"}" 						{ return (RIGHT_BRACKET) ;}

"&" 						{ return (BITWISE_AND) ;}
"^" 						{ return (BITWISE_XOR) ;}
"|" 						{ return (BITWISE_OR) ;}
"&=" 						{ return (BINARY_AND_EQUAL) ;}
"^=" 						{ return (BINARY_XOR_EQUAL) ;}
"|=" 						{ return (BINARY_OR_EQUAL) ;}

"*=" 						{ return (MULTIPLY_EQUAL) ;}
"/=" 						{ return (DIVIDE_EQUAL) ;}
"%=" 						{ return (MOD_EQUAL) ;}
"+=" 						{ return (PLUS_EQUAL) ;}
"-=" 						{ return (MINUS_EQUAL) ;}
"<<=" 						{ return (SHIFT_LEFT_EQUAL) ;}
">>=" 						{ return (SHIFT_RIGHT_EQUAL) ;}

"<<" 						{ return (SHIFT_LEFT) ;}
">>" 						{ return (SHIFT_RIGHT) ;}
"<" 						{ return (LESS) ;}
">" 						{ return (MORE) ;}
"<=" 						{ return (LESS_EQUAL) ;}
">=" 						{ return (MORE_EQUAL) ;}

"?" 						{ return (QUESTION) ;}
":"	 						{ return (COLON) ;}
";" 						{ return (SEMICOLON) ;}
"=" 						{ return (ASSIGN) ;}
"," 						{ return (COMMA) ;}

{IDENTIFIER}				{ return IDENTIFIER ;}
{INTEGER_CONST}				{ return INTEGER_CONSTANT ;}
{FLOATING_CONST}			{ return FLOATING_CONSTANT ;}
{CHARACTER_CONST} 			{ return CHARACTER_CONSTANT ;}
{STRING_LITERAL} 			{ return STRING_LITERAL ;}
{PREPROCESSOR_DIRECTIVES}	{ }
" "|"\t"					{ }

%%
