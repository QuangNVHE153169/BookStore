/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.AuthorDAO;
import DAL.BookDAO;
import DAL.CategoryDAO;
import DAL.PublisherDAO;
import Model.Author;
import Model.Book;
import Model.Category;
import Model.Publisher;
import Utils.BookService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class HomeController extends HttpServlet {

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
        HttpSession session = request.getSession();

        CategoryDAO cDao = new CategoryDAO();
        AuthorDAO auDao = new AuthorDAO();
        PublisherDAO pDao = new PublisherDAO();
        BookDAO bDao = new BookDAO();

        //get message from server
        String msg = (String) request.getSession().getAttribute("msg");
        //check if there have message or not
        if (msg != null) {
            request.setAttribute("msg", msg);
            request.getSession().setAttribute("msg", null);
        }

        //get all categoreis of store
        ArrayList<Category> categories = cDao.getAllCategories();

        //get all authors of store
        ArrayList<Author> authors = auDao.getAllAuthorsActive();

        //get all authors of store
        ArrayList<Publisher> publishers = pDao.getPublishers();
        
        //get all book in list
        ArrayList<Book> listBook = bDao.getAllBook();
        
        session.setAttribute("categories", categories);
        session.setAttribute("authors", authors);
        session.setAttribute("publishers", publishers);
        
        //get random 3 book and set to top 3 best book
        session.setAttribute("top3book", BookService.GetRandomBook(listBook, 3));
        
        //get random 5 book and set to top 5 feature book
        session.setAttribute("featurebook", BookService.GetRandomBook(listBook, 5));

        request.getRequestDispatcher("views/Homepage.jsp").forward(request, response);
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
        processRequest(request, response);
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
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
