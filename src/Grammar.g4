grammar Grammar;

// Rules
program : function_definition statements;

statements : statement | statement statements;

statement : Identifier Assign expression
            | LeftBrace statements RightBrace
            | if
            | until
            | loop
            | selector
            | write
            | read
            | function_call;

expression : expression operation expression
             | Not expression
             | LeftParen expression RightParen
             | Identifier
             | Number;

// function definition

function_definition : typename (Identifier | MainFunction) LeftParen expression RightParen LeftBrace statements RightBrace;

function_call : Identifier LeftParen expression RightParen Semi;

//

if: If LeftParen expression RightParen So LeftBrace expression RightBrace;

write: Write LeftParen string Comma Identifier RightParen Semi ;

read: Read LeftParen typename Comma Identifier RightParen Semi;

string: String | Character;

loop : Loop LeftParen expression And expression And expression RightParen LeftBrace expression RightBrace;

until : Until LeftParen expression RightParen LeftBrace expression RightBrace;

selector : Selector Colon Identifier LeftBrace (selector_case)+ (selector_end_case)? RightBrace;
selector_case : SelectorCase Number Colon expression;
selector_end_case : SelectorEndCase Colon expression;

typename: CharType | IntType | FloatType;

assign: typename (Identifier ( Assign (Minus | Plus)? (Number | Character | Identifier))? ) ( Comma Identifier ( Assign (Minus | Plus)? (Number | Character | Identifier))? )* Semi;
assign_to : Identifier
            (Assign | StarAssign | DivAssign | PlusAssign | MinusAssign | ModAssign)
            (Minus | Plus)? (Number | Character | Identifier)
            (
                (Plus | Minus | Star | Div | Mod)
                (Minus | Plus)? (Number | Character | Identifier)
            )*
            Semi;

pp_mm: Identifier (PlusPlus | MinusMinus) Semi;

operation : Plus
          | Minus
          | PlusPlus
          | MinusMinus
          | Star
          | Div
          | Mod;

assignOperation : ModAssign
          | StarAssign
          | PlusAssign
          | MinusAssign
          | DivAssign
          | Assign;

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

//general
//Operation : Plus
//          | Minus
//          | PlusPlus
//          | MinusMinus
//          | Star
//          | Div
//          | Mod;
//AssignOperation : ModAssign
//          | StarAssign
//          | PlusAssign
//          | MinusAssign
//          | DivAssign
//          | Assign;

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


OtherChar : ~([0-9a-zA-z]);

Character : ['](Digit | Nondigit | OtherChar)['];

String: ['](Digit | Nondigit | OtherChar)*['];


