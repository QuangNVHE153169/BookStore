<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- <div data-include="left-side-profile-bar"></div> -->
        <!-- this is left side profile bar, put in separate pile in jsp -->
        <div class="p-3 d-flex flex-column gap-2"
             style="width: 300px; border-right: 1px solid gray; height: calc(100vh - 74px);">
            <h2>
                Profile
            </h2>
            <ul class="nav d-flex flex-column gap-1">
                <li class="nav-link">
                    <a class="href-unstyled ${pageContext.request.servletPath.equals("/views/User/userProfile.jsp") ? "primary-color" : ""}" href="user-profile"><span class="fa fa-user me-2"></span>
                        Information</a>
                </li>

                <li class="nav-link">
                    <a class="href-unstyled ${pageContext.request.servletPath.equals("/views/User/changePassword.jsp") ? "primary-color" : ""}" href="change-password"><span class="fa-solid fa-unlock me-2"></span>
                        Change password</a>
                </li>
                
                <li class="nav-link">
                    <a class="href-unstyled ${pageContext.request.servletPath.equals("/views/User/myOrder.jsp") ? "primary-color" : ""}" href="my-order"><span class="fa-solid fa-unlock me-2"></span>
                        My Order</a>
                </li>
            </ul>
        </div>
    </body>
</html>
