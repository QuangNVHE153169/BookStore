/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.OrderDAO;
import Model.Author;
import Model.Constant;
import Model.Order;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class MyOrderController extends BaseAuthenticationController {

    int orderStatus = -1;

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO oDao = new OrderDAO();
        if (request.getParameter("orderId") != null && !request.getParameter("orderId").isEmpty()) {
            Order o = oDao.getOrderDetailsById(Integer.parseInt(request.getParameter("orderId")));
            o.setOrderDetails(oDao.getOrderDetailsByOrderId(o.getOrderId()));
            request.setAttribute("order", o);
            request.getRequestDispatcher("views/User/myOrderDetails.jsp").forward(request, response);
        } else {
            //get current login accoutn
            User account = (User) request.getSession().getAttribute("account");

            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            ArrayList<Order> orders = oDao.getOrderByUserPagnition((page - 1) * Constant.RecordPerPage, Constant.RecordPerPage, account.getUserID(), orderStatus);
            int totalPublisher = oDao.getTotalOrderByUser(account.getUserID(), orderStatus);
            int totalPage = (int) Math.ceil((double) totalPublisher / Constant.RecordPerPage);

            request.setAttribute("items", orders);

            request.setAttribute("totalPage", totalPage);
            request.setAttribute("currentPage", page);

            request.getRequestDispatcher("/views/User/myOrder.jsp").forward(request, response);
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO oDao = new OrderDAO();
        oDao.updateStatus(Integer.parseInt(request.getParameter("orderId")), Integer.parseInt(request.getParameter("status")));
        Order o = oDao.getOrderById(Integer.parseInt(request.getParameter("orderId")));
        o.setOrderDetails(oDao.getOrderDetailsByOrderId(o.getOrderId()));

        request.setAttribute("order", o);
        request.getSession().setAttribute("msg", "Cancel order successfully");
        response.sendRedirect("my-order");
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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processSaleAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
