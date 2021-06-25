grammar Grammar;

// Rules
start : 'int' 'main' statement;
statement : '{' expression '}';
expression : 'expression';  //todo not complete!

if: If LeftParen

// Lexers

//Typenames
Char : 'char' ;
Int : 'int' ;
Float : 'float' ;

//
If : 'if';
So : 'so';
Write : 'write';
Read : 'read';
Selector : 'selector';
Loop : 'loop';
Until : 'until';


//
LeftParen : '(';
RightParen : ')';
LeftBracket : '[';
RightBracket : ']';
LeftBrace : '{';
RightBrace : '}';

//Comparators
Less : '<';
LessEqual : '<=';
Greater : '>';
GreaterEqual : '>=';
Equal : '==';
NotEqual : '!=';

//
Plus : '+';
PlusPlus : '++';
Minus : '-';
MinusMinus : '--';
Star : '*';
Div : '/';
Mod : '%';

//
And : '&';
Or : '|';
AndAnd : '&&';
OrOr : '||';
Caret : '^';
Not : '!';
Tilde : '~';

//
Colon : ':';
Semi : ';';
Comma : ',';

//Assigns
Assign : '=';
StarAssign : '*=';
DivAssign : '/=';
ModAssign : '%=';
PlusAssign : '+=';
MinusAssign : '-=';

Identifier : Nondigit ( Nondigit | Digit )*;

fragment
Nondigit : [a-zA-Z_];

fragment
Digit : [0-9];

