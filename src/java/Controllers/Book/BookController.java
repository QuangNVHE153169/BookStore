package Controllers.Book;

import DAL.BookDAO;
import DAL.CategoryDAO;
import Model.Bindings.BookBinding;
import Model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import Model.Constant;
import Utils.BookService;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

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

    public void getAllBooks(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CategoryDAO cDao = new CategoryDAO();
        //start at page 1
        int page = 1;
        //declare sort option
        int sortBy = 0;

        //initial bookbinding model
        BookBinding bookBinding = new BookBinding();
        bookBinding.setStatus(-1);

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
        String queryString = getQueryString(request, response);
        ArrayList<Book> books = bDao.getBookPaginate(page, Constant.RecordPerPage, bookBinding, sortBy);
        request.setAttribute("items", books);

        request.setAttribute("totalPage", bDao.getTotalPage(bookBinding));
        request.setAttribute("currentPage", page);

        request.setAttribute("categories", cDao.getCategories());

        //save value search of client
        request.setAttribute("authorId", request.getParameter("authorId"));
        request.setAttribute("categoryId", request.getParameter("categoryId"));
        request.setAttribute("publisherId", request.getParameter("publisherId"));
        request.setAttribute("textSearch", request.getParameter("textSearch"));
        request.setAttribute("minPrice", request.getParameter("minPrice"));
        request.setAttribute("maxPrice", request.getParameter("maxPrice"));
        request.setAttribute("status", request.getParameter("status"));
        request.setAttribute("sortBy", request.getParameter("sortBy"));
        request.setAttribute("queryString", getQueryString(request, response));
    }

    public void getBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("bookId") != null) {
            BookDAO bDao = new BookDAO();
            Book b = bDao.getBookDetailById(Integer.parseInt(request.getParameter("bookId")));
            if (b != null) {
                //get all book in list
                ArrayList<Book> listBook = bDao.getAllBook();

                //get random 5 book and set to top 5 feature book
                request.setAttribute("featurebook", BookService.GetRandomBook(listBook, 4));

                request.setAttribute("book", b);
            } else {
                request.setAttribute("msg", "Book is not exist");
            }
        }
    }

    public String getQueryString(HttpServletRequest request, HttpServletResponse response) {
        String queryString = getTrueQueryString(request, response);
        if (!queryString.isEmpty()) {
            Map<String, String> params = Arrays.stream(queryString.split("&"))
                    .map(s -> s.split("="))
                    .collect(Collectors.toMap(
                            arr -> arr[0],
                            arr -> arr.length > 1 ? arr[1] : ""
                    ));

            params.entrySet().removeIf(entry -> entry.getKey().startsWith("page"));

            String newQueryString = params.entrySet().stream()
                    .map(entry -> entry.getKey() + "=" + entry.getValue())
                    .collect(Collectors.joining("&"));

            return !newQueryString.isEmpty() ? newQueryString + "&" : "";
        }

        return "";
    }

    public String getStringParameter(HttpServletRequest request, HttpServletResponse response, String parameter) {
        if (request.getParameter(parameter) != null && !request.getParameter(parameter).isEmpty()) {
            return request.getParameter(parameter);
        }
        return "";
    }

    public String getTrueQueryString(HttpServletRequest request, HttpServletResponse response) {
        if (request.getQueryString() != null && !request.getQueryString().isEmpty()) {
            return request.getQueryString();
        }
        return "";
    }
}
