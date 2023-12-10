<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Publisher management</title>
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
                        ${requestScope.publisher != null ? "UPDATE PUBLISHER" : "CREATE PUBLISHER"}
                    </h1>
                    <div>
                        <a type="button" class="btn btn-primary btn-lg" href="createPublisher?publisherId=${requestScope.publisher.publisherId}">
                            Update</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <form method="POST" action="createPublisher" id="form-create">
                    <input type="hidden" name="action"
                           value="${requestScope.publisher != null ? "U" : "C"}">
                    <div class="col">
                        <c:if test="${requestScope.publisher != null}">
                            <div class="row">
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">PublisherID:</label> ${requestScope.publisher.publisherId}
                                    <input type="hidden" name="publisherId"
                                           value="${requestScope.publisher.publisherId}">
                                </div>
                            </div>
                        </c:if>
                        <div class="row">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Publisher Name:</label>
                                <input type="text" class="form-control" data-error="name" 
                                       oninput="validateInputBox(this)" name="name"
                                       value="${requestScope.publisher.publisherName}" readonly disabled>
                                <span id="name" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Publisher Nationality:</label>
                                <input type="text" class="form-control" data-error="nation" 
                                       oninput="validateInputBox(this)" name="country"
                                       value="${requestScope.publisher.country}" readonly disabled>
                                <span id="nation" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Founded Year:</label>
                                <input type="number" min="0" class="form-control" data-error="year" 
                                       oninput="validateInputBox(this)" name="year"
                                       value="${requestScope.publisher.foundedYear}" readonly disabled>
                                <span id="year" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>
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
    checkInput = ${requestScope.book != null ? true : false};

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

    function checkNullInputBox() {
        var selectForm = document.getElementsByClassName("form-control");
        for (var i = 0; i < selectForm.length; i++) {
            validateInputBox(selectForm[i]);
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
        if (checkInput) {
            document.getElementById("form-create").submit();
        }
    }
</script>
