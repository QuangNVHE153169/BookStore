/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Author {
    int authorId;
    String authorName;
    Date dob;
    Boolean status;
    Boolean deleteFlag;
    Book[] books;

    public Author() {
    }

    public Author(int authorId, String authorName, Date dob, Boolean status, Boolean deleteFlag, Book[] books) {
        this.authorId = authorId;
        this.authorName = authorName;
        this.dob = dob;
        this.status = status;
        this.deleteFlag = deleteFlag;
        this.books = books;
    }

    public Author(String authorName, Date dob, Boolean status, Boolean deleteFlag, Book[] books) {
        this.authorName = authorName;
        this.dob = dob;
        this.status = status;
        this.deleteFlag = deleteFlag;
        this.books = books;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Boolean getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public Book[] getBooks() {
        return books;
    }

    public void setBooks(Book[] books) {
        this.books = books;
    }

    public Author(int authorId, String authorName, Date dob, Boolean status, Boolean deleteFlag) {
        this.authorId = authorId;
        this.authorName = authorName;
        this.dob = dob;
        this.status = status;
        this.deleteFlag = deleteFlag;
    }

    @Override
    public String toString() {
        return "Author{" + "authorId=" + authorId + ", authorName=" + authorName + ", dob=" + dob + ", status=" + status + ", deleteFlag=" + deleteFlag + '}';
    }
    
}
