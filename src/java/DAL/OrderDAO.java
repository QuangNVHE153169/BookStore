/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Constant;
import Model.Enums.OrderStatus;
import Model.Order;
import Model.OrderDetail;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public void insertOrder(Order o) {
        try {
            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([CustomerId]\n"
                    + "           ,[Customer_Name]\n"
                    + "           ,[Customer_Email]\n"
                    + "           ,[Customer_Phone]\n"
                    + "           ,[Customer_Address]\n"
                    + "           ,[OrderDate]\n"
                    + "           ,[OrderStatus]\n"
                    + "           ,[PaymentMethodId])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,1\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, o.getCustomerId());
            stm.setString(2, o.getCustomerName());
            stm.setString(3, o.getCustomerEmail());
            stm.setString(4, o.getCustomerPhone());
            stm.setNString(5, o.getCustomerAddress());
            stm.setDate(6, o.getOrderDate());
            stm.setInt(7, o.getPaymentMethodId());

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Boolean updateStatus(int orderId, int status) {
        try {
            String sql = "UPDATE Orders SET OrderStatus = ? WHERE OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, orderId);
            stm.executeUpdate();
            
            BookDAO bDao = new BookDAO();
            
            ArrayList<OrderDetail> ods = getOrderDetailsByOrderId(orderId);
            for (OrderDetail od : ods) {
                bDao.updateQuantity(od.getBook().getBookId(), od.getQuantity(), status);
            }

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public ArrayList<Order> getOrdersPaginate(int page) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = "Select * FROM Orders Order By OrderId desc\n"
                    + " Offset ? row\n"
                    + " fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            int offset = (page - 1) * Constant.RecordPerPage;
            stm.setInt(1, offset);
            stm.setInt(2, Constant.RecordPerPage);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(getOrderById(rs.getInt("OrderId")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Order getOrderById(int orderId) {
        try {
            String sql = "Select * FROM Orders WHERE OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setOrderId(orderId);
                order.setCustomerAddress(rs.getNString("Customer_Address"));
                order.setCustomerEmail(rs.getString("Customer_Email"));
                order.setCustomerName(rs.getString("Customer_Name"));
                order.setCustomerPhone(rs.getString("Customer_Phone"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setPaymentMethodId(rs.getInt("PaymentMethodId"));
                order.setStatus(rs.getInt("OrderStatus"));

                return order;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            String sql = "Select * FROM OrderDetails WHERE OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(getOrderDetailById(rs.getInt("OrderDetailId")));
            }

            return list;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public OrderDetail getOrderDetailById(int orderDetailId) {
        try {
            String sql = "Select * FROM OrderDetails WHERE OrderDetailId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderDetailId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                BookDAO bDao = new BookDAO();

                OrderDetail od = new OrderDetail();
                od.setBookId(rs.getInt("BookId"));
                od.setIsRated(rs.getBoolean("IsRated"));
                od.setOrderDetailId(rs.getInt("OrderDetailId"));
                od.setOrderId(rs.getInt("OrderId"));
                od.setQuantity(rs.getInt("Quantity"));
                od.setBook(bDao.getBookById(rs.getInt("BookId")));
                
                return od;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public int getTotalPage(int recordNumber) {
        return (int) Math.ceil((double) recordNumber / Constant.RecordPerPage);
    }

    public static void main(String[] args) {
        OrderDAO oDao = new OrderDAO();
        Order o = new Order();
//        o.setCustomerAddress("123");
//        o.setCustomerEmail("lemiruss@gmail.com");
//        o.setCustomerId(3);
//        o.setCustomerName("onething");
//        o.setCustomerPhone("0337498466");
//        o.setOrderDate(Date.valueOf(LocalDate.now()));
//        o.setPaymentMethodId(1);
//        o.setStatus(1);
//        oDao.insertOrder(o);
//        ArrayList<Order> os = oDao.getOrdersPaginate(1);
//        System.out.println(oDao.getTotalPage(os.size()));
        for (OrderStatus os : OrderStatus.values()) {
            System.out.println(os.name() + " " + os.getStatusValue());
        }
    }
}
