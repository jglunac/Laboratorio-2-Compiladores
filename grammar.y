 %{
	#include <ctype.h>
	#include <stdio.h>
	#include <stdbool.h>
	#define YYSTYPE double /* double type for Yacc stack */
	
	extern int yylex();
	void yyerror(char *msg);
%}

%token OR
%token AND
%token NOT
%token TRUE
%token FALSE

%%
lines	: lines bexpr '\n'		{ if($2 == 1)
									{
									printf("True");
									}
									else
									{
									printf("False");
									}
								;}
		| lines '\n'
		| /* empty */;
		
bexpr	: bexpr OR bterm 		{ if($1 == 1 || $3 == 1) 
									{
									$$=1;
									}
									else
									{
									$$=0;
									}}
		| bterm;		  
		
bterm	: bterm AND bfactor		{ if($1 == 1 && $3 == 1) 
									{
									$$=1;
									}
									else
									{
									$$=0;
									}}
		| bfactor;
		
bfactor	: NOT bfactor			{ if($2 == 0) 
									{
									$$=1;
									}
									else
									{
									$$=0;
									}}
		| '(' bexpr ')'			{ $$ = $2 }
		| TRUE					
		| FALSE;				
		
%%

#include "lex.yy.c"

void yyerror(char *msg){
	printf("Error de sintaxis");
	exit(0);
}

int main(){
	yyparse();
	return 0;
}