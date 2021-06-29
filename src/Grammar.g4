grammar Grammar;

// Rules
program : function_definition statements;

statements : statement | statement statements | WS*;

statement : LeftBrace statements RightBrace
            | if
            | until
            | loop
            | selector
            | write Semi
            | read Semi
            | function_call
            | assign Semi
            | assign_to Semi
            | inc_dec Semi ;

statement_for_expression: write
                          | read
                          | function_call
                          | assign
                          | assign_to
                          | inc_dec;

expression : expression comparators expression
             | Not expression
             | LeftParen expression RightParen
             | statement_for_expression
             | Identifier
             | Number;

// function definition

function_definition : typename (Identifier | MainFunction) LeftParen expression? RightParen LeftBrace statements RightBrace;

function_call : Identifier LeftParen expression RightParen Semi;

//

if: If LeftParen expression RightParen So statement;

write: Write LeftParen string (Comma Identifier)* RightParen  ;

read: Read LeftParen typename Comma Identifier RightParen ;

string: String | Character;

loop : Loop LeftParen (expression ) And expression And expression RightParen  statement ;

until : Until LeftParen expression RightParen statement;

selector : Selector Colon Identifier LeftBrace (selector_case)+ (selector_end_case)? RightBrace;
selector_case : SelectorCase Number Colon statement;
selector_end_case : SelectorEndCase Colon statement;

typename: CharType | IntType | FloatType;

assign: typename ( Identifier ( Assign sign? (Number | Character | Identifier))? ) ( Comma Identifier ( Assign sign? (Number | Character | Identifier))? )* ;
assign_to : Identifier
            assignOperation
            sign? (Number | Character | Identifier)
            ( operation sign? (Number | Character | Identifier) )*;

sign : Minus | Plus;

inc_dec: Identifier (PlusPlus | MinusMinus) ;

operation : Plus
          | Minus
          | Star
          | Div
          | Mod;

assignOperation : ModAssign
                | StarAssign
                | PlusAssign
                | MinusAssign
                | DivAssign
                | Assign;

comparators: Less |
             LessEqual |
             Greater |
             GreaterEqual |
             Equal |
             NotEqual;

// Lexers
MainFunction : 'main';

//Typenames
CharType : 'char' ;
IntType : 'int' ;
FloatType : 'float' ;

//
If : 'if';
So : 'so';
Write : 'write';
Read : 'read';
Selector : 'selector';
SelectorCase : 'select';
SelectorEndCase : 'other';
Loop : 'Loop';
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

LogicalOperation : AndAnd
                 | OrOr;

ComparatorOperation : Less
                    | LessEqual
                    | Greater
                    | GreaterEqual
                    | Equal
                    | NotEqual;
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
SingleQuot : '\'';

//Assigns
Assign : '=';
StarAssign : '*=';
DivAssign : '/=';
ModAssign : '%=';
PlusAssign : '+=';
MinusAssign : '-=';

WS : [ \t]+ -> skip;

Newline: ('\r' '\n'? | '\n') -> skip;

Identifier : Nondigit ( Nondigit | Digit )*;
Number : FloatNumber | IntegerNumber;

IntegerNumber : (Plus | Minus)* Digit+;
FloatNumber : (Plus | Minus)* Digit+ Point Digit+;

fragment
Nondigit : [a-zA-Z_];

fragment
Digit : [0-9];


OtherChar : ~([0-9a-zA-z']);

Character : ['](Digit | Nondigit | OtherChar)['];

String: ['](Digit | Nondigit | OtherChar)*['];


