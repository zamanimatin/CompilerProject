grammar Sophia;




COMMENT: '//' ~('\n')* '\n';

// KEYWORDS
CLASS: 'class';
EXTENDS: 'extends';
THIS: 'this';
DEF: 'def';
FUNC: 'func';
RETURN: 'return';
IF: 'if';
ELSE: 'else';
FOR: 'for';
FOREACH: 'foreach';
CONTINUE: 'continue';
BREAK: 'break';


FALSE: 'false';
TRUE: 'true';

VARIABLE: (INT | BOOL |  STRING);
INT: 'int';
BOOL: 'bool';
STRING: 'string';

VOID: 'void';
LIST: 'list';
IN: 'in';
NULL: 'null';
NEW: 'new';
PRINT: 'print';

IDENTIFIER: ([a-z] | [A-Z] | '_') ([0-9] | [a-z] | [A-Z] | '_')* ;

// OPERATORS
LPAR: '(';
RPAR: ')';
ACCESS: '.';
LBRA: '[';
RBRA: ']';
OPOP: ('++' | '--');
ONEOP: ('++' | '--' | '!' | '-');
MULDIV: ('%' | '/' | '*');
SUMSUB: ('+' | '-');
COMPARE: ('>' | '<');
COMPEQ: ('==' | '!=');
AND: '&&';
OR: '||';
ASSIGN: '=';
COMMA: ',';

LCURL: '{';
RCURL: '}';

END: ';';

WS: [ \t] -> skip;