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
    int pushisherId;
    String textSearch;
    double minPrice; 
    double maxPrice;

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public void setPushisherId(int pushisherId) {
        this.pushisherId = pushisherId;
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

    public int getPushisherId() {
        return pushisherId;
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

    public BookBinding(int authorId, int categoryID, int pushisherId, String textSearch, double minPrice, double maxPrice) {
        this.authorId = authorId;
        this.categoryID = categoryID;
        this.pushisherId = pushisherId;
        this.textSearch = textSearch;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
    }
    
}