/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.PublisherDAO;
import Model.Constant;
import Model.Publisher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ManagePublisherController extends BaseAuthenticationController {


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
        PublisherDAO pDao = new PublisherDAO();

        if (request.getParameter("publisherId") != null) {
            Publisher publisher = pDao.getPublisherById(Integer.parseInt(request.getParameter("publisherId")));
            request.setAttribute("publisher", publisher);
        }
        request.getRequestDispatcher("views/Admin/Publisher/create.jsp").forward(request, response);
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        PublisherDAO bDao = new PublisherDAO();
        Publisher publisher = new Publisher();
        int publisherId;
        String name;
        String country;
        int year;

        switch (action) {
            case Constant.Create:
                //get value is send from client
                name = request.getParameter("name");
                country = request.getParameter("country");
                year = Integer.parseInt(request.getParameter("year"));

                publisher.setPublisherName(name);
                publisher.setCountry(country);
                publisher.setFoundedYear(year);
                publisher.setStatus(Constant.StatusActive);
                publisher.setDeleteFlag(Constant.DeleteFalse);

                bDao.insertPublisher(publisher);

                request.getSession().setAttribute("msg", "Create publisher successful!");
                break;
            case Constant.Update:
                //get value is send from client
                publisherId = Integer.parseInt(request.getParameter("publisherId"));
                name = request.getParameter("name");
                country = request.getParameter("country");
                year = Integer.parseInt(request.getParameter("year"));

                publisher.setPublisherId(publisherId);
                publisher.setPublisherName(name);
                publisher.setCountry(country);
                publisher.setFoundedYear(year);

                bDao.updatePublisher(publisher);
                request.getSession().setAttribute("msg", "Update publisher successful!");
                break;
        }
        response.sendRedirect("listPublisher");
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
