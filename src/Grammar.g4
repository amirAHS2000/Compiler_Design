grammar Grammar;

// Rules
start : Int 'main' statement;
statement : LeftBrace expression RightBrace;
expression : 'expression';  //todo not complete!

if: If LeftParen;

loop : Loop LeftParen expression And expression And expression RightParen LeftBrace expression RightBrace;

until : Until LeftParen expression RightParen LeftBrace expression RightBrace;

selector : Selector Colon Identifier LeftBrace (selector_case)+ (selector_end_case)* RightBrace;
selector_case : SelectorCase Number Colon expression;
selector_end_case : SelectorEndCase Colon expression;

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
SelectorCase : 'select';
SelectorEndCase : 'other';
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
Point : '.';

//Assigns
Assign : '=';
StarAssign : '*=';
DivAssign : '/=';
ModAssign : '%=';
PlusAssign : '+=';
MinusAssign : '-=';

Identifier : Nondigit ( Nondigit | Digit )*;
Number : FloatNumber | IntegerNumber;

IntegerNumber : (Plus | Minus)* Digit+;
FloatNumber : (Plus | Minus)* Digit+ Point Digit+;

fragment
Nondigit : [a-zA-Z_];

fragment
Digit : [0-9];

WS : [ \t]+ -> skip;
