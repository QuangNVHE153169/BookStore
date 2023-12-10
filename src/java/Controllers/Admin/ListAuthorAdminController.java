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
import java.util.ArrayList;

public class ListAuthorAdminController extends BaseAuthenticationController {
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void processAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthorDAO aDao = new AuthorDAO();

        if (request.getParameter("authorId") != null && !request.getParameter("authorId").isEmpty()) {
            Author author = aDao.getAuthorById(Integer.parseInt(request.getParameter("authorId")));
            request.setAttribute("author", author);
            request.getRequestDispatcher("/views/Admin/Author/details.jsp").forward(request, response);
        } else {
            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            ArrayList<Author> authors = aDao.getAllAuthorsPagnition((page - 1) * Constant.RecordPerPage, Constant.RecordPerPage);
            int totalAuthors = aDao.getTotalAuthor();
            int totalPage = (int) Math.ceil((double) totalAuthors / Constant.RecordPerPage);

            request.setAttribute("items", authors);

            request.setAttribute("totalPage", totalPage);
            request.setAttribute("currentPage", page);

            request.getRequestDispatcher("/views/Admin/Author/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
