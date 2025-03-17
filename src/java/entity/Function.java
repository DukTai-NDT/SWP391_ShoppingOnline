/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author quang
 */
public class Function {
    private int FunctionID;
    private String FunctionDescription;
    private int ProductID;

    public Function(int FunctionID, String FunctionDescription, int ProductID) {
        this.FunctionID = FunctionID;
        this.FunctionDescription = FunctionDescription;
        this.ProductID = ProductID;
    }

    public Function(String FunctionDescription, int ProductID) {
        this.FunctionDescription = FunctionDescription;
        this.ProductID = ProductID;
    }

    public int getFunctionID() {
        return FunctionID;
    }

    public void setFunctionID(int FunctionID) {
        this.FunctionID = FunctionID;
    }

    public String getFunctionDescription() {
        return FunctionDescription;
    }

    public void setFunctionDescription(String FunctionDescription) {
        this.FunctionDescription = FunctionDescription;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    @Override
    public String toString() {
        return "Function{" + "FunctionID=" + FunctionID + ", FunctionDescription=" + FunctionDescription + ", ProductID=" + ProductID + '}';
    }
    
    
}
