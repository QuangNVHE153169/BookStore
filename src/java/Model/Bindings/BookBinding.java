/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Bindings;

/**
 *
 * @author Admin
 */
public class BookBinding {
    int authorId;
    int categoryID;
    int publisherID;
    String textSearch = "";
    int status = 1;
    double minPrice; 
    double maxPrice = 5000000;
    
    
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public void setTextSearch(String textSearch) {
        this.textSearch = textSearch;
    }

    public void setMinPrice(double minPrice) {
        this.minPrice = minPrice;
    }

    public void setMaxPrice(double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public BookBinding() {
    }

    public int getAuthorId() {
        return authorId;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public String getTextSearch() {
        return textSearch;
    }

    public double getMinPrice() {
        return minPrice;
    }

    public double getMaxPrice() {
        return maxPrice;
    }

    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }

    public BookBinding(int authorId, int categoryID, int publisherID, String textSearch, double minPrice, double maxPrice) {
        this.authorId = authorId;
        this.categoryID = categoryID;
        this.publisherID = publisherID;
        this.textSearch = textSearch;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
    }

    public BookBinding(int authorId, int categoryID, int publisherID, double minPrice, String textSearch, double maxPrice, int status) {
        this.authorId = authorId;
        this.categoryID = categoryID;
        this.publisherID = publisherID;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.status = status;
        this.textSearch = textSearch;
    }
    
    

    @Override
    public String toString() {
        return "BookBinding{" + "authorId=" + authorId + ", categoryID=" + categoryID + ", publisherID=" + publisherID + ", textSearch=" + textSearch + ", minPrice=" + minPrice + ", maxPrice=" + maxPrice + '}';
    }
}
