/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.UserDAO;
import Model.Constant;
import Model.Role;
import Model.User;
import Utils.EmailService;
import Utils.EncodeMD5;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;

public class ManageStaffController extends BaseAuthenticationController {
    public static void main(String[] args) {
        User user = new User();
        user.setFullName("oke");
        user.setEmail("oke");
        user.setPassword("oke");
        user.setPhone("oke");
        user.setDob(Date.valueOf(LocalDate.now()));
        user.setAddress("oke");
        user.setAvatar(Constant.DefaultAvatar);
        user.setGender(1);
        Role role = new Role();
        role.setId(1);
        user.setRole(role);
        user.setDescription("oke");
        user.setStatus(Constant.StatusActive);

        UserDAO udao = new UserDAO();
        System.out.println(udao.insertNewUser(user));
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
            User staff = uDao.getUserByID(Integer.parseInt(request.getParameter("userId")));
            request.setAttribute("staff", staff);
        }
        request.getRequestDispatcher("views/Admin/Staff/create.jsp").forward(request, response);
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodeMD5 encode = new EncodeMD5();
        String action = request.getParameter("action");
        UserDAO uDao = new UserDAO();

        User user;
        Role role;
        boolean isEmailExist;

        int userId;
        String name;
        String email;
        String password;
        String phone;
        Date dob;
        String address;
        String avatar;
        int gender;
        int roleId;
        String description;

        switch (action) {
            case Constant.Create:
                //get value is send from client
                name = request.getParameter("name");
                email = request.getParameter("email");
                phone = request.getParameter("phone");
                dob = Date.valueOf(request.getParameter("dob"));
                address = request.getParameter("address");
                avatar = Constant.DefaultAvatar;
                gender = Integer.parseInt(request.getParameter("gender"));
                roleId = Constant.RoleAdminSale;
                description = request.getParameter("description");

                role = new Role();
                role.setId(roleId);

                //encode default password
                password = encode.EncoderMD5(Constant.DefaultPassword);

                user = new User();
                user.setFullName(name);
                user.setEmail(email);
                user.setPassword(password);
                user.setPhone(phone);
                user.setDob(dob);
                user.setAddress(address);
                user.setAvatar(avatar);
                user.setGender(gender);
                user.setRole(role);
                user.setDescription(description);
                user.setStatus(Constant.StatusActive);

                isEmailExist = uDao.isMailExist(email);
                if (isEmailExist) {
                    request.setAttribute("staff", user);
                    request.setAttribute("emailExist", true);
                    request.getSession().setAttribute("msg", "Email is exist in an account! Try again!");
                    request.getRequestDispatcher("views/Admin/Staff/create.jsp").forward(request, response);
                } else {
                    uDao.insertNewUser(user);
                    EmailService.sendEmailPassword(email, Constant.DefaultPassword);
                    request.getSession().setAttribute("msg", "Create staff successful!An email is sent with password of account, please notificate to staff!");
                    response.sendRedirect("admin-staff");
                }
                break;
            case Constant.Update:
                //get user by user id
                userId = Integer.parseInt(request.getParameter("userId"));
                user = uDao.getUserByID(userId);

                //get value is send from client
                name = request.getParameter("name");
                phone = request.getParameter("phone");
                dob = Date.valueOf(request.getParameter("dob"));
                address = request.getParameter("address");
                gender = Integer.parseInt(request.getParameter("gender"));
                description = request.getParameter("description");

                user.setFullName(name);
                user.setPhone(phone);
                user.setDob(dob);
                user.setAddress(address);
                user.setGender(gender);
                user.setDescription(description);

                uDao.updateUser(user);
                request.getSession().setAttribute("msg", "Update staff successful!");
                response.sendRedirect("admin-staff");
                break;
            case Constant.UpdateStatus:
                //get user by user id
                userId = Integer.parseInt(request.getParameter("userId"));
                boolean status = Boolean.valueOf(request.getParameter("status"));
                uDao.changeStatus(userId, status);
                if (!status) {
                    request.getSession().setAttribute("msg", "Lock staff with ID:" + userId + " successful!");
                } else {
                    request.getSession().setAttribute("msg", "Unlock staff with ID:" + userId + " successful!");
                }
                response.sendRedirect("admin-staff");
                break;
        }
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
