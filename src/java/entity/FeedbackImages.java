/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author quang
 */
public class FeedbackImages {
    private int ImageID;
    private int FeedbackID;

    public FeedbackImages(int ImageID, int FeedbackID) {
        this.ImageID = ImageID;
        this.FeedbackID = FeedbackID;
    }

    public int getImageID() {
        return ImageID;
    }

    public void setImageID(int ImageID) {
        this.ImageID = ImageID;
    }

    public int getFeedbackID() {
        return FeedbackID;
    }

    public void setFeedbackID(int FeedbackID) {
        this.FeedbackID = FeedbackID;
    }

    @Override
    public String toString() {
        return "FeedbackImages{" + "ImageID=" + ImageID + ", FeedbackID=" + FeedbackID + '}';
    }
    
}
