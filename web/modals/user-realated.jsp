<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="login" method="post"> 
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Log in</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h6>Email<span class="text-danger">*</span></h6>
                    <input type="text" class="form-control mb-3" placeholder="Enter user email"
                           aria-label="User email" name="email">
                    <h6>Password <span class="text-danger">*</span></h6>
                    <input type="password" class="form-control mb-2" placeholder="Enter password"
                           aria-label="Password" name="pwd">
                    <button type="submit" class="btn btn-primary w-100 mb-2">Log in</button>
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
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <form action="register" method="post">
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
        </form>
    </div>
</div>

<div class="modal fade" id="forgetPasswordModal" tabindex="-1" aria-labelledby="forgetPasswordModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <form action="forgotPassword" method="post">
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
        </form>         
    </div>
</div>