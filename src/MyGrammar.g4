grammar MyGrammar;

start : 'int' 'main' statement;
statement : '{' expression '}';
expression : 'a';  //todo not complete!


//if
if : 'if' '(' expression ')' 'so' '{' expression '}';

//while
while : 'until' '(' expression ')' '{' expression '}';

//switch
switch : 'selector' ':' ID '{' (switch_case)+(switch_end_case)* '}';
switch_case : 'select' NUMBER ':' expression;
switch_end_case : 'other' ':' expression;

//for
for : 'loop' '(' expression '&' expression '&' expression ')' '{' expression '}';

//scan
scan : 'read' '(' (type_name ',' ID (',')* )+  ')' ';';

//print
print : 'write' '(' 'string' ',' NUMBER ')'; //TODO not complete!

//type names
type_name : 'int' | 'float' | 'char' ;

ID: [a-zA-Z][a-zA-Z_0-9]* ;
NUMBER : INT | FLOAT;
INT: [0-9]+ ;
FLOAT : [0-9]+'.'[0-9]+ ;
CHAR : [a-zA-Z] ;
WHITE_SPACE: [ \t]+ -> channel(HIDDEN);