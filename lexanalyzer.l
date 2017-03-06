digit [0-9]
letter [A-Za-z]
datatypes int|long|short|float|double|char
assignment =
relop >=|<=|==|!=|<|>
logicalop &&|\|\||!
arithmeticop \+|\-|\*|\\|\%
incdecop \+\+|\-\-
ternaryop \?:
bitwise &|\||^|~|<<|>>
escape \\a|\\b|\\f|\\r|\\v|\\\'|\\\"|\\\\|\\\?

%{
#define DATATYPE 0
#define ASSIGNMENT 1
#define RELOP 2
#define LOGICALOP 3
#define ARITHMETIC 4
#define INCDEC 5
#define BITWISE 6
#define TERNARY 7
#define IDENTIFIER 8 
%}

%%
{datatypes}                     {printf("Datatype found"); return DATATYPE;}
[\t\n]                          ;
{escape}                        {printf("Escape Sequence found");}
{relop}                         {printf("Relational Operator found"); return RELOP;}
{assignment}                    {printf("Assignment operator found"); return ASSIGNMENT;}
{bitwise}                       {printf("Bitwise operator found"); return BITWISE;}
{logicalop}                     {printf("Logical Operator found"); return LOGICALOP;}
{arithmeticop}                  {printf("Arithmetic operator found"); return ARITHMETIC;}
{incdecop}                      {printf("Increment/Decrement operator found"); return INCDEC;}
{ternaryop}                     {printf("Ternary operator found"); return TERNARY;}
{letter}({letter}|{digit})*     {printf("Identifier found"); return IDENTIFIER;}
%%
