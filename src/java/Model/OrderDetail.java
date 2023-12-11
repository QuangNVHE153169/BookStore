/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private int orderDetailId;
    private int orderId;
    private int bookId;
    private int quantity;
    private Boolean isRated;
    private Order order;
    private Book book;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
    
    

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailId, int orderId, int bookId, int quantity, Boolean IsRated, Order order) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.isRated = IsRated;
        this.order = order;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Boolean getIsRated() {
        return isRated;
    }

    public void setIsRated(Boolean IsRated) {
        this.isRated = IsRated;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "orderDetailId=" + orderDetailId + ", orderId=" + orderId + ", bookId=" + bookId + ", quantity=" + quantity + ", isRated=" + isRated + ", order=" + order + '}';
    }
    
    
}
