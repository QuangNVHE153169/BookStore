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
import java.io.PrintWriter;
import Model.Constant;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Admin
 */
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
            request.setAttribute("authorList", puDao.getPublishers());
            if (request.getParameter("bookId") != null) {
                BookDAO bDao = new BookDAO();
                Book book = bDao.getBookById(Integer.parseInt(request.getParameter("bookId")));
                if (book != null) {
                    request.setAttribute("book", book);
                } else {
                    request.getSession().setAttribute("msg", "Book is not exist!");
                    request.getRequestDispatcher("/views/Admin/Book/list.jsp").forward(request, response);
                }
            }
            request.getRequestDispatcher("/views/Admin/Book/create.jsp").forward(request, response);
        } catch (Exception e) {
            request.getSession().setAttribute("msg", "System Error, please try again.");
            request.getRequestDispatcher("/views/Admin/Book/list.jsp").forward(request, response);
        }       
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            BookDAO bDao = new BookDAO();
            Book b = new Book();
            switch (request.getParameter("action")) {
                case Constant.Create: {
                    int newId = bDao.getLatestBook() + 1;

                    //lay file anh client gui len server
                    List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList());
                    BookImageDAO biDao = new BookImageDAO();
                    //lay ra duong dan luu folder anh
                    String realPath = getServletContext().getRealPath("") + File.separator + "images";

                    for (Part part : fileParts) {
                        //random ten cho image
                        UUID uuid = UUID.randomUUID();
                        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                        String fileExtension = FilenameUtils.getExtension(filename);

                        if (!Files.exists(Paths.get(realPath))) {
                            Files.createDirectory(Paths.get(realPath));
                        }
                        filename = uuid + "." + fileExtension;
                        part.write(realPath + File.separator + filename);

                        String pathImage = "/" + "images" + "/" + filename;

                        //them anh vao database
                        BookImage image = new BookImage(newId, pathImage);
                        biDao.insert(image);
                    }
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
                    request.getSession().setAttribute("msg", "Insert Successfully!");
                    break;
                }
                case Constant.Update: {
                    b.setTitle(request.getParameter("title"));
                    b.setAuthorId(Integer.parseInt(request.getParameter("authorId")));
                    b.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
                    b.setPageCount(Integer.parseInt(request.getParameter("pageCount")));
                    b.setPublisherId(Integer.parseInt(request.getParameter("publisherId")));
                    b.setPrice(Double.parseDouble(request.getParameter("price")));
                    b.setDescription(request.getParameter("description"));
                    b.setPublicationYear(Integer.parseInt(request.getParameter("publicationYear")));
                    b.setStatus(Boolean.parseBoolean(request.getParameter("status")));
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
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msg", "System Error, please try again.");
        }
        response.sendRedirect("admin-books");
    }
}
