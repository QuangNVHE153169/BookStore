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
    private int imageId;
    private int bookId;
    private String url;
    private Boolean deleteFlag;

    public BookImage(int bookId, String url) {
        this.bookId = bookId;
        this.url = url;
    }

    public BookImage(int imageId, int bookId, String url, Boolean deleteFlag) {
        this.imageId = imageId;
        this.bookId = bookId;
        this.url = url;
        this.deleteFlag = deleteFlag;
    }

    public BookImage() {
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Boolean getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
    }
    
}
