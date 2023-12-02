package Controllers;

import DAL.UserDAO;
import Utils.EncodeMD5;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("newPwd");
        
        EncodeMD5 encode = new EncodeMD5();
        newPassword = encode.EncoderMD5(newPassword);
        
        UserDAO uDao = new UserDAO();
        int status = uDao.resetPassWord((String) session.getAttribute("email"),newPassword);
        session.setAttribute("resetPass", status+"");
        response.sendRedirect("home");
    }

}
