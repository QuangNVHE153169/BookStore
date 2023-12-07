package Controllers.Admin;

import Controllers.Authenticate.BaseAuthenticationController;
import Controllers.Book.BookController;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import DAL.CategoryDAO;
import jakarta.servlet.jsp.PageContext;

public class BookAdminController extends BaseAuthenticationController {

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
            out.println("<title>Servlet bookAdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookAdminController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/error/403.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/error/403.jsp").forward(request, response);
    }

    @Override
    protected void processAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookController bCon = new BookController();
        bCon.getAllBooks(request, response);
        CategoryDAO cDao = new CategoryDAO();
        request.setAttribute("categories", cDao.getCategories());

        if (request.getParameter("bookId") != null) {
            //send id to get book details
            request.setAttribute("bookId",request.getParameter("bookId"));
            bCon.getBook(request, response);
        } else {
            bCon.getAllBooks(request, response);
            request.setAttribute("categories", cDao.getCategories());
            request.getRequestDispatcher("/views/Admin/Book/list.jsp").forward(request, response);
        }

    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
