/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Book;

import DAL.BookDAO;
import Model.Bindings.BookBinding;
import Model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import Model.Constant;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BookController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet bookController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public void getAllBooks(HttpServletRequest request, HttpServletResponse response) {
        int page = 1;
        int sortBy = 0;
        BookBinding bookBinding = new BookBinding();
        request.setAttribute("authorId", request.getParameter("authorId"));
        request.setAttribute("categoryId", request.getParameter("categoryId"));
        request.setAttribute("publisherId", request.getParameter("publisherId"));
        request.setAttribute("textSearch", request.getParameter("textSearch"));
        request.setAttribute("minPrice", request.getParameter("minPrice"));
        request.setAttribute("maxPrice", request.getParameter("maxPrice"));
        request.setAttribute("status", request.getParameter("status"));
        request.setAttribute("sortBy", request.getParameter("sortBy"));
        try {
            if (request.getParameter("authorId") != null) {
                bookBinding.setAuthorId(Integer.parseInt(request.getParameter("authorId")));
            }
            if (request.getParameter("categoryId") != null) {
                bookBinding.setCategoryID(Integer.parseInt(request.getParameter("categoryId")));
            }
            if (request.getParameter("publisherId") != null) {
                bookBinding.setAuthorId(Integer.parseInt(request.getParameter("publisherId")));
            }
            if (request.getParameter("textSearch") != null) {
                bookBinding.setTextSearch(request.getParameter("textSearch"));
            }
            if (request.getParameter("minPrice") != null) {
                bookBinding.setMinPrice(Double.parseDouble(request.getParameter("minPrice")));
            }
            if (request.getParameter("maxPrice") != null) {
                bookBinding.setMaxPrice(Double.parseDouble(request.getParameter("maxPrice")));
            }
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            if (request.getParameter("sortBy") != null) {
                sortBy = Integer.parseInt(request.getParameter("sortBy"));
            }
            if (request.getParameter("status") != null) {
                bookBinding.setStatus(Integer.parseInt(request.getParameter("status")));
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("msg", "Error while input querying, return to default result.");
        }
        BookDAO bDao = new BookDAO();
        ArrayList<Book> books = bDao.getBookPaginate(page, Constant.RecordPerPage, bookBinding, sortBy);
        request.setAttribute("items", books);
        request.setAttribute("totalPage", bDao.getTotalPage(bookBinding));
        request.setAttribute("currentPage", page);
    }

    public void getBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("bookId") != null) {
            BookDAO bDao = new BookDAO();
            Book b = bDao.getBookDetailById(Integer.parseInt(request.getParameter("bookId")));
            if (b != null) {
                request.setAttribute("book", b);
                request.getRequestDispatcher("/views/Admin/Book/detail.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Book is not exist");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
