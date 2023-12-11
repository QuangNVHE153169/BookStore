/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Authenticate;

import DAL.UserDAO;
import Model.User;
import Utils.EncodeMD5;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Constant;
/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController1 at " + request.getContextPath() + "</h1>");
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
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

//    public static void main(String[] args) {
//        EncodeMD5 encode = new EncodeMD5();
//        UserDAO uDAO = new UserDAO();
//        User user = uDAO.doLogin("cus1@gmail.com", encode.EncoderMD5("123@123"));
//        System.out.println(user);
//    }
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
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");

        EncodeMD5 encode = new EncodeMD5();
        //ecode password to md5
        String encodePwd = encode.EncoderMD5(pwd);

        UserDAO uDAO = new UserDAO();
        //do login
        User user = uDAO.doLogin(email, encodePwd);
        //check if user exist or not
        if (user != null) {
            request.getSession().setAttribute("msg", "Login successful!");
            request.getSession().setAttribute("account", user);
            switch (user.getRole().getId()) {
                case Constant.RoleAdmin:
                    response.sendRedirect("admin-books");
                    break;
                case Constant.RoleAdminSale:
                    response.sendRedirect("admin-sale-orders");
                    break;
                default:
                    response.sendRedirect("home");
                    break;
            }
        } else {
            request.getSession().setAttribute("msg", "Login fail! Wrong email or password or you not have permission to login!");
            response.sendRedirect("home");
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
}
