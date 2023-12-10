/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.AuthorDAO;
import Model.Author;
import Model.Constant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author dell
 */
public class ManageAuthorController extends BaseAuthenticationController {
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
        AuthorDAO aDao = new AuthorDAO();
        if (request.getParameter("authorId") != null) {
            Author author = aDao.getAuthorById(Integer.parseInt(request.getParameter("authorId")));
            request.setAttribute("author", author);
        }
        request.getRequestDispatcher("views/Admin/Author/create.jsp").forward(request, response);
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        AuthorDAO aDao = new AuthorDAO();
        Author author = new Author();
        int authorId;
        String name;
        Date dob;
        switch (action) {
            case Constant.Create:
                //get value is send from client
                name = request.getParameter("name");
                dob = Date.valueOf(request.getParameter("dob"));

                author.setAuthorName(name);
                author.setDob(dob);
                author.setStatus(Constant.StatusActive);
                author.setDeleteFlag(Constant.DeleteFalse);

                aDao.insertAuthor(author);
                break;
            case Constant.Update:
                //get value is send from client
                authorId = Integer.parseInt(request.getParameter("authorId"));
                name = request.getParameter("name");
                dob = Date.valueOf(request.getParameter("dob"));

                author.setAuthorId(authorId);
                author.setAuthorName(name);
                author.setDob(dob);

                aDao.updateAuthor(author);
                break;
        }
        response.sendRedirect("authorManage");
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
