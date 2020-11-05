grammar Sophia;
// TODO: COMMENT'S HANDELING

sophia:
    classDec*;

classDec:
    classWithExtends | classWithoutExtends;

classWithExtends:
    {System.out.print("ClassDec:");}
    CLASS {System.out.print(getCurrentToken().getText());}IDENTIFIER EXTENDS {System.out.print("," + getCurrentToken().getText() + '\n');}IDENTIFIER LCURL classScope RCURL;
classWithoutExtends:
    {System.out.print("ClassDec:");}
    CLASS {System.out.print(getCurrentToken().getText() + '\n');}IDENTIFIER LCURL classScope RCURL;

classScope:
    methVarDec* (constructorDec)? methVarDec*;

constructorDec:
    {System.out.print("ConstructorDec:");}
    DEF {System.out.print(getCurrentToken().getText() + '\n');}IDENTIFIER LPAR (argumentsVar)? RPAR LCURL methodScope RCURL;

methVarDec:
    methodDec | varDec;

methodDec:
    {System.out.print("MethodDec:");}
    DEF (allVariables | VOID) {System.out.print(getCurrentToken().getText() + '\n');}IDENTIFIER LPAR (argumentsVar)? RPAR LCURL methodScope RCURL;

argumentsVar:
    variableArgument (COMMA argumentsVar)?;

methodScope:
    varDec* statement*;

// if
// TODO: experssion hamine ke mikhad?
//if:
//    IF LPAR experssion RPAR;

// TODO: statement hash bedone tayrife moteghayere
// for
forCommand:
    forLoopWithCurl | forLoopWithoutCurl;

forLoopWithoutCurl:
    FOR LPAR (statementAssignment)? END (experssion)? END (statementAssignment)? RPAR statement;

forLoopWithCurl:
    FOR LPAR (statementAssignment)? END (experssion)? END (statementAssignment)? RPAR LCURL forScope RCURL;

foreach:
    foreachWithCurl | foreachWithoutCurl;

foreachWithoutCurl:
    FOREACH LPAR IDENTIFIER IN IDENTIFIER RPAR statement;

foreachWithCurl:
    FOREACH LPAR IDENTIFIER IN IDENTIFIER RPAR LCURL forScope RCURL;

forScope:
    statement*;
// for

print:
    PRINT LPAR experssion RPAR END;



returnCommand:
    {System.out.print("Return\n");}
    RETURN (IDENTIFIER)?;

// TODO
statement:
    (CONTINUE |
    BREAK |
    returnCommand |
    print |
//    if |
//    for |
//    foreach)
    )END;


statementAssignment:
    IDENTIFIER ASSIGN;

// TODO
experssion:
    (IDENTIFIER | INTNUMBER) ;

variableArgument:
    IDENTIFIER ':' allVariables;

// TODO order shayadam bayad bashe
varDec:
    {System.out.print("VarDec:");}
    {System.out.print(getCurrentToken().getText() + '\n');}IDENTIFIER ':' allVariables END;

localvariable:
    // Method grammar should be here
    VARIABLE END;






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



allVariables:
    (VARIABLE | list | functionPointer);

functionPointer:
    FUNC ':' '<' (VOID | ((VARIABLE ',')* VARIABLE)) '->' (VARIABLE | VOID) '>';

list:
    (IDENTIFIER ':' LIST LPAR ((VARIABLE | functionpointer)',')* (VARIABLE | functionpointer) RPAR END ) |
    (IDENTIFIER ':' LIST LPAR (IDENTIFIER ':' ((VARIABLE | functionpointer)',')* (VARIABLE | functionpointer)) RPAR END);// |
    //(IDENTIFIER ':' LIST LPAR ([1-9]+ '#' (VARIABLE | functionpointer)) RPAR END);





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

WS: [ \t\n] -> skip;