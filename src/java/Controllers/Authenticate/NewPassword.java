package Controllers.Authenticate;

import DAL.UserDAO;
import Utils.EncodeMD5;
import java.io.IOException;
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        //get new password of user
        String newPassword = request.getParameter("newPwd");
        
        //encode password to MD5
        EncodeMD5 encode = new EncodeMD5();
        newPassword = encode.EncoderMD5(newPassword);
        
        //set new password according to email
        UserDAO uDao = new UserDAO();
        int status = uDao.resetPassWord((String) session.getAttribute("email"),newPassword);
        session.setAttribute("msg", "Reset password susscessful!");
        response.sendRedirect("home");
    }

}
