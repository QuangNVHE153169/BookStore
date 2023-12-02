<%-- 
    Document   : UserProfile
    Created on : Dec 2, 2023, 8:27:12 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Book-shop</title>
        <link rel="stylesheet" href="styles.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    </head>

    <body class="overflow-x-hidden background-gray">
        <!-- Main content  -->
        <!-- <div data-include="header"></div> -->
        <header class="d-flex flex-wrap justify-content-center py-3 border-bottom px-5 background-white">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                <div class="rounded-circle d-flex justify-content-center align-items-center home-button smooth-transform"
                     style="width: 40px; height: 40px;">
                    <i class="fa fa-home primary-color"></i>
                </div>
            </a>

            <div class="d-flex align-items-center gap-3">
                <!-- If DO NOT login, show this      -->
                <button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#loginModal">
                    <i class="fa-solid fa-lock primary-color me-1"></i>
                    Log in</button>

                <button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#registerModal">
                    <i class="fa-solid fa-user-plus primary-color me-1"></i>
                    Register</button>
                <!-- If login, show this -->
                <div class="dropdown">
                    <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
                       id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-user me-2 primary-color"></i>
                        Hello: <strong>Elizabeth</strong>
                    </a>
                    <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                        <li><a class="dropdown-item" href="#">Sign out</a></li>
                    </ul>
                </div>
            </div>
            <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="loginModalLabel">Log in</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h6>User email <span class="text-danger">*</span></h6>
                            <input type="text" class="form-control mb-3" placeholder="Enter user email"
                                   aria-label="Useremail">
                            <h6>Password <span class="text-danger">*</span></h6>
                            <input type="password" class="form-control mb-2" placeholder="Enter password"
                                   aria-label="Password">
                            <button type="button" class="btn btn-primary w-100 mb-2">Log in</button>
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

            <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="registerModalLabel">Sign up</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" style="max-height: 450px; overflow: auto;">
                            <h6>Email <span class="text-danger">*</span></h6>
                            <input type="text" class="form-control mb-3" placeholder="Enter email">
                            <h6>Password <span class="text-danger">*</span></h6>
                            <input type="password" class="form-control mb-2" placeholder="Enter password">
                            <h6>Full name <span class="text-danger">*</span></h6>
                            <input type="text" class="form-control mb-3" placeholder="Enter full name">
                            <h6>Gender <span class="text-danger">*</span></h6>
                            <div class="d-flex gap-5 mb-3 align-items-center">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1"
                                           value="option1" checked>
                                    <label class="form-check-label" for="exampleRadios1">
                                        Male
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2"
                                           value="option2">
                                    <label class="form-check-label" for="exampleRadios2">
                                        Female
                                    </label>
                                </div>
                            </div>
                            <h6>Email <span class="text-danger">*</span></h6>
                            <input type="text" class="form-control mb-3" placeholder="Enter user email">
                            <h6>Mobile <span class="text-danger">*</span></h6>
                            <input type="number" class="form-control mb-3" placeholder="Enter mobile">
                            <h6>Address <span class="text-danger">*</span></h6>
                            <input type="text" class="form-control mb-3" placeholder="Enter your address">
                            <button type="button" class="btn btn-primary w-100 mb-2">Log in</button>
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


            <div class="modal fade" id="forgetPasswordModal" tabindex="-1" aria-labelledby="forgetPasswordModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body d-flex flex-column align-items-center gap-3 p-5">
                            <img src="/assets/reset-pass-img.png" alt="reset-pass-img"
                                 style="max-width: 80px; object-fit: cover;">
                            <h2>Reset Password</h2>
                            <input type="text" class="form-control mb-3" placeholder="Enter user email"
                                   aria-label="Useremail">
                            <button type="button" class="btn btn-primary w-100 mb-2">RESET PASSWORD</button>
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

        <div class="d-flex background-white">
            <!-- <div data-include="left-side-profile-bar"></div> -->
            <!-- this is left side profile bar, put in separate pile in jsp -->
            <div class="p-3 d-flex flex-column gap-2"
                 style="width: 300px; border-right: 1px solid gray; height: calc(100vh - 74px);">
                <h2>
                    Profile
                </h2>
                <ul class="nav d-flex flex-column gap-1">
                    <li class="nav-link">
                        <!-- current link will have primary color in <a> -->
                        <a class="href-unstyled primary-color" href="#"><span class="fa fa-user me-2"></span>
                            Information</a>
                    </li>
                    <li class="nav-link">
                        <a class="href-unstyled" href="#"><span class="fa-solid fa-unlock me-2"></span> Password</a>
                    </li>
                </ul>
            </div>
            <div class="w-100 py-3 px-4 background-gray">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
                                     alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                                <h5 class="my-3">Duy hai</h5>
                                <p class="text-muted mb-1">Duyhai@gmail.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input value="duy@gmail.com" type="text" class="form-control"
                                               placeholder="Enter email" readonly>
                                    </div>
                                </div>
                                <hr>
                                <div class="row align-items-center">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input value="Hai duy" type="text" class="form-control"
                                               placeholder="Enter full name">
                                    </div>
                                </div>
                                <hr>
                                <div class="row align-items-center">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Gender</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="d-flex gap-5 align-items-center">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="exampleRadios"
                                                       id="exampleRadios1" value="option1" checked>
                                                <label class="form-check-label" for="exampleRadios1">
                                                    Male
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="exampleRadios"
                                                       id="exampleRadios2" value="option2">
                                                <label class="form-check-label" for="exampleRadios2">
                                                    Female
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Mobile</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" placeholder="Enter mobile">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" placeholder="Enter your address">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end">
                    <button class="btn btn-primary btn-lg">
                        Save profile
                    </button>
                </div>
            </div>
        </div>
        <div data-include="footer"></div>
        <!-- Script using  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>
