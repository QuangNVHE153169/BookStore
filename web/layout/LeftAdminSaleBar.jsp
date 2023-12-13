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
            <a href="${pageContext.request.contextPath}/admin-sale-orders" class="nav-link
               ${pageContext.request.servletPath.equals("/views/SaleAdmin/Order/list.jsp")? "active" : ""}">
                Manage Order
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin-customer" class="nav-link
               ${pageContext.request.servletPath.equals("/views/SaleAdmin/Customer/list.jsp")? "active" : ""}">
                Manage Customer
            </a>
        </li>
    </ul>
    <footer class="position-absolute bottom-0 start-0 end-0 text-center p-3" style="background-color: #deded540">
        @ 2023 Copyright by Book Shop
    </footer>
</section>
