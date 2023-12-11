/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.SaleAdmin;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.OrderDAO;
import Model.Enums.OrderStatus;
import Model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ListOrderController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processSaleAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO oDao = new OrderDAO();
        if (request.getParameter("orderId") != null && !request.getParameter("orderId").isEmpty()) {
            Order o = oDao.getOrderById(Integer.parseInt(request.getParameter("orderId")));
            o.setOrderDetails(oDao.getOrderDetailsByOrderId(o.getOrderId()));
            request.setAttribute("order", o);
            request.getRequestDispatcher("views/SaleAdmin/Order/details.jsp").forward(request, response);
        } else {
            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            ArrayList<Order> o = oDao.getOrdersPaginate(page);
            request.setAttribute("items", o);

            request.setAttribute("totalPage", oDao.getTotalPage(o.size()));
            request.setAttribute("orderStatus", OrderStatus.values());
            request.setAttribute("currentPage", page);

            request.getRequestDispatcher("views/SaleAdmin/Order/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void processSaleAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO oDao = new OrderDAO();
        oDao.updateStatus(Integer.parseInt(request.getParameter("orderId")), Integer.parseInt(request.getParameter("status")));
        Order o = oDao.getOrderById(Integer.parseInt(request.getParameter("orderId")));
        o.setOrderDetails(oDao.getOrderDetailsByOrderId(o.getOrderId()));

        request.setAttribute("order", o);
        request.getSession().setAttribute("msg", "Update status successfully");
        response.sendRedirect("admin-sale-orders");
    }

}
