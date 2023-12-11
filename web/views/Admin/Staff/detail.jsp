<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Staff Detail</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
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
                        STAFF DETAIL
                    </h1>
                    <a type="button" class="btn btn-primary btn-lg" href="manage-staff?userId=${user.userID}">
                            Update</a>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="text-center">                         
                            <c:if test="${user.avatar != null}">
                                <img src="${user.getAvatar()}" class="rounded-circle img-fluid" style="width: 150px;">
                            </c:if >
                            <c:if test="${user.getAvatar() == null}">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" class="rounded-circle img-fluid" style="width: 150px;">
                            </c:if>   
                                <h3>${user.getFullName()}</h1>
                                <h4>${user.role.name}</h2>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row align-items-center mb-3">
                                    <div class="col-sm-3">
                                        <p class="col-form-label ">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input value="${user.getEmail()}" class="form-control" disabled>
                                    </div>
                                </div>
                                <div class="row align-items-center mb-3">
                                    <div class="col-sm-3">
                                        <p class="col-form-label">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input value="${user.getFullName()}" type="text" class="form-control"
                                               disabled>

                                    </div>
                                </div>
                                <div class="row align-items-center mb-3">
                                    <div class="col-sm-3">
                                        <p class="col-form-label">Gender</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="d-flex gap-5 align-items-center">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" disabled
                                                       id="maleRadios" value="1"
                                                       ${user.getGender() == 1 ? "checked" : "" }>
                                                <label class="form-check-label" for="maleRadios">
                                                    Male
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" disabled
                                                       id="femaleRadios" value="0"
                                                       ${user.getGender() == 0 ? "checked" : "" }>
                                                <label class="form-check-label" for="femaleRadios">
                                                    Female
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row align-items-center mb-3">
                                    <div class="col-sm-3">
                                        <p class="col-form-label">Date of birth</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input value="${user.dob}" type="text"
                                               class="form-control" disabled>
                                    </div>
                                </div>

                                <div class="row align-items-center mb-3">
                                    <div class="col-sm-3">
                                        <p class="col-form-label">Phone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input value="${user.phone}" type="text" class="form-control" disabled>                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Script using  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
</body>

