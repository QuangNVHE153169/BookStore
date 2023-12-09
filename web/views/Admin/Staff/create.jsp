<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${requestScope.user != null ? "UPDATE STAFF" : "CREATE STAFF"}</title>
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
                        ${requestScope.user != null ? "UPDATE STAFF" : "CREATE STAFF"}
                    </h1>
                    <div>
                        <c:if test="${user != null}">
                            <a type="button" class="btn btn-secondary btn-lg" href="admin-staff?userId=${user.userID}">
                            Cancel</a>
                        </c:if>                       
                        <a type="button" class="btn btn-primary btn-lg" onclick="submitForm(this)">
                            Save</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="text-center">                         
                            <c:if test="${user.avatar != null}">
                                <img src="${user.avatar}" class="rounded-circle img-fluid" style="width: 150px;">
                            </c:if >
                            <c:if test="${user.avatar == null}">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" class="rounded-circle img-fluid" style="width: 150px;">
                            </c:if>   
                                <h3>${user.getFullName()}</h1>
                                <h4>${user.role.name}</h2>                                                 
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <form action="manage-staff" method="post" id="submitForm">
                                    <input type="hidden" name="action" value="${requestScope.user != null ? "U" : "C"}" >
                                    <c:if test="${requestScope.user != null}">
                                        <input type="hidden" name="userId" value="${user.userID}" >
                                    </c:if>
                                    <div class="row align-items-center mb-3">
                                        <div class="col-sm-3">
                                            <p class="col-form-label ">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input value="${user.getEmail()}" class="form-control" name="email"
                                                   ${requestScope.user != null ? "disabled" : ""}>
                                        </div>
                                    </div>
                                    <div class="row align-items-center mb-3">
                                        <div class="col-sm-3">
                                            <p class="col-form-label">Full Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input value="${user.getFullName()}" name="fullName" type="text" class="form-control"
                                                   oninput="validateName(this)">                                           
                                        </div>
                                        <div class="offset-sm-3">
                                            <span id="error-name" class="mt-2" style="color: red; display: none;"></span>                                         
                                        </div>
                                    </div>
                                    <div class="row align-items-center mb-3">
                                        <div class="col-sm-3">
                                            <p class="col-form-label">Gender</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="d-flex gap-5 align-items-center">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           id="maleRadios" value="1"
                                                           ${user.getGender() == 1 || user == null ? "checked" : "" }>
                                                    <label class="form-check-label" for="maleRadios">
                                                        Male
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" 
                                                           id="femaleRadios" value="0" name="gender"
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
                                            <input value="${user.dob}" type="date" name="dob" value="1"
                                                   class="form-control" onchange="validateDob(this)" >                                       
                                        </div>
                                        <div class="offset-sm-3">
                                           <span id="error-dob" class="mt-2" style="color: red; display: none;"></span>                                        
                                        </div>
                                    </div>

                                    <div class="row align-items-center">
                                        <div class="col-sm-3">
                                            <p class="col-form-label">Phone</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input value="${user.phone}" type="text" class="form-control" name="phone" oninput="validatePhone(this)">                                         
                                        </div>
                                        <div class="offset-sm-3">
                                            <span id="error-phone" class="mt-2" style="color: red; display: none;"></span> 
                                            <c:if test="${user == null}">
                                            <span style="color: red" class="mt-2">
                                                <strong>*Note: Password will be sent through inputted email, with default password as phone number</strong>
                                            <span>
                                        </c:if>
                                        </div>                                         
                                    </div>                                   
                                </form>
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
    <script>
        var checkName = ${user != null};
        var checkPhone = ${user != null};
        var checkDob = ${user != null};
        function validatePhone(input) {
            var value = input.value;
            var regex = /^0[0-9]{9}$/;

            if (!regex.test(value)) {
                document.getElementById('error-phone').textContent = "Invalid Phone Number";
                document.getElementById('error-phone').style.display = "block";
                checkPhone = false;
            } else {
                document.getElementById('error-phone').textContent = "";
                document.getElementById('error-phone').style.display = "none";
                checkPhone = true;
            }
        }

        function validateName(input) {
            var value = input.value;

            if (value == "") {
                document.getElementById('error-name').textContent = "Full Name is required";
                document.getElementById('error-name').style.display = "block";
                checkName = false;
            } else {
                document.getElementById('error-name').textContent = "";
                document.getElementById('error-name').style.display = "none";
                checkName = true;
            }
        }

        function validateDob(input) {
            var value = input.value;

            if (value == "") {
                document.getElementById('error-dob').textContent = "Date of Birth is required";
                document.getElementById('error-dob').style.display = "block";
                checkDob = false;
            } else {
                document.getElementById('error-dob').textContent = "";
                document.getElementById('error-dob').style.display = "none";
                checkDob = true;
            }
        }
        
        function submitForm() {
            if (checkName && checkDob && checkPhone) {
                this.disabled = true
                document.getElementById("submitForm").submit()
            }
        }
    </script>
</body>

