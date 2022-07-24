%{
	#include <stdio.h>
	extern int yylex();
	void yyerror(char *s);
%}

%union {
	int intval;
	float floatval;
	char *charval;
}

%token VOID
%token CHAR
%token SHORT
%token INT
%token LONG
%token FLOAT
%token DOUBLE
%token SIGNED
%token UNSIGNED
%token CONST
%token AUTO
%token STATIC
%token EXTERN

%token INLINE
%token RETURN
%token CASE
%token IF
%token ELSE
%token DO
%token WHILE
%token FOR
%token SWITCH
%token DEFAULT
%token CONTINUE
%token BREAK
%token GOTO

%token RESTRICT
%token VOLATILE
%token SIZEOF
%token REGISTER

%token IDENTIFIER

%token<intval> INTEGER_CONSTANT
%token<floatval> FLOATING_CONSTANT
%token<charval> CHARACTER_CONSTANT
%token<charval> STRING_LITERAL

%token DEREF
%token INC
%token DEC
%token DOT
%token DOTS

%token ADD
%token SUB
%token MUL
%token DIV
%token NEG
%token NOT
%token MODULO

%token EQ
%token NEQ
%token AND
%token OR

%token LEFT_PAREN
%token RIGHT_PAREN
%token LEFT_SQUARE_BRACKET
%token RIGHT_SQUARE_BRACKET
%token LEFT_BRACKET
%token RIGHT_BRACKET

%token BITWISE_AND
%token BITWISE_XOR
%token BITWISE_OR
%token BINARY_AND_EQUAL
%token BINARY_XOR_EQUAL
%token BINARY_OR_EQUAL

%token MULTIPLY_EQUAL
%token DIVIDE_EQUAL
%token MOD_EQUAL
%token SHIFT_LEFT_EQUAL
%token SHIFT_RIGHT_EQUAL
%token PLUS_EQUAL
%token MINUS_EQUAL

%token SHIFT_LEFT
%token SHIFT_RIGHT
%token LESS
%token MORE
%token LESS_EQUAL
%token MORE_EQUAL

%token QUESTION
%token COLON
%token SEMICOLON
%token ASSIGN
%token COMMA

%start translation_unit

%right THEN ELSE
%%

translation_unit
	: external_declaration {
		printf("translation_unit -> external_declaration\n");
	}
	| translation_unit external_declaration {
		printf("translation_unit -> translation_unit external_declaration\n");
	}
	;

external_declaration
	: function_definition {
		printf("external_declaration -> function_definition\n");
	}
	| declaration {
		printf("external_declaration -> declaration\n");
	}
	;

declaration_list_opt
	: declaration_list {
		printf("declaration_list_opt -> declaration_list\n");
	}
	| /* epsilon */
	;

function_definition
	: declaration_specifiers declarator declaration_list_opt compound_statement {
		printf("function_definition -> declaration_specifiers declarator declaration_list_opt compound_statement\n");
	}
	;

declaration_list
	: declaration {
		printf("declaration_list -> declaration\n");
	}
	| declaration_list declaration {
		printf("declaration_list -> declaration_list declaration\n");
	}
	;

declaration
	: declaration_specifiers init_declarator_list_opt SEMICOLON {
		printf("declaration -> declaration_specifiers init_declarator_list_opt SEMICOLON\n");
	}
	;

init_declarator_list_opt
	: init_declarator_list {
		printf("init_declarator_list_opt -> init_declarator_list\n");
	}
	| /* epsilon */
	;

declaration_specifiers_opt
	: declaration_specifiers {
		printf("declaration_specifiers_opt -> declaration_specifiers\n");
	}
	| /* epsilon */
	;

declaration_specifiers
	: storage_class_specifier declaration_specifiers_opt {
		printf("declaration_specifiers -> storage_class_specifier declaration_specifiers_opt\n");
	}
	| type_specifier declaration_specifiers_opt {
		printf("declaration_specifiers -> type_specifier declaration_specifiers_opt\n");
	}
	| type_qualifier declaration_specifiers_opt {
		printf("declaration_specifiers -> type_qualifier declaration_specifiers_opt\n");
	}
	| function_specifier declaration_specifiers_opt {
		printf("declaration_specifiers -> function_specifier declaration_specifiers_opt\n");
	}
	;

init_declarator_list
	: init_declarator {
		printf("init_declarator_list -> init_declarator\n");
	}
	| init_declarator_list COMMA init_declarator {
		printf("init_declarator_list -> init_declarator_list COMMA init_declarator\n");
	}
	;

init_declarator
	: declarator {
		printf("init_declarator -> declarator\n");
	}
	| declarator ASSIGN initializer {
		printf("init_declarator -> declarator ASSIGN initializer\n");
	}
	;

storage_class_specifier
	: EXTERN {
		printf("storage_class_specifier -> EXTERN\n");
	}
	| STATIC {
		printf("storage_class_specifier -> STATIC\n");
	}
	| AUTO {
		printf("storage_class_specifier -> AUTO\n");
	}
	| REGISTER {
		printf("storage_class_specifier -> REGISTER\n");
	}
	;

type_specifier
	: VOID {
		printf("type_specifier -> VOID\n");
	}
	| CHAR {
		printf("type_specifier -> CHAR\n");
	}
	| SHORT {
		printf("type_specifier -> SHORT\n");
	}
	| INT {
		printf("type_specifier -> INT\n");
	}
	| LONG {
		printf("type_specifier -> LONG\n");
	}
	| FLOAT {
		printf("type_specifier -> FLOAT\n");
	}
	| DOUBLE {
		printf("type_specifier -> DOUBLE\n");
	}
	| SIGNED {
		printf("type_specifier -> SIGNED\n");
	}
	| UNSIGNED {
		printf("type_specifier -> UNSIGNED\n");
	}
	;

specifier_qualifier_list_opt
	: specifier_qualifier_list {
		printf("specifier_qualifier_list_opt -> specifier_qualifier_list\n");
	}
	| /* epsilon */
	;

specifier_qualifier_list
	: type_specifier specifier_qualifier_list_opt {
		printf("specifier_qualifier_list -> type_specifier specifier_qualifier_list_opt\n");
	}
	| type_qualifier specifier_qualifier_list_opt {
		printf("specifier_qualifier_list -> type_qualifier specifier_qualifier_list_opt\n");
	}
	;

type_qualifier
	: CONST {
		printf("type_qualifier -> CONST\n");
	}
	| RESTRICT {
		printf("type_qualifier -> RESTRICT\n");
	}
	| VOLATILE {
		printf("type_qualifier -> VOLATILE\n");
	}
	;

function_specifier
	: INLINE {
		printf("function_specifier -> INLINE\n");
	}
	;

primary_expression
	: IDENTIFIER {
		printf("primary_expression -> IDENTIFIER\n");
	}
	| const {
		printf("primary_expression -> const\n");
	}
	| STRING_LITERAL {
		printf("primary_expression -> STRING_LITERAL\n");
	}
	| LEFT_PAREN expression RIGHT_PAREN {
		printf("primary_expression -> LEFT_PAREN expression RIGHT_PAREN\n");
	}
	;

const
	: INTEGER_CONSTANT {
		printf("const -> INTEGER_CONSTANT\n");
	}
	| FLOATING_CONSTANT {
		printf("const -> FLOATING_CONSTANT\n");
	}
	| CHARACTER_CONSTANT {
		printf("const -> CHARACTER_CONSTANT\n");
	}
	;

argument_expression_list_opt
	: argument_expression_list {
		printf("argument_expression_list_opt -> argument_expression_list\n");
	}
	| /* epsilon */
	;

postfix_expression
	: primary_expression {
		printf("postfix_expression -> primary_expression\n");
	}
	| postfix_expression LEFT_SQUARE_BRACKET expression RIGHT_SQUARE_BRACKET {
		printf("postfix_expression -> postfix_expression LEFT_SQUARE_BRACKET expression RIGHT_SQUARE_BRACKET\n");
	}
	| postfix_expression LEFT_PAREN argument_expression_list_opt RIGHT_PAREN {
		printf("postfix_expression -> postfix_expression LEFT_PAREN argument_expression_list_opt RIGHT_PAREN\n");
	}
	| postfix_expression DOT IDENTIFIER {
		printf("postfix_expression -> postfix_expression DOT IDENTIFIER\n");
	}
	| postfix_expression DEREF IDENTIFIER {
		printf("postfix_expression -> postfix_expression DEREF IDENTIFIER\n");
	}
	| postfix_expression INC {
		printf("postfix_expression -> postfix_expression INC\n");
	}
	| postfix_expression DEC {
		printf("postfix_expression -> postfix_expression DEC\n");
	}
	| LEFT_PAREN type_name RIGHT_PAREN LEFT_BRACKET initializer_list RIGHT_BRACKET {
		printf("postfix_expression -> LEFT_PAREN type_name RIGHT_PAREN LEFT_BRACKET initializer_list RIGHT_BRACKET\n");
	}
	| LEFT_PAREN type_name RIGHT_PAREN LEFT_BRACKET initializer_list COMMA RIGHT_BRACKET {
		printf("postfix_expression -> LEFT_PAREN type_name RIGHT_PAREN LEFT_BRACKET initializer_list COMMA RIGHT_BRACKET\n");
	}
	;

argument_expression_list
	: assignment_expression {
		printf("argument_expression_list -> assignment_expression\n");
	}
	| argument_expression_list COMMA assignment_expression {
		printf("argument_expression_list -> argument_expression_list COMMA assignment_expression\n");
	}
	;

unary_expression
	: postfix_expression {
		printf("unary_expression -> postfix_expression\n");
	}
	| INC unary_expression {
		printf("unary_expression -> INC unary_expression\n");
	}
	| DEC unary_expression {
		printf("unary_expression -> DEC unary_expression\n");
	}
	| unary_operator cast_expression {
		printf("unary_expression -> unary_operator cast_expression\n");
	}
	| SIZEOF unary_expression {
		printf("unary_expression -> SIZEOF unary_expression\n");
	}
	| SIZEOF LEFT_PAREN type_name RIGHT_PAREN {
		printf("unary_expression -> SIZEOF LEFT_PAREN type_name RIGHT_PAREN\n");
	}
	;

unary_operator
	: BITWISE_AND {
		printf("unary_operator -> BITWISE_AND\n");
	}
	| MUL {
		printf("unary_operator -> MUL\n");
	}
	| ADD {
		printf("unary_operator -> ADD\n");
	}
	| SUB {
		printf("unary_operator -> SUB\n");
	}
	| NEG {
		printf("unary_operator -> NEG\n");
	}
	| NOT {
		printf("unary_operator -> NOT\n");
	}
	;

cast_expression
	: unary_expression {
		printf("cast_expression -> unary_expression\n");
	}
	| LEFT_PAREN type_name RIGHT_PAREN cast_expression {
		printf("cast_expression -> LEFT_PAREN type_name RIGHT_PAREN cast_expression\n");
	}
	;

multiplicative_expression
	: cast_expression {
		printf("multiplicative_expression -> cast_expression\n");
	}
	| multiplicative_expression MUL cast_expression {
		printf("multiplicative_expression -> multiplicative_expression MUL cast_expression\n");
	}
	| multiplicative_expression DIV cast_expression {
		printf("multiplicative_expression -> multiplicative_expression DIV cast_expression\n");
	}
	| multiplicative_expression MODULO cast_expression {
		printf("multiplicative_expression -> multiplicative_expression MODULO cast_expression\n");
	}
	;

additive_expression
	: multiplicative_expression {
		printf("additive_expression -> multiplicative_expression\n");
	}
	| additive_expression ADD multiplicative_expression {
		printf("additive_expression -> additive_expression ADD multiplicative_expression\n");
	}
	| additive_expression SUB multiplicative_expression {
		printf("additive_expression -> additive_expression SUB multiplicative_expression\n");
	}
	;

shift_expression
	: additive_expression {
		printf("shift_expression -> additive_expression\n");
	}
	| shift_expression SHIFT_LEFT additive_expression {
		printf("shift_expression -> shift_expression SHIFT_LEFT additive_expression\n");
	}
	| shift_expression SHIFT_RIGHT additive_expression {
		printf("shift_expression -> shift_expression SHIFT_RIGHT additive_expression\n");
	}
	;

relational_expression
	: shift_expression {
		printf("relational_expression -> shift_expression\n");
	}
	| relational_expression LESS shift_expression {
		printf("relational_expression -> relational_expression LESS shift_expression\n");
	}
	| relational_expression MORE shift_expression {
		printf("relational_expression -> relational_expression MORE shift_expression\n");
	}
	| relational_expression LESS_EQUAL shift_expression {
		printf("relational_expression -> relational_expression LESS_EQUAL shift_expression\n");
	}
	| relational_expression MORE_EQUAL shift_expression {
		printf("relational_expression -> relational_expression MORE_EQUAL shift_expression\n");
	}
	;

equality_expression
	: relational_expression {
		printf("equality_expression -> relational_expression\n");
	}
	| equality_expression EQ relational_expression {
		printf("equality_expression -> equality_expression EQ relational_expression\n");
	}
	| equality_expression NEQ relational_expression {
		printf("equality_expression -> equality_expression NEQ relational_expression\n");
	}
	;

AND_expression
	: equality_expression {
		printf("AND_expression -> equality_expression\n");
	}
	| AND_expression BITWISE_AND equality_expression {
		printf("AND_expression -> AND_expression BITWISE_AND equality_expression\n");
	}
	;

exclusive_OR_expression
	: AND_expression {
		printf("exclusive_OR_expression -> AND_expression\n");
	}
	| exclusive_OR_expression BITWISE_XOR AND_expression {
		printf("exclusive_OR_expression -> exclusive_OR_expression BITWISE_XOR AND_expression\n");
	}
	;

inclusive_OR_expression
	: exclusive_OR_expression {
		printf("inclusive_OR_expression -> exclusive_OR_expression\n");
	}
	| inclusive_OR_expression BITWISE_OR exclusive_OR_expression {
		printf("inclusive_OR_expression -> inclusive_OR_expression BITWISE_OR exclusive_OR_expression\n");
	}
	;

logical_AND_expression
	: inclusive_OR_expression {
		printf("logical_AND_expression -> inclusive_OR_expression\n");
	}
	| logical_AND_expression AND inclusive_OR_expression {
		printf("logical_AND_expression -> logical_AND_expression AND inclusive_OR_expression\n");
	}
	;

logical_OR_expression
	: logical_AND_expression {
		printf("logical_OR_expression -> logical_AND_expression\n");
	}
	| logical_OR_expression OR logical_AND_expression {
		printf("logical_OR_expression -> logical_OR_expression OR logical_AND_expression\n");
	}
	;

conditional_expression
	: logical_OR_expression {
		printf("conditional_expression -> logical_OR_expression\n");
	}
	| logical_OR_expression QUESTION expression COLON conditional_expression {
		printf("conditional_expression -> logical_OR_expression QUESTION expression COLON conditional_expression\n");
	}
	;

assignment_expression
	: conditional_expression {
		printf("assignment_expression -> conditional_expression\n");
	}
	| unary_expression assignment_operator assignment_expression {
		printf("assignment_expression -> unary_expression assignment_operator assignment_expression\n");
	}
	;

assignment_operator 
	: ASSIGN {
		printf("assignment_operator -> ASSIGN\n");
	}
	| MULTIPLY_EQUAL {
		printf("assignment_operator -> MULTIPLY_EQUAL\n");
	}
	| DIVIDE_EQUAL {
		printf("assignment_operator -> DIVIDE_EQUAL\n");
	}
	| MOD_EQUAL {
		printf("assignment_operator -> MOD_EQUAL\n");
	}
	| PLUS_EQUAL {
		printf("assignment_operator -> PLUS_EQUAL\n");
	}
	| MINUS_EQUAL {
		printf("assignment_operator -> MINUS_EQUAL\n");
	}
	| SHIFT_LEFT_EQUAL {
		printf("assignment_operator -> SHIFT_LEFT_EQUAL\n");
	}
	| SHIFT_RIGHT_EQUAL {
		printf("assignment_operator -> SHIFT_RIGHT_EQUAL\n");
	}
	| BINARY_AND_EQUAL {
		printf("assignment_operator -> BINARY_AND_EQUAL\n");
	}
	| BINARY_XOR_EQUAL {
		printf("assignment_operator -> BINARY_XOR_EQUAL\n");
	}
	| BINARY_OR_EQUAL {
		printf("assignment_operator -> BINARY_OR_EQUAL\n");
	}
	;

expression
	: assignment_expression {
		printf("expression -> assignment_expression\n");
	}
	| expression COMMA assignment_expression {
		printf("expression -> expression COMMA assignment_expression\n");
	}
	;

const_expression
	: conditional_expression {
		printf("const_expression -> conditional_expression\n");
	}
	;

pointer_opt 
	: pointer {
		printf("pointer_opt -> pointer\n");
	}
	| /* epsilon */
	;

declarator
	: pointer_opt direct_declarator {
		printf("declarator -> pointer_opt direct_declarator\n");
	}
	;

type_qualifier_list_opt
	: type_qualifier_list {
		printf("type_qualifier_list_opt -> type_qualifier_list\n");
	}
	| /* epsilon */
	;

assignment_expression_opt
	: assignment_expression {
		printf("assignment_expression_opt -> assignment_expression\n");
	}
	| /* epsilon */
	;

direct_declarator
	: IDENTIFIER {
		printf("direct_declarator -> IDENTIFIER\n");
	}
	| LEFT_PAREN declarator RIGHT_PAREN {
		printf("direct_declarator -> LEFT_PAREN declarator RIGHT_PAREN\n");
	}
	| direct_declarator LEFT_SQUARE_BRACKET type_qualifier_list_opt assignment_expression_opt RIGHT_SQUARE_BRACKET {
		printf("direct_declarator -> direct_declarator LEFT_SQUARE_BRACKET type_qualifier_list_opt assignment_expression_opt RIGHT_SQUARE_BRACKET\n");
	}
	| direct_declarator LEFT_SQUARE_BRACKET STATIC type_qualifier_list_opt assignment_expression RIGHT_SQUARE_BRACKET {
		printf("direct_declarator -> direct_declarator LEFT_SQUARE_BRACKET STATIC type_qualifier_list_opt assignment_expression RIGHT_SQUARE_BRACKET\n");
	}
	| direct_declarator LEFT_SQUARE_BRACKET type_qualifier_list_opt MUL RIGHT_SQUARE_BRACKET {
		printf("direct_declarator -> direct_declarator LEFT_SQUARE_BRACKET type_qualifier_list_opt MUL RIGHT_SQUARE_BRACKET\n");
	}
	| direct_declarator LEFT_PAREN parameter_type_list RIGHT_PAREN {
		printf("direct_declarator -> direct_declarator LEFT_PAREN parameter_type_list RIGHT_PAREN\n");
	}
	| direct_declarator LEFT_PAREN IDENTIFIER_list RIGHT_PAREN {
		printf("direct_declarator -> direct_declarator LEFT_PAREN IDENTIFIER_list RIGHT_PAREN\n");
	}
	| direct_declarator LEFT_PAREN RIGHT_PAREN {
		printf("direct_declarator -> direct_declarator LEFT_PAREN RIGHT_PAREN\n");
	}
	;

pointer
	: MUL type_qualifier_list_opt {
		printf("pointer -> MUL type_qualifier_list_opt\n");
	}
	| MUL type_qualifier_list_opt pointer {
		printf("pointer -> MUL type_qualifier_list_opt pointer\n");
	}
	;

type_qualifier_list
	: type_qualifier {
		printf("type_qualifier_list -> type_qualifier\n");
	}
	| type_qualifier_list type_qualifier {
		printf("type_qualifier_list -> type_qualifier_list type_qualifier\n");
	}
	;

parameter_type_list
	: parameter_list {
		printf("parameter_type_list -> parameter_list\n");
	}
	| parameter_list COMMA DOTS {
		printf("parameter_type_list -> parameter_list COMMA DOTS\n");
	}
	;

parameter_list
	: parameter_declaration {
		printf("parameter_list -> parameter_declaration\n");
	}
	| parameter_list COMMA parameter_declaration {
		printf("parameter_list -> parameter_list COMMA parameter_declaration\n");
	}
	;

parameter_declaration
	: declaration_specifiers declarator {
		printf("parameter_declaration -> declaration_specifiers declarator\n");
	}
	| declaration_specifiers {
		printf("parameter_declaration -> declaration_specifiers\n");
	}
	;

IDENTIFIER_list
	: IDENTIFIER {
		printf("IDENTIFIER_list -> IDENTIFIER\n");
	}
	| IDENTIFIER_list COMMA IDENTIFIER {
		printf("IDENTIFIER_list -> IDENTIFIER_list COMMA IDENTIFIER\n");
	}
	;

type_name
	: specifier_qualifier_list {
		printf("type_name -> specifier_qualifier_list\n");
	}
	;

initializer
	: assignment_expression {
		printf("initializer -> assignment_expression\n");
	}
	| LEFT_BRACKET initializer_list RIGHT_BRACKET {
		printf("initializer -> LEFT_BRACKET initializer_list RIGHT_BRACKET\n");
	}
	| LEFT_BRACKET initializer_list COMMA RIGHT_BRACKET {
		printf("initializer -> LEFT_BRACKET initializer_list COMMA RIGHT_BRACKET\n");
	}
	;

designation_opt
	: designation {
		printf("designation_opt -> designation\n");
	}
	| /* epsilon */
	;

initializer_list
	: designation_opt initializer {
		printf("initializer_list -> designation_opt initializer\n");
	}
	| initializer_list COMMA designation_opt initializer {
		printf("initializer_list -> initializer_list COMMA designation_opt initializer\n");
	}
	;

designation
	: designator_list ASSIGN {
		printf("designation -> designator_list ASSIGN\n");
	}
	;

designator_list
	: designator {
		printf("designator_list -> designator\n");
	}
	| designator_list designator {
		printf("designator_list -> designator_list designator\n");
	}
	;

designator
	: LEFT_SQUARE_BRACKET const_expression RIGHT_SQUARE_BRACKET {
		printf("designator -> LEFT_SQUARE_BRACKET const_expression RIGHT_SQUARE_BRACKET\n");
	}
	| DOT IDENTIFIER {
		printf("designator -> DOT IDENTIFIER\n");
	}
	;

statement
	: labelled_statement {
		printf("statement -> labelled_statement\n");
	}
	| compound_statement {
		printf("statement -> compound_statement\n");
	}
	| exp_statement {
		printf("statement -> exp_statement\n");
	}
	| selection_statement {
		printf("statement -> selection_statement\n");
	}
	| iteration_statement {
		printf("statement -> iteration_statement\n");
	}
	| jump_statement {
		printf("statement -> jump_statement\n");
	}
	;

labelled_statement
	: IDENTIFIER COLON statement {
		printf("labelled_statement -> IDENTIFIER COLON statement\n");
	}
	| CASE const_expression COLON statement {
		printf("labelled_statement -> CASE const_expression COLON statement\n");
	}
	| DEFAULT COLON statement {
		printf("labelled_statement -> DEFAULT COLON statement\n");
	}
	;

block_item_list_opt
	: block_item_list {
		printf("block_item_list_opt -> block_item_list\n");
	}
	| /* epsilon */
	;

compound_statement
	: LEFT_BRACKET block_item_list_opt RIGHT_BRACKET {
		printf("compound_statement -> LEFT_BRACKET block_item_list_opt RIGHT_BRACKET\n");
	}
	;

block_item_list
	: block_item {
		printf("block_item_list -> block_item\n");
	}
	| block_item_list block_item {
		printf("block_item_list -> block_item_list block_item\n");
	}
	;

block_item
	: declaration {
		printf("block_item -> declaration\n");
	}
	| statement {
		printf("block_item -> statement\n");
	}
	;

exp_opt
	: expression {
		printf("exp_opt -> expression\n");
	}
	| /* epsilon */
	;

exp_statement
	: exp_opt SEMICOLON {
		printf("exp_statement -> exp_opt SEMICOLON\n");
	}
	;

selection_statement_base
	: IF LEFT_PAREN expression RIGHT_PAREN statement {
		printf("selection_statement_base -> IF LEFT_PAREN expression RIGHT_PAREN statement\n");
	}
	;

selection_statement
	: selection_statement_base %prec THEN {
		printf("selection_statement -> selection_statement_base _ THEN\n");
	}
	| selection_statement_base ELSE statement {
		printf("selection_statement -> selection_statement_base ELSE statement\n");
	}
	| SWITCH LEFT_PAREN expression RIGHT_PAREN statement {
		printf("selection_statement -> SWITCH LEFT_PAREN expression RIGHT_PAREN statement\n");
	}
	;

iteration_statement
	: WHILE LEFT_PAREN expression RIGHT_PAREN statement {
		printf("iteration_statement -> WHILE LEFT_PAREN expression RIGHT_PAREN statement\n");
	}
	| DO statement WHILE LEFT_PAREN expression RIGHT_PAREN SEMICOLON {
		printf("iteration_statement -> DO statement WHILE LEFT_PAREN expression RIGHT_PAREN SEMICOLON\n");
	}
	| FOR LEFT_PAREN exp_opt SEMICOLON exp_opt SEMICOLON exp_opt RIGHT_PAREN statement {
		printf("iteration_statement -> FOR LEFT_PAREN exp_opt SEMICOLON exp_opt SEMICOLON exp_opt RIGHT_PAREN statement\n");
	}
	| FOR LEFT_PAREN declaration exp_opt SEMICOLON exp_opt RIGHT_PAREN statement {
		printf("iteration_statement -> FOR LEFT_PAREN declaration exp_opt SEMICOLON exp_opt RIGHT_PAREN statement\n");
	}
	;

jump_statement
	: GOTO IDENTIFIER SEMICOLON {
		printf("jump_statement -> GOTO IDENTIFIER SEMICOLON\n");
	}
	| CONTINUE SEMICOLON {
		printf("jump_statement -> CONTINUE SEMICOLON\n");
	}
	| BREAK SEMICOLON {
		printf("jump_statement -> BREAK SEMICOLON\n");
	}
	| RETURN exp_opt SEMICOLON {
		printf("jump_statement -> RETURN exp_opt SEMICOLON\n");
	}
	;

%%

void yyerror(char *s)
{
    printf("%s\n", s);
}