/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.CategoryDAO;
import Model.Category;
import Model.Constant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class ManageCategoryController extends BaseAuthenticationController {
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
        CategoryDAO cDao = new CategoryDAO();
        if (request.getParameter("categoryId") != null) {
            Category category = cDao.getCategoryById(Integer.parseInt(request.getParameter("categoryId")));
            request.setAttribute("category", category);
        }
        request.getRequestDispatcher("views/Admin/Category/create.jsp").forward(request, response);
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        CategoryDAO cDao = new CategoryDAO();
        Category category = new Category();
        int categoryId;
        String name;
        switch (action) {
            case Constant.Create:
                //get value is send from client
                name = request.getParameter("name");

                category.setCategoryName(name);
                category.setStatus(Constant.StatusActive);
                category.setDeleteFlag(Constant.DeleteFalse);

                cDao.insertCategory(category);
                break;
            case Constant.Update:
                //get value is send from client
                categoryId = Integer.parseInt(request.getParameter("categoryId"));
                name = request.getParameter("name");

                category.setCategoryId(categoryId);
                category.setCategoryName(name);

                cDao.updateCategory(category);
                break;
        }
        response.sendRedirect("admin-category");
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
