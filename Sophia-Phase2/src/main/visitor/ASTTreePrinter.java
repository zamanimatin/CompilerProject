package main.visitor;

import main.ast.nodes.Program;
import main.ast.nodes.declaration.classDec.ClassDeclaration;
import main.ast.nodes.declaration.classDec.classMembersDec.ConstructorDeclaration;
import main.ast.nodes.declaration.classDec.classMembersDec.FieldDeclaration;
import main.ast.nodes.declaration.classDec.classMembersDec.MethodDeclaration;
import main.ast.nodes.declaration.variableDec.VarDeclaration;
import main.ast.nodes.expression.*;
import main.ast.nodes.expression.values.ListValue;
import main.ast.nodes.expression.values.NullValue;
import main.ast.nodes.expression.values.primitive.BoolValue;
import main.ast.nodes.expression.values.primitive.IntValue;
import main.ast.nodes.expression.values.primitive.StringValue;
import main.ast.nodes.statement.*;
import main.ast.nodes.statement.loop.BreakStmt;
import main.ast.nodes.statement.loop.ContinueStmt;
import main.ast.nodes.statement.loop.ForStmt;
import main.ast.nodes.statement.loop.ForeachStmt;

public class ASTTreePrinter extends Visitor<Void> {

    @Override
    public Void visit(Program program) {
        System.out.println("Line:" + Integer.toString(program.getLine()) + ":" + program.toString());
        for(ClassDeclaration classDec : program.getClasses())
            classDec.accept(this);
        return null;
    }

    @Override
    public Void visit(ClassDeclaration classDeclaration) {
        System.out.println("Line:" + Integer.toString(classDeclaration.getLine()) + ":" + classDeclaration.toString());
        for(FieldDeclaration fieldDec : classDeclaration.getFields())
            fieldDec.accept(this);
        classDeclaration.getConstructor().accept(this);
        for(MethodDeclaration methodDec : classDeclaration.getMethods())
            methodDec.accept(this);
        return null;
    }

    @Override
    public Void visit(ConstructorDeclaration constructorDeclaration) {
        System.out.println("Line:" + Integer.toString(constructorDeclaration.getLine()) + ":" + constructorDeclaration.toString());
        for(VarDeclaration varDec : constructorDeclaration.getArgs())
            varDec.accept(this);
        for(VarDeclaration varDec : constructorDeclaration.getLocalVars())
            varDec.accept(this);
        for(Statement st : constructorDeclaration.getBody())
            st.accept(this);
        return null;
    }

    @Override
    public Void visit(MethodDeclaration methodDeclaration) {
        System.out.println("Line:" + Integer.toString(methodDeclaration.getLine()) + ":" + methodDeclaration.toString());
        for(VarDeclaration varDec : methodDeclaration.getArgs())
            varDec.accept(this);
        for(VarDeclaration varDec : methodDeclaration.getLocalVars())
            varDec.accept(this);
        for(Statement st : methodDeclaration.getBody())
            st.accept(this);
        return null;
    }

    @Override
    public Void visit(FieldDeclaration fieldDeclaration) {
        System.out.println("Line:" + Integer.toString(fieldDeclaration.getLine()) + ":" + fieldDeclaration.toString());
        fieldDeclaration.getVarDeclaration().accept(this);
        return null;
    }

    @Override
    public Void visit(VarDeclaration varDeclaration) {
        System.out.println("Line:" + Integer.toString(varDeclaration.getLine()) + ":" + varDeclaration.toString());
        varDeclaration.getVarName().accept(this);
        return null;
    }

    @Override
    public Void visit(AssignmentStmt assignmentStmt) {
        System.out.println("Line:" + Integer.toString(assignmentStmt.getLine()) + ":" + assignmentStmt.toString());
        assignmentStmt.getlValue().accept(this);
        assignmentStmt.getrValue().accept(this);
        return null;
    }

    @Override
    public Void visit(BlockStmt blockStmt) {
        System.out.println("Line:" + Integer.toString(blockStmt.getLine()) + ":" + blockStmt.toString());
        for(Statement st : blockStmt.getStatements())
            st.accept(this);
        return null;
    }

    @Override
    public Void visit(ConditionalStmt conditionalStmt) {
        System.out.println("Line:" + Integer.toString(conditionalStmt.getLine()) + ":" + conditionalStmt.toString());
        conditionalStmt.getCondition().accept(this);
        conditionalStmt.getThenBody().accept(this);
        conditionalStmt.getElseBody().accept(this);
        return null;
    }

    @Override
    public Void visit(MethodCallStmt methodCallStmt) {
        System.out.println("Line:" + Integer.toString(methodCallStmt.getLine()) + ":" + methodCallStmt.toString());
        methodCallStmt.getMethodCall().accept(this);
        return null;
    }

    @Override
    public Void visit(PrintStmt print) {
        System.out.println("Line:" + Integer.toString(print.getLine()) + ":" + print.toString());
        print.getArg().accept(this);
        return null;
    }

    @Override
    public Void visit(ReturnStmt returnStmt) {
        System.out.println("Line:" + Integer.toString(returnStmt.getLine()) + ":" + returnStmt.toString());
        returnStmt.getReturnedExpr().accept(this);
        return null;
    }

    @Override
    public Void visit(BreakStmt breakStmt) {
        System.out.println("Line:" + Integer.toString(breakStmt.getLine()) + ":" + breakStmt.toString());
        return null;
    }

    @Override
    public Void visit(ContinueStmt continueStmt) {
        System.out.println("Line:" + Integer.toString(continueStmt.getLine()) + ":" + continueStmt.toString());
        return null;
    }

    @Override
    public Void visit(ForeachStmt foreachStmt) {
        System.out.println("Line:" + Integer.toString(foreachStmt.getLine()) + ":" + foreachStmt.toString());
        foreachStmt.getVariable().accept(this);
        foreachStmt.getList().accept(this);
        foreachStmt.getBody().accept(this);
        return null;
    }

    @Override
    public Void visit(ForStmt forStmt) {
        System.out.println("Line:" + Integer.toString(forStmt.getLine()) + ":" + forStmt.toString());
        forStmt.getInitialize().accept(this);
        forStmt.getCondition().accept(this);
        forStmt.getUpdate().accept(this);
        forStmt.getBody().accept(this);
        return null;
    }

    @Override
    public Void visit(BinaryExpression binaryExpression) {
        System.out.println("Line:" + Integer.toString(binaryExpression.getLine()) + ":" + binaryExpression.toString());
        binaryExpression.getFirstOperand().accept(this);
        binaryExpression.getSecondOperand().accept(this);
        return null;
    }

    @Override
    public Void visit(UnaryExpression unaryExpression) {
        System.out.println("Line:" + Integer.toString(unaryExpression.getLine()) + ":" + unaryExpression.toString());
        unaryExpression.getOperand().accept(this);
        return null;
    }

    @Override
    public Void visit(ObjectOrListMemberAccess objectOrListMemberAccess) {
        System.out.println("Line:" + Integer.toString(objectOrListMemberAccess.getLine()) + ":" + objectOrListMemberAccess.toString());
        objectOrListMemberAccess.getInstance().accept(this);
        objectOrListMemberAccess.getMemberName().accept(this);
        return null;
    }

    @Override
    public Void visit(Identifier identifier) {
        System.out.println("Line:" + Integer.toString(identifier.getLine()) + ":" + identifier.toString());
        return null;
    }

    @Override
    public Void visit(ListAccessByIndex listAccessByIndex) {
        System.out.println("Line:" + Integer.toString(listAccessByIndex.getLine()) + ":" + listAccessByIndex.toString());
        listAccessByIndex.getInstance().accept(this);
        listAccessByIndex.getIndex().accept(this);
        return null;
    }

    @Override
    public Void visit(MethodCall methodCall) {
        System.out.println("Line:" + Integer.toString(methodCall.getLine()) + ":" + methodCall.toString());
        methodCall.getInstance().accept(this);
        for(Expression ex : methodCall.getArgs())
            ex.accept(this);
        return null;
    }

    @Override
    public Void visit(NewClassInstance newClassInstance) {
        System.out.println("Line:" + Integer.toString(newClassInstance.getLine()) + ":" + newClassInstance.toString());
        for(Expression ex : newClassInstance.getArgs())
            ex.accept(this);
        return null;
    }

    @Override
    public Void visit(ThisClass thisClass) {
        System.out.println("Line:" + Integer.toString(thisClass.getLine()) + ":" + thisClass.toString());
        return null;
    }

    @Override
    public Void visit(ListValue listValue) {
        System.out.println("Line:" + Integer.toString(listValue.getLine()) + ":" + listValue.toString());
        for(Expression ex : listValue.getElements())
            ex.accept(this);
        return null;
    }

    @Override
    public Void visit(NullValue nullValue) {
        System.out.println("Line:" + Integer.toString(nullValue.getLine()) + ":" + nullValue.toString());
        return null;
    }

    @Override
    public Void visit(IntValue intValue) {
        System.out.println("Line:" + Integer.toString(intValue.getLine()) + ":" + intValue.toString());
        return null;
    }

    @Override
    public Void visit(BoolValue boolValue) {
        System.out.println("Line:" + Integer.toString(boolValue.getLine()) + ":" + boolValue.toString());
        return null;
    }

    @Override
    public Void visit(StringValue stringValue) {
        System.out.println("Line:" + Integer.toString(stringValue.getLine()) + ":" + stringValue.toString());
        return null;
    }

}
