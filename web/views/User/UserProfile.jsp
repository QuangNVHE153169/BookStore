<head>
    <title>User Profile</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
</head>
<%@ include file="../../layout/header.jsp" %>
<body>
    <div class="d-flex">
        <!-- <div data-include="left-side-profile-bar"></div> -->
        <!-- this is left side profile bar, put in separate pile in jsp -->
        <div class="p-3 d-flex flex-column gap-2"
             style="width: 300px; border-right: 1px solid gray; height: calc(100vh - 74px);">
            <h2>
                Profile
            </h2>
            <ul class="nav d-flex flex-column gap-1">
                <li class="nav-link">
                    <a class="href-unstyled ${pageContext.request.servletPath.equals("/views/User/UserProfile.jsp") ? "primary-color" : ""}" href="user-profile"><span class="fa fa-user me-2"></span>
                        Information</a>
                </li>

                <li class="nav-link">
                    <a class="href-unstyled ${pageContext.request.servletPath.equals("/views/User/ChangePassword.jsp") ? "primary-color" : ""}" href="change-password"><span class="fa-solid fa-unlock me-2"></span>
                        Password</a>
                </li>
            </ul>
        </div>
        <div class="w-100 py-3 px-4 background-gray">
            <form action="user-profile" method="post" id="frm-update">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">                         
                                <c:if test="${sessionScope.account.getAvatar() != null}">
                                    <img src="${sessionScope.account.getAvatar()}" class="rounded-circle img-fluid" style="width: 150px;">
                                </c:if >
                                <c:if test="${sessionScope.account.getAvatar() == null}">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" class="rounded-circle img-fluid" style="width: 150px;">
                                </c:if>                          
                                <h5 class="my-3">${sessionScope.account.getFullName()}</h5>
                                <p class="text-muted mb-1">${sessionScope.account.getEmail()}</p>
                            </div>
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
                                        <input value="${sessionScope.account.getEmail()}" type="text" class="form-control"
                                               placeholder="Enter email" readonly disabled>
                                    </div>
                                </div>
                                <div class="row align-items-center mb-3">
                                    <div class="col-sm-3">
                                        <p class="col-form-label">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input value="${sessionScope.account.getFullName()}" name="fullname" type="text" class="form-control"
                                               required
                                               oninput="validateName(this)"
                                               placeholder="Enter full name">

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
                                                       ${sessionScope.account.getGender() == 1 ? "checked" : "" }>
                                                <label class="form-check-label" for="maleRadios">
                                                    Male
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="gender"
                                                       id="femaleRadios" value="0"
                                                       ${sessionScope.account.getGender() == 0 ? "checked" : "" }>
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
                                        <input type="date" name="dob" max="${now}" required value="${sessionScope.account.dob}"
                                               class="form-control" required>
                                    </div>
                                    <div class="offset-sm-3">
                                        <span id="error-dob" class="mt-2" style="color: red; display: none;"></span>
                                    </div>
                                </div>

                                <div class="row align-items-center mb-3">
                                    <div class="col-sm-3">
                                        <p class="col-form-label">Mobile</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input required oninput="validatePhone(this)" name="phone" value="${sessionScope.account.getPhone()}" type="text" class="form-control" placeholder="Enter mobile">                                   
                                    </div>
                                    <div class="offset-sm-3">
                                        <span id="error-phone" class="mt-2" style="color: red; display: none;"></span>
                                    </div>
                                </div>
                                <div class="row align-items-center">
                                    <div class="col-sm-3">
                                        <p class="col-form-label">Address</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" name="address" value="${sessionScope.account.getAddress()}" class="form-control" placeholder="Enter your address">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-end">
                    <button type="button" class="btn btn-primary btn-lg" onclick="updateProfile()">
                        Save profile
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
<!-- Script using  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
<script>
                        var checkName = '${sessionScope.account.getFullName() != ""}';
                        var checkPhone = '${sessionScope.account.getPhone() != ""}';
                        var checkDob = '${sessionScope.account.getDob() != ""}';
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

//    function validateEmail(input) {
//        var value = input.value;
//        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;       
//
//        if (!emailRegex.test(value)) {
//            document.getElementById('error-email').textContent = "Invalid Email";
//            document.getElementById('error-email').style.display = "block";
//            checkEmail = false;
//        } else {
//            document.getElementById('error-email').textContent = "";
//            document.getElementById('error-email').style.display = "none";
//            checkEmail = true;
//        }
//    }

                        function updateProfile() {
                            if (checkPhone && checkName && checkDob) {
                                document.getElementById("frm-update").submit();
                            }
                        }
</script>