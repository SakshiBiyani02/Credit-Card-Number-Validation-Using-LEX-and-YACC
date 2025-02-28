%{
#include <iostream>
#include <cstring>
#include <cstdlib>
using namespace std;

// Declare yylex to link with Flex
int yylex();
int validate_card(const char *number);
void yyerror(const char *s);
%}

%union {
    char *str;
}

%token <str> CARD_NUMBER
%%

input:
    | input line
    ;

line:
    CARD_NUMBER {
        if (validate_card($1)) {
            cout << "Valid Credit Card Number: " << $1 << endl;
        } else {
            cout << "Invalid Credit Card Number: " << $1 << endl;
        }
        free($1); // Free allocated memory
    }
    | error {
        yyerror("Invalid input format");
        yyerrok;
    }
    ;

%%

void yyerror(const char *s) {
    cerr << "Error: " << s << endl;
}

int validate_card(const char *number) {
    int len = strlen(number);
    int sum = 0;
    int is_second = 0;

    for (int i = len - 1; i >= 0; --i) {
        int digit = number[i] - '0';
        if (is_second) {
            digit *= 2;
            if (digit > 9) {
                digit -= 9;
            }
        }
        sum += digit;
        is_second = !is_second;
    }
    return (sum % 10 == 0);
}

int main() {
    cout << "Enter credit card numbers to validate:\n";
    yyparse();
    return 0;
}
