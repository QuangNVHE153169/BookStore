/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class BookImage {
    int ImageId;
    int BookId;
    String Url;
    Boolean DeleteFlag;

    public BookImage(int ImageId, int BookId, String Url, Boolean DeleteFlag) {
        this.ImageId = ImageId;
        this.BookId = BookId;
        this.Url = Url;
        this.DeleteFlag = DeleteFlag;
    }

    public BookImage() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getImageId() {
        return ImageId;
    }

    public void setImageId(int ImageId) {
        this.ImageId = ImageId;
    }

    public int getBookId() {
        return BookId;
    }

    public void setBookId(int BookId) {
        this.BookId = BookId;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String Url) {
        this.Url = Url;
    }

    public Boolean getDeleteFlag() {
        return DeleteFlag;
    }

    public void setDeleteFlag(Boolean DeleteFlag) {
        this.DeleteFlag = DeleteFlag;
    }
    
}
