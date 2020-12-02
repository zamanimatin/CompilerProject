package main.symbolTable.exceptions;

public class VariableSameNameException extends ItemAlreadyExistsException{
    public void print(int line, string VariableName)
    {
        System.out.println("Line:" + line + ":Redefinition of local variable " + VariableName);
    }
}
