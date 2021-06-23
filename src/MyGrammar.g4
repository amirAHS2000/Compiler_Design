grammar MyGrammar;

start : 'int' 'main' statement;
statement : '{' expression '}';
expression : 'a';
WS: [ \t]+ -> channel(HIDDEN);