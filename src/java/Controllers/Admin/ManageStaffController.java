/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.AuthorDAO;
import DAL.UserDAO;
import Model.Author;
import Model.Constant;
import Model.User;
import Utils.EmailService;
import Utils.EncodeMD5;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class ManageStaffController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO uDao = new UserDAO();
        if (request.getParameter("userId") != null) {
            User user = uDao.getUserByID(Integer.parseInt(request.getParameter("userId")));
            request.setAttribute("user", user);
        }
        request.getRequestDispatcher("views/Admin/Staff/create.jsp").forward(request, response);
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO uDao = new UserDAO();
        User user = new User();
        int userId;
        String fullName;
        Date dob;
        String email;
        int gender;
        String phone;
        switch (action) {
            case Constant.Create:
                EncodeMD5 encode = new EncodeMD5();
                EmailService emailServ = new EmailService();
                //get value is send from client
                fullName = request.getParameter("fullName");
                dob = Date.valueOf(request.getParameter("dob"));
                email = request.getParameter("email");
                phone = request.getParameter("phone");
                gender = Integer.parseInt(request.getParameter("gender"));
                String password = encode.EncoderMD5(phone + "@");
                user.setFullName(fullName);
                user.setEmail(email);
                user.setGender(gender);
                user.setPhone(phone);
                user.setDob(dob);
                user.setPassword(password);
                uDao.insertStaff(user);
                emailServ.sendEmailPassword(email, phone);
                request.getSession().setAttribute("msg", "Create Staff Successfully");
                
                break;
            case Constant.Update:
                //get value is send from client
                fullName = request.getParameter("fullName");
                dob = Date.valueOf(request.getParameter("dob"));
                phone = request.getParameter("phone");
                gender = Integer.parseInt(request.getParameter("gender"));
                userId = Integer.parseInt(request.getParameter("userId"));
                user.setFullName(fullName);
                user.setGender(gender);
                user.setPhone(phone);
                user.setDob(dob);
                user.setUserID(userId);

                uDao.updateStaff(user);
                request.getSession().setAttribute("msg", "Upate Successfully");

                break;
        }
        response.sendRedirect("admin-staff");
    }

    @Override
    protected void processSaleAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processSaleAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
