<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Product Detail</title>
        <link rel="stylesheet" href="styles.css" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
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
                        <img src="images/${requestScope.book.latestImage.url}" width="100%" height="auto"/>
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

