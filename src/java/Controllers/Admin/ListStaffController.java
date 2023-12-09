/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import Controllers.Authenticate.BaseAuthenticationController;
import DAL.PublisherDAO;
import DAL.RoleDAO;
import DAL.UserDAO;
import Model.Constant;
import Model.Publisher;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

/**
 *
 * @author dell
 */
public class ListStaffController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void processAdminGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO uDao = new UserDAO();
        RoleDAO rDao = new RoleDAO();
        if (request.getParameter("userId") != null && !request.getParameter("userId").isEmpty()) {
            User user = uDao.getUserByID(Integer.parseInt(request.getParameter("userId")));
            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/Admin/Staff/detail.jsp").forward(request, response);
        } else {
            int page = 1;
            String textSearch = getStringParameter(request, response, "textSearch");
            int status = -1;
            int roleId = -1;

            if (getStringParameter(request, response, "status") != "") {
                status = Integer.parseInt(request.getParameter("status"));
            }
            if (getStringParameter(request, response, "roleId") != "") {
                roleId = Integer.parseInt(request.getParameter("roleId"));
            }
            ArrayList<User> users = uDao.getAllUsers((page - 1) * Constant.RecordPerPage, Constant.RecordPerPage, textSearch, status, roleId);
            int totalPublisher = uDao.getTotalUser(textSearch, status, roleId);
            int totalPage = (int) Math.ceil((double) totalPublisher / Constant.RecordPerPage);

            request.setAttribute("items", users);

            request.setAttribute("totalPage", totalPage);
            request.setAttribute("currentPage", page);

            request.setAttribute("roles", rDao.getRoles());

            request.setAttribute("textSearch", textSearch);
            request.setAttribute("status", status);
            request.setAttribute("roleId", roleId);

            request.getRequestDispatcher("/views/Admin/Staff/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void processAdminPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public String getQueryString(HttpServletRequest request, HttpServletResponse response) {
        String queryString = getTrueQueryString(request, response);
        if (!queryString.isEmpty()) {
            Map<String, String> params = Arrays.stream(queryString.split("&"))
                    .map(s -> s.split("="))
                    .collect(Collectors.toMap(
                            arr -> arr[0],
                            arr -> arr.length > 1 ? arr[1] : ""
                    ));

            params.entrySet().removeIf(entry -> entry.getKey().startsWith("page"));

            String newQueryString = params.entrySet().stream()
                    .map(entry -> entry.getKey() + "=" + entry.getValue())
                    .collect(Collectors.joining("&"));

            return !newQueryString.isEmpty() ? newQueryString + "&" : "";
        }

        return "";
    }

    public String getStringParameter(HttpServletRequest request, HttpServletResponse response, String parameter) {
        if (request.getParameter(parameter) != null && !request.getParameter(parameter).isEmpty()) {
            return request.getParameter(parameter);
        }
        return "";
    }

    public String getTrueQueryString(HttpServletRequest request, HttpServletResponse response) {
        if (request.getQueryString() != null && !request.getQueryString().isEmpty()) {
            return request.getQueryString();
        }
        return "";
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
