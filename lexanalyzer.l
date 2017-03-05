digit [0-9]
letter [A-Za-z]
datatypes int|long|short|float|double|char
assignment =
relop <=|>=|==|<|>
%{
#define DATATYPE 0
#define ASSIGNMENT 1
#define RELOP 2
#define IDENTIFIER 3
%}
%%
{datatypes} 			{printf("Datatype found"); return DATATYPE;}
[\t\n] ;
{assignment} 			{printf("Assignment operator found"); return ASSIGNMENT;}
{relop} 			{printf("Relational Operator found"); return RELOP;}
{letter}({letter}|{digit})* 	{printf("Identifier found"); return IDENTIFIER;}
%%
