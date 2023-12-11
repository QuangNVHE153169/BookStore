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
public class RateBook {
    private int rateID;
    private float rate;
    private String comment;
    private int customerId;
    private int bookId;
    private Date date;
    private Boolean deleteFlag;
    private Boolean status;
    
    private Book book;
    private User user;

    public RateBook() {
    }

    public RateBook(int rateID, float rate, String comment, int customerId, int bookId, Date date, Boolean deleteFlag, Boolean status, Book book, User user) {
        this.rateID = rateID;
        this.rate = rate;
        this.comment = comment;
        this.customerId = customerId;
        this.bookId = bookId;
        this.date = date;
        this.deleteFlag = deleteFlag;
        this.status = status;
        this.book = book;
        this.user = user;
    }

    public int getRateID() {
        return rateID;
    }

    public void setRateID(int rateID) {
        this.rateID = rateID;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Boolean getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "RateBook{" + "rateID=" + rateID + ", rate=" + rate + ", comment=" + comment + ", customerId=" + customerId + ", bookId=" + bookId + ", date=" + date + ", deleteFlag=" + deleteFlag + ", status=" + status + ", book=" + book + ", user=" + user + '}';
    }
        
}
