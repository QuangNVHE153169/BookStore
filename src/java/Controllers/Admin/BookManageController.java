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
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class BookManageController extends BaseAuthenticationController {

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
            request.setAttribute("authorList", auDao.getAllAuthorsActive());
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
            BookImageDAO biDao = new BookImageDAO();
            Book b = new Book();
            switch (request.getParameter("action")) {
                case Constant.Create: {
                    b.setTitle(request.getParameter("title"));
                    b.setAuthorId(Integer.parseInt(request.getParameter("authorId")));
                    b.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
                    b.setPageCount(Integer.parseInt(request.getParameter("pageCount")));
                    b.setPublisherId(Integer.parseInt(request.getParameter("publisherId")));
                    b.setPrice(Double.parseDouble(request.getParameter("price")));
                    b.setDescription(request.getParameter("description"));
                    b.setPublicationYear(Integer.parseInt(request.getParameter("publicationYear")));
                    b.setQuantity(Integer.parseInt(request.getParameter("quantity")));

                    //insert book to db
                    bDao.insert(b);
                    //get id of book already added
                    int newId = bDao.getLatestBook();

                    //get image send from client
                    List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList());

                    //get path folder to save image
                    String realPath = getServletContext().getRealPath("") + File.separator + "images";

                    for (Part part : fileParts) {
                        //random image name to avoid duplicate name
                        UUID uuid = UUID.randomUUID();
                        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                        String fileExtension = FilenameUtils.getExtension(filename);

                        if (!Files.exists(Paths.get(realPath))) {
                            Files.createDirectory(Paths.get(realPath));
                        }
                        filename = uuid + "." + fileExtension;
                        part.write(realPath + File.separator + filename);

                        response.getWriter().print("oke");
                        String pathImage = "images" + "/" + filename;
                        //add image to database
                        BookImage bi = new BookImage(newId, pathImage);
                        biDao.insert(bi);
                    }

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

                    //get image send from client
                    List<Part> fileParts = request.getParts().stream()
                            .filter(part -> "file".equals(part.getName()) && part.getSize() > 0 && !part.getSubmittedFileName().isEmpty())
                            .collect(Collectors.toList());

                    //check if there is have file or not
                    if (!fileParts.isEmpty()) {
                        //delete exist image
                        biDao.deleteImageByBookId(b.getBookId());
                        //get path folder to save image
                        String realPath = getServletContext().getRealPath("") + File.separator + "images";
                        for (Part part : fileParts) {
                            //random image name to avoid duplicate name
                            UUID uuid = UUID.randomUUID();
                            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                            String fileExtension = FilenameUtils.getExtension(filename);

                            //check if path folder exist or not
                            if (!Files.exists(Paths.get(realPath))) {
                                Files.createDirectory(Paths.get(realPath));
                            }

                            filename = uuid + "." + fileExtension;
                            part.write(realPath + File.separator + filename);

                            String pathImage = "images" + "/" + filename;

                            //add image to database
                            BookImage bi = new BookImage(b.getBookId(), pathImage);
                            biDao.insert(bi);
                        }
                    }
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
