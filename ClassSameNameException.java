package main.symbolTable.exceptions;



public class ClassSameNameException extends ItemAlreadyExistsException{
    void print(int line, string classname)
    {
        System.out.println("Line:" + line + ":Redefinition of class " + classname);
    }
}
