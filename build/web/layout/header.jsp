<%-- 
    Document   : header
    Created on : Dec 2, 2023, 8:28:11 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
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
        <style>
            #snackbar {
                visibility: hidden;
                min-width: 250px;
                margin-left: -125px;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 2px;
                padding: 16px;
                position: fixed;
                z-index: 1;
                left: 50%;
                top: 30px; /* Changed from bottom: 30px; */
                font-size: 17px;
            }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {
                    top: 0;
                    opacity: 0;
                } /* Changed from bottom: 0; */
                to {
                    top: 30px;
                    opacity: 1;
                } /* Changed from bottom: 30px; */
            }

            @keyframes fadein {
                from {
                    top: 0;
                    opacity: 0;
                } /* Changed from bottom: 0; */
                to {
                    top: 30px;
                    opacity: 1;
                } /* Changed from bottom: 30px; */
            }

            @-webkit-keyframes fadeout {
                from {
                    top: 30px;
                    opacity: 1;
                } /* Changed from bottom: 30px; */
                to {
                    top: 0;
                    opacity: 0;
                } /* Changed from bottom: 0; */
            }

            @keyframes fadeout {
                from {
                    top: 30px;
                    opacity: 1;
                } /* Changed from bottom: 30px; */
                to {
                    top: 0;
                    opacity: 0;
                } /* Changed from bottom: 0; */
            }
        </style>
    </head>

    <body>
        <!-- display message here -->
        <div id="snackbar"></div>
        <c:if test="${msg != null}">
            <script>
                var x = document.getElementById("snackbar");
                x.textContent = '${msg}';
                x.className = "show";
                setTimeout(function () {
                    x.className = x.className.replace("show", "");
                }, 3000);
            </script>
        </c:if>

        <!-- Header of all content  -->
        <header class="d-flex flex-wrap justify-content-center py-3 border-bottom px-5 background-white">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                <div class="rounded-circle d-flex justify-content-center align-items-center home-button smooth-transform"
                     style="width: 40px; height: 40px">
                    <i class="fa fa-home"></i>
                </div>
            </a>

            <div class="d-flex align-items-center gap-3">
                <!-- If DO NOT login, show this      -->
                <c:if test="${sessionScope.account == null}">
                    <button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#loginModal">
                        <i class="fa-solid fa-lock primary-color me-1"></i>
                        Log in
                    </button>

                    <button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#registerModal">
                        <i class="fa-solid fa-user-plus primary-color me-1"></i>
                        Register
                    </button>
                </c:if>

                <!-- If login, show this -->
                <c:if test="${sessionScope.account != null}">
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
                           id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user me-2 primary-color"></i>
                            Hello: <strong>${sessionScope.account.fullName}</strong>
                        </a>
                        <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                            <li><a class="dropdown-item" href="logout">Sign out</a></li>
                        </ul>
                    </div>
                </c:if>
            </div>

            <!-- Modal Login  -->
            <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="loginModalLabel">Log in</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="login" method="post">
                                <h6>User email <span class="text-danger">*</span></h6>
                                <input type="text" class="form-control mb-3" placeholder="Enter user email"
                                       aria-label="Useremail" name="email"/>
                                <h6>Password <span class="text-danger">*</span></h6>
                                <input type="password" class="form-control mb-2" placeholder="Enter password"
                                       aria-label="Password" name="pwd"/>
                                <button type="submit" class="btn btn-primary w-100 mb-2">
                                    Log in
                                </button>
                            </form>
                            <div class="mb-3 d-flex justify-content-end">
                                <a class="text-decoration-none forget-pass-btn btn text-primary" data-bs-toggle="modal"
                                   data-bs-target="#forgetPasswordModal">
                                    Reset password?
                                </a>
                            </div>
                            <div class="d-flex justify-content-center align-items-center">
                                <p class="mb-0">Need an account?</p>
                                <a class="btn btn-outline-none text-decoration-underline" data-bs-toggle="modal"
                                   data-bs-target="#registerModal">
                                    SIGN UP
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Sign up  -->
            <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="registerModalLabel">Sign up</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" style="max-height: 450px; overflow: auto">
                            <form id="frm-register" action="register" method="post">
                                <h6>Full name:<span class="text-danger">*</span></h6>
                                <input type="text" name="fullName" required maxlength="255" id="input-fullName"
                                       class="form-control mb-3" placeholder="Nhập Họ và Tên" value="${account.fullName}"
                                       aria-label="Username">
                                <span id="error-fullName" style="color: red; display: none;"></span>
                                <h6>Phone<span class="text-danger">*</span></h6>
                                <input type="text" name="phone" required oninput="validatePhone(this)"
                                       class="form-control mb-3" placeholder="Nhập Số điện thoại" value="${account.phone}"
                                       aria-label="Username">
                                <span id="error-phone" style="color: red; display: none;"></span>
                                <h6>EMAIL <span class="text-danger">*</span></h6>
                                <input type="email" name="email" required oninput="validateEmail(this)"
                                       class="form-control mb-3" placeholder="Nhập địa chỉ Email"
                                       aria-label="Username">
                                <span id="error-email" style="color: red; display: none;"></span>
                                <h6>Password <span class="text-danger">*</span></h6>
                                <span id="error-password" style="color: red; display: none;"></span>
                                <input type="password" name="password" required oninput="validatePassword(this)"
                                       class="form-control mb-2" placeholder="Nhập Mật khẩu"
                                       aria-label="Username">
                                <span id="error-password" style="color: red; display: none;"></span>
                                <h6>Address</h6>
                                <input type="text" name="address" value="${account.address}"
                                       class="form-control mb-3" placeholder="Nhập địa chỉ"
                                       aria-label="Username">
                                <h6>Date of birth<span class="text-danger">*</span></h6>
                                <input type="date" name="dob" max="${now}" required value="${account.dob}"
                                       class="form-control mb-3" placeholder="Nhập ngày sinh" id="input-dob"
                                       aria-label="Username">
                                <button class="btn btn-primary w-100 mb-2" onclick="regiterAccount()">
                                    Register
                                </button>
                            </form>
                            <div class="d-flex justify-content-center align-items-center">
                                <p class="mb-0">Already have an account</p>
                                <a class="btn btn-outline-none text-decoration-underline" data-bs-toggle="modal"
                                   data-bs-target="#loginModal">
                                    Login
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Reset Password  -->
            <div class="modal fade" id="forgetPasswordModal" tabindex="-1" aria-labelledby="forgetPasswordModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body d-flex flex-column align-items-center gap-3 p-5">
                            <img src="/assets/reset-pass-img.png" alt="reset-pass-img"
                                 style="max-width: 80px; object-fit: cover" />
                            <h2>Reset Password</h2>
                            <input type="text" class="form-control mb-3" placeholder="Enter user email"
                                   aria-label="Useremail" />
                            <button type="button" class="btn btn-primary w-100 mb-2">
                                RESET PASSWORD
                            </button>
                            <div class="d-flex justify-content-center align-items-center">
                                <p class="mb-0">Already have an account</p>
                                <a class="btn btn-outline-none text-decoration-underline" data-bs-toggle="modal"
                                   data-bs-target="#loginModal">
                                    SIGN IN
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Script using  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
        <script>
                $('.slider-nav').slick({
                    slidesToShow: 4,
                    slidesToScroll: 1,
                    arrows: true,
                    dots: true,
                    autoplay: true,
                    autoplaySpeed: 4000,
                });

                var checkPhone = false;
                var checkPassword = false;
                var checkEmail = false;

                function shopRegister() {
                    window.location.href = "shopRegister";
                }

                function validatePhone(input) {
                    var value = input.value;
                    var regex = /^0[0-9]{9}$/;

                    if (!regex.test(value)) {
                        document.getElementById('error-phone').textContent = "Số điện thoại không hợp lệ";
                        document.getElementById('error-phone').style.display = "block";
                        checkPhone = false;
                    } else {
                        document.getElementById('error-phone').textContent = "";
                        document.getElementById('error-phone').style.display = "none";
                        checkPhone = true;
                    }
                }

                function validatePassword(input) {
                    var value = input.value;
                    var regex = /^(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$/;

                    if (!regex.test(value)) {
                        document.getElementById('error-password').textContent = "Mật khẩu phải chứa ít nhất 1 ký tự đặc biệt và có độ dài tối thiểu là 8 ký tự";
                        document.getElementById('error-password').style.display = "block";
                        checkPassword = false;
                    } else {
                        document.getElementById('error-password').textContent = "";
                        document.getElementById('error-password').style.display = "none";
                        checkPassword = true;
                    }
                }

                function validateEmail(input) {
                    var value = input.value;
                    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                    if (!emailRegex.test(value)) {
                        document.getElementById('error-email').textContent = "Vui lòng nhập một địa chỉ email hợp lệ";
                        document.getElementById('error-email').style.display = "block";
                        checkEmail = false;
                    } else {
                        document.getElementById('error-email').textContent = "";
                        document.getElementById('error-email').style.display = "none";
                        checkEmail = true;
                    }
                }

                function regiterAccount() {
                    var fullName = document.getElementById('input-fullName').value;
                    var dob = document.getElementById('input-dob').value;
                    if (fullName !== '' && dob !== '' && checkPhone && checkPassword && checkEmail) {
                        document.getElementById('frm-register').submit();
                    } else {
                        alert("Vui lòng kiểm tra lại và nhập đầy đủ thông tin đăng nhập!");
                    }
                }
        </script>
    </body>

</html>
