grammar Sophia;






variable :
    IDENTIFIER ':' VARIABLE END;

localvariable :
    // Method grammar should be here
    VARIABLE END;


functionpointer:
    IDENTIFIER ':' '<' (VOID | ((INT | BOOL | STRING) ',')* (INT | BOOL | STRING)) '->' (INT | STRING | BOOL | VOID) '>' END;


list:
    (IDENTIFIER ':' LIST LPAR ((VARIABLE | functionpointer)',')* (VARIABLE | functionpointer) RPAR END )|
    (IDENTIFIER ':' LIST LPAR (IDENTIFIER ':' ((VARIABLE | functionpointer)',')* (VARIABLE | functionpointer)) RPAR END) |
    (IDENTIFIER ':' LIST LPAR ([1-9]+ '#' (VARIABLE | functionpointer)) RPAR END);

access_list_object:
    // Mylist[2]
    IDENTIFIER LBRA INTNUMBER RBRA;

calc_operation:
    // A - B or A + B or A++ or ++A or -20 
    (IDENTIFIER (SUMSUB | MULDIV) IDENTIFIER) END | 
    '-' INTNUMBER END |
    ('--' | '++') IDENTIFIER END |
    IDENTIFIER ('--' | '++') END;



rel_operation:
//  ()+ added since having multiple comparisons in one line
    LPAR INTNUMBER (COMPARE INTNUMBER)+ RPAR |
    
    LPAR INTNUMBER (COMPEQ INTNUMBER)+ RPAR |
    LPAR (FALSE | TRUE) (COMPEQ (FALSE | TRUE))+ RPAR |
    LPAR STRING (COMPEQ STRING)+ RPAR |
    LPAR functionpointer (COMPEQ functionpointer)+ RPAR |
    LPAR list (COMPEQ list)+ RPAR;

log_operation:

    LPAR '!' (TRUE | FALSE) RPAR|
    LPAR (TRUE | FALSE) ((AND | OR)(TRUE | FALSE))+ RPAR;


initialization_statement:
    IDENTIFIER '=' INTNUMBER END;

condition_expresstion:
    IDENTIFIER COMPARE INTNUMBER END;
update_statement:
    IDENTIFIER '=' IDENTIFIER (SUMSUB | MULDIV) INTNUMBER;
for_loop:
    FOR LPAR initialization_statement condition_expresstion update_statement RPAR LCURL /*Code grammar */ RCURL;
    // the code grammar is a statement of any code, please handle it on your own

foreach_loop:
    FOREACH LPAR IDENTIFIER IN list RPAR LCURL /*Code grammar as above */ RCURL;









printfunction:
    PRINT LPAR (INTNUMBER | FALSE | TRUE | STRINGSTATEMENT) RPAR END;












// TOKEN LIST


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
INTNUMBER: [0-9]+;

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
STRINGSTATEMENT: '"' ~('"')+ '"';
END: ';';

WS: [ \t] -> skip;