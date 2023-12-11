/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Authenticate;

import Model.Constant;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public abstract class BaseAuthenticationController extends HttpServlet {
       
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User acc = (User) request.getSession().getAttribute("account");
        if (acc != null) {
            switch (acc.getRole().getId()) {
                case Constant.RoleAdmin:
                    processAdminGet(request, response);
                    break;
                case Constant.RoleAdminSale:
                    processSaleAdminGet(request, response);
                    break;
                default:
                    processGet(request, response);
                    break;
            }
        } else {
            request.getRequestDispatcher("error/403.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User acc = (User) request.getSession().getAttribute("account");
        if (acc != null) {
            switch (acc.getRole().getId()) {
                case Constant.RoleAdmin:
                    processAdminPost(request, response);
                    break;
                case Constant.RoleAdminSale:
                    processSaleAdminPost(request, response);
                    break;
                default:
                    processPost(request, response);
                    break;
            }
        } else {
            request.getRequestDispatcher("error/403.jsp").forward(request, response);
        }
    }

    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    protected abstract void processAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    protected abstract void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    protected abstract void processSaleAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    protected abstract void processSaleAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
