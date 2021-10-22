true true 
false false
or or 
and and 
not not 

%%
[ \t]		; { /* Espacios en blanco */ }
{true} 	{
	sscanf("1","%lf",&yylval);
	return TRUE;}
	
{false} 	{
	sscanf("0","%lf",&yylval);
	return FALSE;}
	
{or}	{return OR;}
{and}	{return AND;}
{not}	{return NOT;}

[()\n]	return yytext[0];
.		printf("Error lexico\n");
%%

int yywrap(void)
{
	return 0;
}