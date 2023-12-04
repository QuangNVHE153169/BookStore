/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Book {
    int bookId;
    String title;
    double price;
    int pageCount;
    boolean status;
    int quantity;
    int categoryId;
    int authorId;
    int publisherId;
    int publicationYear;
    String description;
    boolean deleteFlag;

    public Book() {
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getPublicationYear() {
        return publicationYear;
    }

    public void setPublicationYear(int publicationYear) {
        this.publicationYear = publicationYear;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
    }

    public Book(int bookId, String title, double price, int pageCount, boolean status, int quantity, int categoryId, int authorId, int publisherId, int publicationYear, String description, boolean deleteFlag) {
        this.bookId = bookId;
        this.title = title;
        this.price = price;
        this.pageCount = pageCount;
        this.status = status;
        this.quantity = quantity;
        this.categoryId = categoryId;
        this.authorId = authorId;
        this.publisherId = publisherId;
        this.publicationYear = publicationYear;
        this.description = description;
        this.deleteFlag = deleteFlag;
    }

    public Book(String title, double price, int pageCount, boolean status, int quantity, int categoryId, int authorId, int publisherId, int publicationYear, String description) {
        this.title = title;
        this.price = price;
        this.pageCount = pageCount;
        this.status = status;
        this.quantity = quantity;
        this.categoryId = categoryId;
        this.authorId = authorId;
        this.publisherId = publisherId;
        this.publicationYear = publicationYear;
        this.description = description;
    }
    
}
