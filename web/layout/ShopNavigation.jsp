<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <body>
        <!-- Header of all content  -->
        <section class="sticky-top">
            <nav class="px-5 border-start border-end border-bottom background-white">
                <div class="border-start border-end py-3 px-3">
                    <ul class="nav col-12 col-md-auto">
                        <!-- ACTIVE TAB WILL USING primary-color css, other using link-dark  -->
                        <li>
                            <a href="home" class="nav-link px-3
                               ${pageContext.request.servletPath.equals("/views/homepage.jsp") ? "primary-color" : "link-dark"}
                               fs-5">HOME</a>
                        </li>
                        <li>
                            <a href="listAllBook" class="nav-link px-3
                               ${pageContext.request.servletPath.equals("/views/listBook.jsp") ? "primary-color" : "link-dark"}
                               fs-5">PRODUCTS</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link px-3 link-dark fs-5">CONTACT US</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </section>
    </body>

</html>
