<%-- 
    Document   : LeftAdminBar
    Created on : Dec 7, 2023, 9:36:06 AM
    Author     : Admin
--%>
<!-- Nav bar ADMIN wrapper, DONOT COPY THIS, JUST INCLUDE -->
<section class="position-absolute d-flex flex-column flex-shrink-0 p-3 bg-light border-end"           
         style="width: 280px; height: calc(92vh);">
    <ul class="nav nav-pills flex-column mb-auto">
        <li>
            <a href="${pageContext.request.contextPath}/admin-books" class="nav-link
               ${pageContext.request.servletPath.equals("/views/Admin/Book/list.jsp")? "active" : ""}">
                Manage Product
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/authorManage" class="nav-link
               ${pageContext.request.servletPath.equals("/views/Admin/Category/list.jsp")? "active" : ""}">
                Manage Category
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/authorManage" class="nav-link
               ${pageContext.request.servletPath.equals("/views/Admin/Author/list.jsp")? "active" : ""}">
                Manage Author
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/listPublisher" class="nav-link
               ${pageContext.request.servletPath.equals("/views/Admin/Publisher/list.jsp")? "active" : ""}">
                Manage Publisher
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin-books" class="nav-link
               ${pageContext.request.servletPath.equals("/views/Admin/User/list.jsp")? "active" : ""}">
                Manage User
            </a>
        </li>
    </ul>
    <footer class="position-absolute bottom-0 start-0 end-0 text-center p-3" style="background-color: #deded540">
        @ 2023 Copyright by Book Shop
    </footer>
</section>
