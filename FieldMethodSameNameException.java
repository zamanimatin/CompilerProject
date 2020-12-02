package main.symbolTable.exceptions;

public class FieldMethodSameNameException extends ItemAlreadyExistsException{
    public void print(int line, string methodName)
    {
        System.out.println("Line:" + line + ": Name of method " + methodName + " conflicts with a field's name");
    }
}
