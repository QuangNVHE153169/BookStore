/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.SaleAdmin;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.UserDAO;
import Model.Constant;
import Model.User;
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
public class ListCustomerController extends BaseAuthenticationController {

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
        UserDAO uDao = new UserDAO();

        if (request.getParameter("userId") != null && !request.getParameter("userId").isEmpty()) {
            User user = uDao.getUserByIdAndRole(Integer.parseInt(request.getParameter("userId")), Constant.RoleCustomer);
            if (user != null) {
                request.setAttribute("customer", user);
                request.getRequestDispatcher("/views/SaleAdmin/Customer/details.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("msg", "Customer is not exist");
                response.sendRedirect("admin-customer");
            }

        } else {
            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            ArrayList<User> customers = uDao.getAllUserByRolePagnition((page - 1) * Constant.RecordPerPage, Constant.RecordPerPage, Constant.RoleCustomer);
            int totalCustomer = uDao.getTotalUserByRole(Constant.RoleCustomer);
            int totalPage = (int) Math.ceil((double) totalCustomer / Constant.RecordPerPage);

            request.setAttribute("items", customers);

            request.setAttribute("totalPage", totalPage);
            request.setAttribute("currentPage", page);

            request.getRequestDispatcher("/views/SaleAdmin/Customer/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void processSaleAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO uDao = new UserDAO();
        int userId = Integer.parseInt(request.getParameter("userId"));
        boolean status = Boolean.valueOf(request.getParameter("status"));
        uDao.changeStatus(userId, status);
        if (!status) {
            request.getSession().setAttribute("msg", "Lock Customer with ID: " + userId + " successful!");
        } else {
            request.getSession().setAttribute("msg", "Unlock Customer with ID: " + userId + " successful!");
        }
        response.sendRedirect("admin-customer");
    }

}
