/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author quang
 */
public class Image {

    private int ImageID;
    private int ProductID;
    private String ImageName;

    public Image(int ImageID, int ProductID, String ImageName) {
        this.ImageID = ImageID;
        this.ProductID = ProductID;
        this.ImageName = ImageName;
    }

    public Image(int ProductID, String ImageName) {
        this.ProductID = ProductID;
        this.ImageName = ImageName;
    }

    public int getImageID() {
        return ImageID;
    }

    public void setImageID(int ImageID) {
        this.ImageID = ImageID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getImageName() {
        return ImageName;
    }

    public void setImageName(String ImageName) {
        this.ImageName = ImageName;
    }

    @Override
    public String toString() {
        return "Image{" + "ImageID=" + ImageID + ", ProductID=" + ProductID + ", ImageName=" + ImageName + '}';
    }
    
    
}
