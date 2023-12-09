<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>${requestScope.book != null ? "Update Product" : "Create Product"}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book-shop</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
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
                        ${requestScope.book != null ? "UPDATE PRODUCT" : "CREATE PRODUCT"}
                    </h1>
                    <div>
                        <c:if test="${requestScope.book != null}">
                            <a type="button" class="btn btn-secondary btn-lg" href="admin-books?bookId=${requestScope.book.bookId}">
                                Cancel</a>
                        </c:if>

                        <a type="button" class="btn btn-primary btn-lg" onclick="submitForm()">
                            Save</a>
                    </div>

                </div>
            </div>
            <div class="card-body">
                <form method="POST" action="manage-book" id="submitForm" enctype="multipart/form-data">
                    <div class="col">
                        <div class="row">
                            <input type="hidden" name="action"
                                   value="${requestScope.book != null ? "U" : "C"}">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Title:</label>
                                <input type="text" class="form-control" data-error="title" 
                                       oninput="validateInputBox(this)" name="title" ${requestScope.book != null ? "disabled" : ""}
                                       value="${requestScope.book.title}" required>
                                <span id="title" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Category</label>
                                <select class="form-select" data-error="categoryId" onchange="validateSelectBox(this)"
                                        name="categoryId" required>
                                    <option value="" selected>Choose Category</option>
                                    <c:forEach var="item" items="${categoryList}">
                                        <option ${requestScope.book.categoryId == item.categoryId ? "selected" : ""} value="${item.categoryId}">${item.categoryName}</option>
                                    </c:forEach>
                                </select>
                                <span id="categoryId" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Price</label>
                                <input type="number" class="form-control" oninput="validateInputBox(this)"
                                       value="${requestScope.book.price}"
                                       name="price" data-error="price" min="0" required>
                                <span id="price" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Page Count</label>
                                <input type="number" class="form-control" 
                                       value="${requestScope.book.pageCount}" min="0"
                                       oninput="validateInputBox(this)" name="pageCount" data-error="pageCount" required>
                                <span id="pageCount" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Quantity</label>
                                <input type="number" class="form-control" oninput="validateInputBox(this)"
                                       value="${requestScope.book.quantity}"
                                       name="quantity" data-error="quantity" required min="0">
                                <span id="quantity" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Publication Year</label>
                                <input type="number" class="form-control" 
                                       value="${requestScope.book.publicationYear}" min="0"
                                       oninput="validateInputBox(this)" name="publicationYear" data-error="publicationYear" required>
                                <span id="publicationYear" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>
                        <c:if test="${requestScope.book.images == null}">
                            <div class="mt-3">
                                <label for="exampleFormControlFile1" class="col-form-label">Image</label>
                                <input type="file" class="form-control-file mt-2" name="file" id="file" accept="image/*" multiple
                                       required>
                                <span id="file" class="mt-2" style="color: red; display: none;"></span>
                            </div>  
                        </c:if>
                        <c:if test="${requestScope.book.images != null}">
                            <div class="mt-3">
                                <label for="exampleFormControlFile1" class="col-form-label">Update Image</label>
                                <input type="file" class="form-control-file mt-2" name="file" id="file" accept="image/*" multiple
                                       required>
                                <c:forEach items="${book.images}" var="img">
                                    <img style="width: 50px; height: 50px; object-fit: cover; border-radius: 8px;"
                                         src="${img.url}"
                                         alt="book-shop">
                                </c:forEach>
                            </div>  
                        </c:if>
                        <div class="row mt-3">
                            <div class="col-6">
                                <label class="col-form-label">Author</label>
                                <select class="form-select" name="authorId" ${requestScope.book != null ? "disabled" : ""}
                                        data-error="authorId" required onchange="validateSelectBox(this)">
                                    <option value="" selected>Choose Author</option>
                                    <c:forEach var="item" items="${authorList}">
                                        <option ${requestScope.book.authorId == item.authorId ? "selected" : ""} value="${item.authorId}">${item.authorName}</option>
                                    </c:forEach>
                                </select>
                                <span id="authorId" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Publisher</label>
                                <select class="form-select" name="publisherId" ${requestScope.book != null ? "disabled" : ""}
                                        data-error="publisherId" required onchange="validateSelectBox(this)">
                                    <option value="" selected>Choose publisher</option>
                                    <c:forEach var="item" items="${publisherList}">
                                        <option <option ${requestScope.book.publisherId == item.publisherId ? "selected" : ""} value="${item.publisherId}">${item.publisherName}</option>
                                    </c:forEach>
                                </select>
                                <span id="publisherId" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="category-film" class="col-form-label">Description</label>
                            <textarea class="form-control" oninput="validateInputBox(this)"
                                      value="${requestScope.book.description}"
                                      cols="30" data-error="description" rows="5" name="description" minlength="40">${requestScope.book.description}</textarea>
                            <span id="description" class="mt-2" style="color: red; display: none;"></span>
                        </div>                       
                        <c:if test="${requestScope.book != null}">
                            <input type="hidden" name="bookId"
                                   value="${requestScope.book.bookId}">
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>

<!-- Script using  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
<script>
                                            checkSelect = ${requestScope.book != null ? true : false};
                                            checkInput = ${requestScope.book != null ? true : false};
                                            function validateSelectBox(input) {
                                                var val = input.value
                                                if (val == "") {
                                                    document.getElementById(input.getAttribute("data-error")).textContent = "Select required";
                                                    document.getElementById(input.getAttribute("data-error")).style.display = "block";
                                                } else {
                                                    document.getElementById(input.getAttribute("data-error")).textContent = "";
                                                    document.getElementById(input.getAttribute("data-error")).style.display = "none";
                                                    checkSelect = true;
                                                }
                                            }

                                            function validateInputBox(input) {
                                                var val = input.value
                                                if (val == "") {
                                                    document.getElementById(input.getAttribute("data-error")).textContent = "Input required";
                                                    document.getElementById(input.getAttribute("data-error")).style.display = "block";
                                                } else {
                                                    document.getElementById(input.getAttribute("data-error")).textContent = "";
                                                    document.getElementById(input.getAttribute("data-error")).style.display = "none";
                                                    checkInput = true;
                                                }
                                            }

                                            function checkNullSelectbox() {
                                                var inputForm = document.getElementsByClassName("form-select");
                                                for (var i = 0; i < inputForm.length; i++) {
                                                    validateSelectBox(inputForm[i])
                                                }
                                                for (var i = 0; i < inputForm.length; i++) {
                                                    if (inputForm[i].value == "") {
                                                        checkSelect = false;
                                                        break
                                                    }
                                                }
                                            }

                                            function checkNullInputBox() {
                                                var selectForm = document.getElementsByClassName("form-control")
                                                for (var i = 0; i < selectForm.length; i++) {
                                                    validateInputBox(selectForm[i])
                                                }
                                                for (var i = 0; i < selectForm.length; i++) {
                                                    if (selectForm[i].value == "") {
                                                        checkInput = false;
                                                        break
                                                    }
                                                }
                                            }

                                            function submitForm() {
                                                checkNullInputBox();
                                                checkNullInputBox();
                                                if (document.getElementById("file") != null) {
                                                    if (checkInput && checkSelect && document.getElementById("file").value != null) {
                                                        document.getElementById("submitForm").submit();
                                                    }
                                                } else {
                                                    if (checkInput && checkSelect) {
                                                        document.getElementById("submitForm").submit();
                                                    }
                                                }
                                            }
</script>
