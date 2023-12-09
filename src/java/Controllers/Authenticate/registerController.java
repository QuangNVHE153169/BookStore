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
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet registerController1</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerController1 at " + request.getContextPath() + "</h1>");
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
//        Date now = Date.valueOf(LocalDate.now());
//        request.setAttribute("now", now);
//        request.getRequestDispatcher("/views/Register.jsp").forward(request, response);
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

        UserDAO uDao = new UserDAO();
        EncodeMD5 encode = new EncodeMD5();

        //create new user model and set data send from client
        User user = new User();
        user.setFullName(request.getParameter("fullName"));
        user.setPhone(request.getParameter("phone"));
        user.setEmail(request.getParameter("email"));
        //encode password to MD5
        String hashPwd = encode.EncoderMD5(request.getParameter("password"));
        user.setPassword(hashPwd);
        user.setAddress(request.getParameter("address"));
        //parse string to sql.date
        Date dob = Date.valueOf(request.getParameter("dob"));
        user.setDob(dob);
        user.setGender(Integer.parseInt(request.getParameter("gender")));

        //check if email exist before or not
        boolean isExist = uDao.isUserExist(user.getEmail());
        if (isExist) {
            request.getSession().setAttribute("msg", "Email is exist! Try again!");
            request.setAttribute("account", user);
            request.getRequestDispatcher("home").forward(request, response);
        } else {
            int flag = uDao.insert(user);
            if (flag == 0) {
                request.setAttribute("account", user);
                request.getSession().setAttribute("msg", "Error when create account! Contact to Admin!");
                request.getRequestDispatcher("home").forward(request, response);
            } else {
                request.getSession().setAttribute("msg", "Register successful! You can login now!");
                response.sendRedirect("home");
            }
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
