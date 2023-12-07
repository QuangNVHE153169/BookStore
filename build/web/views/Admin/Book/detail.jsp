<%-- 
    Document   : detail
    Created on : Dec 7, 2023, 9:34:37 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Product Detail</title>
</style>
</head>
<%@include file="../../../layout/header.jsp" %>
<body>
    <%@include file="../../../layout/LeftAdminBar.jsp" %>
    <section style="margin-left: 280px; height: calc(92vh); overflow-y: auto;">
        <div class="card my-2 mx-2">
            <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="fs-2 fw-bold">
                        DETAIL PRODUCT
                    </h1>
                    <a type="button" class="btn btn-primary btn-lg" href="manage-book?bookId=${requestScope.book.bookId}">
                        <i class="fa-solid fa-plus"></i>
                        Update</a>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-2">
                        <img src="images/${requestScope.book.latestImage.url}" width="200px" height="200px"/>
                        <label class="mt-3">Image Product</label>
                    </div>
                    <div class="col-10">                       
                        <div class="row">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Title:</label>
                                <input type="text" class="form-control"
                                       disabled
                                       value="${requestScope.book.title}">
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Category</label>
                                <input type="text" class="form-control"
                                       disabled
                                       value="${requestScope.book.category.categoryName}">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Price</label>
                                <input type="text" class="form-control" disabled
                                       value="${requestScope.book.price}">
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Page Count</label>
                                <input type="text" class="form-control" disabled
                                       value="${requestScope.book.pageCount}">
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Quantity</label>
                                <input type="text" class="form-control" disabled
                                       value="${requestScope.book.quantity}">
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Publication Year</label>
                                <input type="text" class="form-control" disabled
                                       value="${requestScope.book.publicationYear}">
                            </div>
                        </div>
                        <c:if test="${requestScope.book == null}">
                            <div class="mt-3">
                                <label for="exampleFormControlFile1" class="col-form-label">Image</label>
                                <input type="file" class="form-control-file mt-2" name="file" id="file" accept="image/*"
                                       required>
                            </div>  
                        </c:if>
                        <div class="row mt-3">
                            <div class="col-6">
                                <label class="col-form-label">Author</label>
                                <input type="text" class="form-control"
                                       disabled
                                       value="${requestScope.book.author.authorName}">
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Publisher</label>
                                <input type="text" class="form-control"
                                       disabled
                                       value="${requestScope.book.publisher.publisherName}">
                            </div>
                        </div>
                        <div class="mb-3 mt-3">
                            <label for="category-film" class="col-form-label">Description</label>
                            <textarea class="form-control" disabled
                                      cols="30" data-error="description" rows="5" name="description">${requestScope.book.description}</textarea>
                            <span id="description" class="mt-2" style="color: red; display: none;"></span>
                        </div>                       
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

