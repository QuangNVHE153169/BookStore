<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sale Admin Management</title>
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
                        ${(requestScope.staff != null and !emailExist) ? "UPDATE SALE ADMIN" : "CREATE SALE ADMIN"}
                    </h1>
                    <div>
                        <a type="button" class="btn btn-secondary btn-lg" href="admin-staff?userId=${requestScope.staff.userID}">
                            Cancel</a>
                        <a type="button" class="btn btn-primary btn-lg" onclick="submitForm()">
                            Save</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <form method="POST" action="admin-manage-staff" id="form-create">
                    <div class="col">
                        <c:if test="${requestScope.staff != null}">
                            <div class="row">
                                <div class="col-6">
                                    <label for="category-film" class="col-form-label">Sale Admin ID: </label> ${requestScope.staff.userID}
                                    <input type="hidden" name="userId"
                                           value="${requestScope.staff.userID}">
                                </div>
                            </div>
                        </c:if>
                        <div class="row">
                            <input type="hidden" name="action"
                                   value="${(requestScope.staff != null and !emailExist) ? "U" : "C"}">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Full Name:</label>
                                <input type="text" class="form-control req" data-error="fullName" 
                                       oninput="validateInputBox(this)" name="name"
                                       value="${requestScope.staff.fullName}" required>
                                <span id="fullName" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Email:</label>
                                <input type="text" class="form-control req" data-error="email" 
                                       oninput="validateInputBox(this)" name="email"
                                       value="${requestScope.staff.email}" required
                                       <c:if test="${requestScope.staff != null and !emailExist}">
                                           disabled readonly
                                       </c:if>
                                       >
                                <span id="email" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Phone: </label>
                                <input type="text" class="form-control req" data-error="phone" 
                                       oninput="validateInputBox(this)" name="phone"
                                       value="${requestScope.staff.phone}" required>
                                <span id="phone" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">DOB: </label>
                                <input type="date" class="form-control req" data-error="dob" 
                                       oninput="validateInputBox(this)" name="dob"
                                       value="${requestScope.staff.dob}" required>
                                <span id="dob" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="category-film" class="col-form-label">Gender: </label>
                                <input type="radio" data-error="gender" 
                                       oninput="validateInputBox(this)" name="gender"
                                       value="1" checked>Male
                                <input type="radio" data-error="gender" 
                                       oninput="validateInputBox(this)" name="gender"
                                       value="0" 
                                       <c:if test="${requestScope.staff.gender == 0}">checked</c:if>/>Female
                                       <span id="gender" class="mt-2" style="color: red; display: none;"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label for="category-film" class="col-form-label">Address: </label>
                                    <input type="text" class="form-control req" data-error="address" 
                                           oninput="validateInputBox(this)" name="address"
                                           value="${requestScope.staff.fullName}" required>
                                <span id="address" class="mt-2" style="color: red; display: none;"></span>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label for="category-film" class="col-form-label">Desciption: </label>
                                    <textarea class="form-control" data-error="description" 
                                              oninput="validateInputBox(this)" name="description">${requestScope.staff.description}</textarea>
                                    <span id="description" class="mt-2" style="color: red; display: none;"></span>
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
                                var val = input.value;
                                if (val === "") {
                                    document.getElementById(input.getAttribute("data-error")).textContent = "Input required";
                                    document.getElementById(input.getAttribute("data-error")).style.display = "block";
                                } else {
                                    document.getElementById(input.getAttribute("data-error")).textContent = "";
                                    document.getElementById(input.getAttribute("data-error")).style.display = "none";
                                    checkInput = true;
                                }
                            }

                            function checkNullInputBox() {
                                var selectForm = document.getElementsByClassName("req");
                                for (var i = 0; i < selectForm.length; i++) {
                                    validateInputBox(selectForm[i]);
                                }
                                for (var i = 0; i < selectForm.length; i++) {
                                    if (selectForm[i].value === "") {
                                        checkInput = false;
                                        break
                                    }
                                }
                            }

                            function submitForm() {
                                checkNullInputBox();
                                if (checkInput) {
                                    simulateLoading();
                                    document.getElementById("form-create").submit();
                                }
                            }
</script>
