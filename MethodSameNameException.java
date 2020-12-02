package main.symbolTable.exceptions;

public class MethodSameNameException extends ItemAlreadyExistsException {
    public void print(int line, string methodName)
    {
        System.out.println("Line:" + line + ": Redefinition of method " + methodName);
    }
}
