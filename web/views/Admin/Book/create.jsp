<%-- 
    Document   : list
    Created on : Dec 5, 2023, 2:57:11 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Admin Book List</title>
</style>
</head>
<%@include file="../../../layout/header.jsp" %>
<body>
    <!-- Nav bar ADMIN wrapper, DONOT COPY THIS, JUST INCLUDE -->
    <section class="position-absolute d-flex flex-column flex-shrink-0 p-3 bg-light border-end"           
             style="width: 280px; height: calc(92vh);">
        <ul class="nav nav-pills flex-column mb-auto">
            <li>
                <a href="/admin-books" class="nav-link active">
                    Products
                </a>
            </li>
        </ul>
        <footer class="position-absolute bottom-0 start-0 end-0 text-center p-3" style="background-color: #deded540">
            © 2023 Copyright by Book Shop
        </footer>
    </section>
    <section style="margin-left: 280px; height: calc(92vh); overflow-y: auto;">
              
    </section>
</body>
