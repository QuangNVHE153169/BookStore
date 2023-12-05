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
        <div class="card my-2 mx-2">
            <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="fs-2 fw-bold">
                        PRODUCTS
                    </h1>
                    <a type="button" class="btn btn-primary btn-lg" href="manage-book">
                        <i class="fa-solid fa-plus"></i>
                        Add Product</a>
                </div>
            </div>
            <div class="card-body">
                <div class="p-4">                   
                    <form action="/admin-books" method="get" class="row align-items-center mt-3" >
                        <div class="col-8">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search by title" name="textSearch" value="${requestScope.textSearch}"/>
                                <button id="search-button" type="submit" class="btn btn-primary">
                                    SEARCH
                                </button>
                            </div>                        
                        </div>
                        <div class="col-2">
                            <select class="form-select" name="categoryId">
                                <c:forEach var="item" items="${categories}">
                                    <option value="${item.categoryId}" ${requestScope.categoryId == item.categoryId ? "selected" : ""} >${item.categoryName}</option>                           
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-2">
                            <select class="form-select" name="status">
                                <option value="1" ${requestScope.status == 1 ? "selected" : ""}>Active</option>
                                <option value="0" ${requestScope.status == 0 ? "selected" : ""}>De-active</option>
                            </select>
                        </div>
                    </form>
                    <div class="mt-3 container bg-white border rounded-1">                 
                        <table class="table mt-3">
                            <thead>
                                <tr style="background-color: #00000010;">
                                    <th scope="col">No</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Status</th>
                                    <th scope="col" style="width: 280px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${items}">
                                    <tr>
                                        <th class="d-flex align-items-center" style="height: 78px;" scope="row">${item.bookId}</th>
                                        <td style="width: 25%; height: 78px;">
                                            <div class="d-flex gap-2 align-items-center">
                                                <img src="${item.latestImage.url}"
                                                     class="rounded-2" style="width: 60px; height: 60px; object-fit: contain;" />
                                                <h6 class="truncate-2-line">${item.title}</h6>
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.category.categoryName}
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.quantity}
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.price}
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.status == true ? "Active" : "Deactive"}
                                            </div>
                                        </td>
                                        <td class="d-flex gap-2 align-items-center" style="width: 280px; height: 78px;">
                                            <a href="manage-book?bookId=${item.bookId}" type="button" class="btn btn-outline-secondary me-2"
                                               <i class="fa-solid fa-pen-to-square"></i>
                                                Update</a>

                                            <button type="button" class="btn btn-danger me-2 delete-btn" data-bs-toggle="modal"
                                                    data-bs-target="#deleteItem" data-id="${item.bookId}" data-price="${item.price}" data-name="${item.title}"
                                                    onclick="confirmDelete(this)">
                                                <i class="fa-solid fa-trash"></i>
                                                Remove</button>                                
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${items.size() == 0}">
                                    <tr>
                                        <td colspan="7">
                                            <div class="text-center">
                                                <span>No result</span>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>

                    <div class="modal fade" id="deleteItem" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        Delete Confirm
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Are you sure to delete this book?
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>

                                <div class="modal-body">
                                    <span id="priceModal"></span>
                                </div>           
                                <form action="manage-book" method="POST">
                                    <input type="hidden" class="form-control" id="idModal" name="bookId"
                                           value="">
                                    <input type="hidden" class="form-control" name="action"
                                           value="D">
                                    <div class="modal-footer">
                                        <button style="width:100px" type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">
                                            Close
                                        </button>
                                        <button style="width:100px" type="submit" class="btn btn-danger">
                                            Delete</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!--Pagination of item (10 item each page)--> 
                    <c:if test="${items.size() > 0}">
                        <div class="d-flex justify-content-center mt-1">
                            <nav aria-label="Page navigation example col-12">
                                <ul class="pagination">
                                    <%--For displaying Previous link except for the 1st page --%>
                                    <c:if test="${currentPage != 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="admin-books?page=${currentPage - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <%--For displaying Page numbers. The when condition does not display
                                                a link for the current page--%>
                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                        <c:choose>
                                            <c:when test="${currentPage eq i}"> 
                                                <li class="page-item"><a class="page-link bg-light" href="#">${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li class="page-item"><a class="page-link" href="admin-books?page=${i}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                    <%--For displaying Next link --%>
                                    <c:if test="${currentPage lt totalPage}">
                                        <li class="page-item">
                                            <a class="page-link" href="admin-books?page=${currentPage + 1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </c:if>
                </div>   
            </div>
        </div>
    </section>
    <!--This container belong to FOOTER of ADMIN; DONT copy to JSP, JUST INCLUDE--> 
    <script>
        function confirmDelete(input) {
            var id = input.getAttribute('data-id')
            var price = input.getAttribute('data-price')
            var name = input.getAttribute('data-name')
            var detail = name + ' ' + price
            document.getElementById("priceModal").textContent = detail
            document.getElementById("idModal").value = id
        }
    </script>
</body>
