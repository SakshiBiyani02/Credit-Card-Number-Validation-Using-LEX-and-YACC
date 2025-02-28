# Credit-Card-Number-Validation-Using-LEX-and-YACC
This program validates credit card numbers using LEX and YACC based on the Luhn Algorithm. It accepts credit card numbers as input, checks if they follow the required format, and ensures their validity by implementing the Luhn check. Valid numbers are acknowledged, while invalid ones prompt an error message.
Procedure
1.	Define Tokens in LEX:
-	Use regular expressions to match credit card numbers of 13 to 19 digits.
-	Any other input is flagged as invalid.
2.	Parse and Validate in YACC:
-	Tokenize the input and pass valid card numbers for processing.
-	Implement the Luhn Algorithm:
  - Double every second digit from the right.
  - If doubling results in a two-digit number, add those digits together.
  -	 Sum all the processed digits.
  -	A valid card number has a total sum divisible by 10.
3.	Error Handling:
-	Invalid characters or formats are identified and flagged as errors.
-	Card numbers failing the Luhn check are marked invalid.
4.	Compile and Run:
-	Use bison, flex, and g++ to compile the program.
-	Execute the compiled program and input card numbers for validation.
## Editor Used:
Visual Studio Code 
## Compiler Used:
-	GCC (GNU Compiler Collection) for compiling C and C++ code.
-	Bison and Flex for generating the parser and lexer, respectively.
## Executable Commands
1.	Generate C File from Bison Program: bison -d credit.y . This generates two files , credit.tab.c and credit.tab.h.
2.	Generate C File from Lex Program: flex credit.l
3.	Compile the C File: g++ lex.yy.c credit.tab.c -o credit
4.	Run the Program with Input File: ./credit
## Output
![Output](https://github.com/SakshiBiyani02/Credit-Card-Number-Validation-Using-LEX-and-YACC/blob/main/Screenshot%202025-02-28%20134812.png?raw=true)
This program accepts credit card numbers as input, verifies their format (13 to 19 digits), and validates them using the Luhn Algorithm. Valid numbers are identified, while invalid ones prompt an error message.
## Test case explanation
1. Test Case 1:
Input: 4111111111111111
This card number follows the format (16 digits).
Luhn Check:
-	Double every second digit: 8 2 2 2 2 2 2 2
-	Add digits of results and untouched digits: 8+1+1+1+1+1+1+1 = 30
-	The total sum 30 is divisible by 10.
The program confirms this as a valid credit card number.
2. Test Case 2:
Input: 4000000000000000
Follows the correct format (16 digits).
Luhn Check:
-	Double every second digit: 8 0 0 0 0 0 0 0
-	Add digits of results and untouched digits: 8+0+0+0+0+0+0+0 = 8
-	The total sum 8 is not divisible by 10.
This card number is marked invalid.
