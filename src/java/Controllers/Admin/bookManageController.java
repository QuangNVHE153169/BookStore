/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.AuthorDAO;
import DAL.BookDAO;
import DAL.BookImageDAO;
import DAL.CategoryDAO;
import DAL.PublisherDAO;
import Model.Book;
import Model.BookImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import Model.Constant;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class bookManageController extends BaseAuthenticationController {

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
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void processAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            AuthorDAO auDao = new AuthorDAO();
            CategoryDAO cDao = new CategoryDAO();
            PublisherDAO puDao = new PublisherDAO();
            request.setAttribute("authorList", auDao.getAuthors());
            request.setAttribute("categoryList", cDao.getCategories());
            request.setAttribute("publisherList", puDao.getPublishers());
            if (request.getParameter("bookId") != null) {
                BookDAO bDao = new BookDAO();
                Book book = bDao.getBookById(Integer.parseInt(request.getParameter("bookId")));
                if (book != null) {
                    request.setAttribute("book", book);
                } else {
                    request.getSession().setAttribute("msg", "Book is not exist!");  
                }
            }
            request.getRequestDispatcher("/views/Admin/Book/create.jsp").forward(request, response);
        } catch (Exception e) {
            request.getSession().setAttribute("msg", "System Error, please try again.");
            response.sendRedirect("admin-books");
        }
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            BookDAO bDao = new BookDAO();
            Book b = new Book();
            switch (request.getParameter("action")) {
                case Constant.Create: {
                    BookImageDAO biDao = new BookImageDAO();

                    b.setTitle(request.getParameter("title"));
                    b.setAuthorId(Integer.parseInt(request.getParameter("authorId")));
                    b.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
                    b.setPageCount(Integer.parseInt(request.getParameter("pageCount")));
                    b.setPublisherId(Integer.parseInt(request.getParameter("publisherId")));
                    b.setPrice(Double.parseDouble(request.getParameter("price")));
                    b.setDescription(request.getParameter("description"));
                    b.setPublicationYear(Integer.parseInt(request.getParameter("publicationYear")));
                    b.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                    bDao.insert(b);
                    
                    int newId = bDao.getLatestBook();
                    Part file = request.getPart("file");                   
                    
                    String realPath = getServletContext().getRealPath("") + "images";

                    String fileName = Paths.get(file.getSubmittedFileName()).getFileName().toString();
                    if (!Files.exists(Paths.get(realPath))) {
                        Files.createDirectories(Paths.get(realPath));
                    }
                    file.write(realPath+ File.separator +fileName);
                    BookImage bi = new BookImage(newId, fileName);
                    biDao.insert(bi);
                    
                    request.getSession().setAttribute("msg", "Create Succesfully!");
                    break;
                }
                case Constant.Update: {
                    b.setBookId(Integer.parseInt(request.getParameter("bookId")));
                    b.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
                    b.setPageCount(Integer.parseInt(request.getParameter("pageCount")));
                    b.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                    b.setPrice(Double.parseDouble(request.getParameter("price")));
                    b.setPublicationYear(Integer.parseInt(request.getParameter("publicationYear")));
                    b.setDescription(request.getParameter("description"));
                    b.setPublicationYear(LocalDate.now().getYear());
                    bDao.update(b);
                    request.getSession().setAttribute("msg", "Update Succesfully!");
                    break;
                }
                case Constant.Delete: {
                    if (bDao.getBookById(Integer.parseInt(request.getParameter("bookId"))) != null) {
                        bDao.softDeleteBook(Integer.parseInt(request.getParameter("bookId")));
                    }
                    request.getSession().setAttribute("msg", "Delete Succesfully!");
                    break;
                }
                default: {
                    request.getSession().setAttribute("msg", "System Error, please try again.");
                }
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msg", e.getMessage());
        }
        response.sendRedirect("admin-books");
    }
}
