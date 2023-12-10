package Controllers.Authenticate;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");
        RequestDispatcher dispatcher = null;
        
        try {
            //get otp send from client
            int value = Integer.parseInt(request.getParameter("otp"));
            if (value == otp) {
                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("/views/newPassword.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("message", "Wrong OTP! Try again");
                dispatcher = request.getRequestDispatcher("/views/enterOtp.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception ex) {
            //if otp is not number send message
            request.setAttribute("message", "Wrong OTP! Try again");
            dispatcher = request.getRequestDispatcher("/views/enterOtp.jsp");
            dispatcher.forward(request, response);
        }

    }

}
