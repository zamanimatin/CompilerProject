package main.symbolTable.exceptions;


public class FieldSameNameException extends ItemAlreadyExistsException{
    void print(int line, string classname)
    {
        System.out.println("Line:" + line + ":Redefinition of field " + classname);
    }
}
