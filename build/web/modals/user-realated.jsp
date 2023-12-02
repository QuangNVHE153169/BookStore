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

<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="register" id="frm-register" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="registerModalLabel">Sign up</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="max-height: 450px; overflow: auto;">
                        <h6>Email <span class="text-danger">*</span></h6>
                        <input id="input-email" type="text" class="form-control mb-3"
                               required oninput="validateEmail(this)" placeholder="Enter email" name="email">
                        <span id="error-email" class="mb-2" style="color: red; display: none;"></span>
                        <h6>Password <span class="text-danger">*</span></h6>
                        <input id="input-password" type="password" class="form-control mb-2" 
                               required oninput="validatePassword(this)" placeholder="Enter password" name="password">
                        <span id="error-password" class="mb-2" style="color: red; display: none;"></span>
                        <h6>Full name <span class="text-danger">*</span></h6>
                        <input id="input-fullname" type="text" class="form-control mb-3" 
                               required placeholder="Enter full name" name="fullName">
<!--                        <h6>Gender <span class="text-danger">*</span></h6>
                        <div class="d-flex gap-5 mb-3 align-items-center">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1"
                                       value="true" checked>
                                <label class="form-check-label" for="exampleRadios1">
                                    Male
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2"
                                       value="false">
                                <label class="form-check-label" for="exampleRadios2">
                                    Female
                                </label>
                            </div>
                        </div>-->
                        <h6>Mobile <span class="text-danger">*</span></h6>
                        <input id="input-phone" type="number" class="form-control mb-3" 
                               required oninput="validatePhone(this)" placeholder="Enter mobile" name="phone">
                        <span id="error-phone" class="mb-2" style="color: red; display: none;"></span>
                        <h6>Address</h6>
                        <input type="text" class="form-control mb-3" 
                               placeholder="Enter your address" name="address">
                        <h6>Date Of Birth <span class="text-danger">*</span></h6>
                        <input id="input-dob" type="date" class="form-control mb-3" 
                               name="dob">
                        <button type="button" onclick="regiterAccount()" class="btn btn-primary w-100 mb-2">Sign In</button>
                        <div class="d-flex justify-content-center align-items-center">
                            <p class="mb-0">Already have an account?</p>
                            <a class="btn btn-outline-none text-decoration-underline" data-bs-toggle="modal"
                               data-bs-target="#loginModal">
                                LOG IN
                            </a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
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

<script>
    function validatePhone(input) {
        var value = input.value;
        var regex = /^0[0-9]{9}$/;

        if (!regex.test(value)) {
            document.getElementById('error-phone').textContent = "S? ?i?n tho?i không h?p l?";
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
            document.getElementById('error-password').textContent = "M?t kh?u ph?i ch?a ít nh?t 1 ký t? ??c bi?t và có ?? dài t?i thi?u là 8 ký t?";
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
            document.getElementById('error-email').textContent = "Vui lòng nh?p m?t ??a ch? email h?p l?";
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
            alert("Vui lòng ki?m tra l?i và nh?p ??y ?? thông tin ??ng nh?p!");
        }
    }
</script>