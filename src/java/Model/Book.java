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
    BookImage[] bookImages;
    BookImage latestImage;
    Author author;
    Publisher publisher;
    Category category;
    
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

    public Book(String title, double price, int pageCount, int quantity, int categoryId, int authorId, int publisherId, int publicationYear, String description) {
        this.title = title;
        this.price = price;
        this.pageCount = pageCount;
        this.quantity = quantity;
        this.categoryId = categoryId;
        this.authorId = authorId;
        this.publisherId = publisherId;
        this.publicationYear = publicationYear;
        this.description = description;
    }

    public Book(int bookId, String title, double price, int pageCount, boolean status, int quantity, int categoryId, int authorId, int publisherId, int publicationYear, String description, boolean deleteFlag, BookImage[] bookImages, BookImage latestImage) {
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
        this.bookImages = bookImages;
        this.latestImage = latestImage;
    }

    public BookImage[] getBookImages() {
        return bookImages;
    }

    public void setBookImages(BookImage[] bookImages) {
        this.bookImages = bookImages;
    }

    public BookImage getLatestImages() {
        return latestImage;
    }

    public void setLatestImages(BookImage latestImages) {
        this.latestImage = latestImages;
    }

    public Book(int bookId, String title, double price, int pageCount, boolean status, int quantity, int categoryId, int authorId, int publisherId, int publicationYear, String description, boolean deleteFlag, BookImage latestImage) {
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
        this.latestImage = latestImage;
    }

    @Override
    public String toString() {
        return "Book{" + "bookId=" + bookId + ", title=" + title + ", price=" + price + ", pageCount=" + pageCount + ", status=" + status + ", quantity=" + quantity + ", categoryId=" + categoryId + ", authorId=" + authorId + ", publisherId=" + publisherId + ", publicationYear=" + publicationYear + ", description=" + description + ", deleteFlag=" + deleteFlag + ", bookImages=" + bookImages + ", latestImages=" + latestImage + '}';
    }

    public BookImage getLatestImage() {
        return latestImage;
    }

    public void setLatestImage(BookImage latestImage) {
        this.latestImage = latestImage;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
}
