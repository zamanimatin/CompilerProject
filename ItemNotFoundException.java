package main.symbolTable.exceptions;


public class ItemNotFoundException extends Exception {
    public void print()
    {
        System.out.println("Item Not Found Exception");
    }
}
