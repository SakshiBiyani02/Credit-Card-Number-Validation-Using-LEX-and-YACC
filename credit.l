%{
#include "credit.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
%}

%option noyywrap

%%

[0-9]{13,19}  { yylval.str = strdup(yytext); return CARD_NUMBER; }
[ \t\n]+      { /* Ignore whitespace */ }
.             { yyerror("Invalid character in input"); }

%%
