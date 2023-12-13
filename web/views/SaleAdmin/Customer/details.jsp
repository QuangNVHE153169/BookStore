<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Customer Management</title>
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
    <%@include file="../../../layout/LeftAdminSaleBar.jsp" %>
    <section style="margin-left: 280px; height: calc(92vh); overflow-y: auto;">
        <div class="card my-2 mx-2">
            <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="fs-2 fw-bold">
                        Customer Details
                    </h1>
                    <div>
                        <a type="button" class="btn btn-secondary btn-lg" href="admin-customer">
                            Close</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="col">
                    <c:if test="${requestScope.customer != null}">
                        <div class="row">
                            <div class="col-6">
                                <strong> <label for="category-film" class="col-form-label">CustomerID: </label> ${requestScope.customer.userID}</strong>
                                <input type="hidden" name="userId"
                                       value="${requestScope.customer.userID}">
                            </div>
                        </div>
                    </c:if>
                    <hr>
                    <div class="row">
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">Full Name:</label>
                            <input type="text" class="form-control req"
                                   value="${requestScope.customer.fullName}" readonly disabled>
                        </div>
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">Email:</label>
                            <input type="text" class="form-control req" 
                                   value="${requestScope.customer.email}" readonly disabled>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">Phone: </label>
                            <input type="text" class="form-control req" 
                                   value="${requestScope.customer.phone}" readonly disabled>
                            <span id="phone" class="mt-2" style="color: red; display: none;"></span>
                        </div>
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">DOB: </label>
                            <input type="date" class="form-control req" 
                                   value="${requestScope.customer.dob}" readonly disabled>
                            <span id="dob" class="mt-2" style="color: red; display: none;"></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">Gender: </label>
                            <input type="radio" 
                                   value="1" checked readonly disabled>Male
                            <input type="radio" 
                                   value="0" 
                                   <c:if test="${requestScope.customer.gender == 0}">checked</c:if> readonly disabled/>Female
                                   <span id="gender" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label for="category-film" class="col-form-label">Address: </label>
                                <input type="text" class="form-control req"
                                       value="${requestScope.customer.fullName}" readonly disabled>
                            <span id="address" class="mt-2" style="color: red; display: none;"></span>
                        </div>

                        <div class="col-12">
                            <label for="category-film" class="col-form-label">Desciption: </label>
                            <textarea class="form-control" readonly disabled>${requestScope.customer.description}</textarea>
                            <span id="description" class="mt-2" style="color: red; display: none;"></span>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</body>

<!-- Script using  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
