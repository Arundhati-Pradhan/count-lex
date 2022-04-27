%option noyywrap
%{
	#include<stdio.h>
	#include<stdlib.h>
	int characters = 0, words = 0, sentences = 0, lines = 0, tabs = 0, numbers = 0, spaces = 0;
%}

DIGITS [0-9]+
ALPHA [A-z]+

%%
{DIGITS} {numbers++; characters += yyleng;}
{ALPHA} {words++; characters += yyleng;}
[.] {sentences++; characters += yyleng;}
\n {lines++; characters += yyleng;}
\t {tabs++; characters += yyleng;}
[ ] {spaces++; characters += yyleng;}
. characters++;
%%
int main()
{
	FILE *fp;
	fp = fopen("lex_input.txt", "r");
	yyin = fp;
	yylex();
	fclose(fp);

	printf("\nNo. of characters: %d", characters); 
	printf("\nNo. of words = %d", words);
	printf("\nNo. of numbers = %d", numbers);
	printf("\nNo. of sentences = %d", sentences);
	printf("\nNo. of lines = %d", lines);
	printf("\nNo. of tabs = %d", tabs);
	printf("\nNo. of spaces = %d", spaces);
	return 0;
}
