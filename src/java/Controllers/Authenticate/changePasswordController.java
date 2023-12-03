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
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class changePasswordController extends BaseAuthenticationController {

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
            out.println("<title>Servlet ChangePasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/User/ChangePassword.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        User account = (User) request.getSession().getAttribute("account");

        String oldPwd = request.getParameter("oldPwd");
        String newPwd = request.getParameter("newPwd");

        UserDAO uDao = new UserDAO();
        EncodeMD5 encode = new EncodeMD5();
        String encodeOldPass = encode.EncoderMD5(oldPwd);
        String encodeNewPass = encode.EncoderMD5(newPwd);

        User acc = uDao.doLogin(account.getEmail(), encodeOldPass);
        if (acc == null) {
            request.getSession().setAttribute("msg", "Old password not correct! Please try again");
            response.sendRedirect("change-password");
        } else {
            request.getSession().setAttribute("msg", "Change password successfully! Please re-login with new password");
            request.getSession().removeAttribute("account");
            uDao.changePassword(account.getEmail(),encodeNewPass);
            response.sendRedirect("home");
        }
    }

}
