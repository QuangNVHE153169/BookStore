<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Author management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
</head>
<%@include file="../../../layout/header.jsp" %>
<body>
    <%@include file="../../../layout/LeftAdminBar.jsp" %>
    <section style="margin-left: 280px; height: calc(92vh); overflow-y: auto;">
        <div class="card my-2 mx-2">
            <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="fs-2 fw-bold">
                        List Author
                    </h1>
                    <a type="button" class="btn btn-primary btn-lg" href="createAuthor">
                        <i class="fa-solid fa-plus"></i>
                        Add Author</a>
                </div>
            </div>
            <div class="card-body">
                <div class="p-4">                   
                    <div class="mt-3 container bg-white border rounded-1">                 
                        <table class="table mt-3">
                            <thead>
                                <tr style="background-color: #00000010;">
                                    <th scope="col">ID</th>
                                    <th scope="col">Author Name</th>
                                    <th scope="col">DOB</th>
                                    <th scope="col">Status</th>
                                    <th scope="col" style="width: 280px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${items}">
                                    <tr>
                                        <th class="d-flex align-items-center" style="height: 78px;" scope="row">${item.authorId}</th>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.authorName}
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.dob}
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.status == true ? "Active" : "Deactive"}
                                            </div>
                                        </td>
                                        <td class="d-flex gap-2 align-items-center" style="width: 280px; height: 78px;">
                                            <a href="authorManage?authorId=${item.authorId}" type="button" class="btn btn-outline-secondary me-2">
                                               <i class="fa-solid fa-pen-to-square"></i>
                                                Detail</a>                              
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

                    <!--Pagination of item (10 item each page)--> 
                    <c:if test="${items.size() > 0}">
                        <div class="d-flex justify-content-center mt-1">
                            <nav aria-label="Page navigation example col-12">
                                <ul class="pagination">
                                    <%--For displaying Previous link except for the 1st page --%>
                                    <c:if test="${currentPage != 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="authorManage?${queryString}page=${currentPage - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <%--For displaying Page numbers. The when condition does not display
                                                a link for the current page--%>
                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                        <c:choose>
                                            <c:when test="${currentPage eq i}"> 
                                                <li class="page-item"><a class="page-link bg-light">${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li class="page-item"><a class="page-link" href="authorManage?${queryString}page=${i}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                    <%--For displaying Next link --%>
                                    <c:if test="${currentPage lt totalPage}">
                                        <li class="page-item">
                                            <a class="page-link" href="authorManage?${queryString}page=${currentPage + 1}" aria-label="Next">
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
            var id = input.getAttribute('data-id');
            var price = input.getAttribute('data-price');
            var name = input.getAttribute('data-name');
            var detail = name + ' ' + price;
            document.getElementById("priceModal").textContent = detail;
            document.getElementById("idModal").value = id;
        }
    </script>
    <!-- Script using  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
</body>
