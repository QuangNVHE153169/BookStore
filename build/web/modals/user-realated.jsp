<!--Modal Login-->
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

<!--Modal Register-->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLabel">Sign up</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="max-height: 450px; overflow: auto;">
                    <form id="frm-register" action="register" method="post">
                        <h6>Full name <span class="text-danger">*</span></h6>
                        <input type="text" name="fullName" required maxlength="255" id="input-fullName"
                               class="form-control mb-3" placeholder="Enter Full Name" value="${account.fullName}"
                               aria-label="Username">
                        <span id="error-fullName" style="color: red; display: none;"></span>
                        <h6>Phone <span class="text-danger">*</span></h6>
                        <input id="input-phone" type="text" name="phone" required oninput="validatePhone(this)"
                               class="form-control mb-3" placeholder="Enter Phone number" value="${account.phone}"
                               aria-label="Username">
                        <span id="error-phone" style="color: red; display: none;"></span>
                        <h6>EMAIL <span class="text-danger">*</span></h6>
                        <input id="input-email" type="email" name="email" required oninput="validateEmail(this)"
                               class="form-control mb-3" placeholder="Enter Email"
                               aria-label="Username">
                        <span id="error-email" style="color: red; display: none;"></span>
                        <h6>Password <span class="text-danger">*</span></h6>
                        <input id="input-pwd" type="password" name="password" required oninput="validatePassword(this)"
                               class="form-control mb-2" placeholder="Enter Password"
                               aria-label="Username">
                        <span id="error-password" style="color: red; display: none;"></span>
                        <div class="mb-2">
                            <h6>Gender <span class="text-danger">*</span></h6>
                            <input class="form-check-input me-1" type="radio" name="gender" value="1" checked>Male
                            <input class="form-check-input me-1 ms-2" type="radio" name="gender" value="0">Female
                        </div>                       
                        <h6>Address</h6>
                        <input type="text" name="address" value="${account.address}"
                               class="form-control mb-3" placeholder="Enter Address"
                               aria-label="Username">
                        <h6>Date of birth <span class="text-danger">*</span></h6>
                        <input type="date" name="dob" max="${now}" required value="${account.dob}"
                               class="form-control mb-3" placeholder="Enter Date of birth" id="input-dob"
                               aria-label="Username">
                        <button type="button" class="btn btn-primary w-100 mb-2" onclick="regiterAccount()">
                            Register
                        </button>
                    </form>
                    <div class="d-flex justify-content-center align-items-center">
                        <p class="mb-0">Already have an account?</p>
                        <a class="btn btn-outline-none text-decoration-underline" data-bs-toggle="modal"
                           data-bs-target="#loginModal">
                            SIGN IN
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--Modal Reset password-->
<div class="modal fade" id="forgetPasswordModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="forgotPassword" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex flex-column align-items-center gap-3 p-5">
                        <h2>Reset Password</h2>
                        <form action="forgotPassword" method="post">
                            <input type="email" class="form-control mb-3" placeholder="Enter user email"
                                   aria-label="Useremail" required name="email">
                            <button type="submit" class="btn btn-primary w-100 mb-2">RESET PASSWORD</button>
                        </form>
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
</div>

<script>
    var checkPhone = false;
    var checkPassword = false;
    var checkEmail = false;

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

    function validatePassword(input) {
        var value = input.value;
        var regex = /^(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$/;

        if (!regex.test(value)) {
            document.getElementById('error-password').textContent = "Password must have at least one special character and its length is at least 8 characters";
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
            document.getElementById('error-email').textContent = "Invalid Email";
            document.getElementById('error-email').style.display = "block";
            checkEmail = false;
        } else {
            document.getElementById('error-email').textContent = "";
            document.getElementById('error-email').style.display = "none";
            checkEmail = true;
        }
    }

    function regiterAccount() {
        //check format of phone again
        var phone = document.getElementById('input-phone').value;
        var phoneRegex = /^0[0-9]{9}$/;
        if (phoneRegex.test(phone)) {
            checkPhone = true;
        }

        //check format of email again
        var email = document.getElementById('input-email').value;
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (emailRegex.test(email)) {
            checkEmail = true;
        }

        //check format of password again
        var pwd = document.getElementById('input-pwd').value;
        var passRegex = /^(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$/;
        if (passRegex.test(pwd)) {
            checkPassword = true;
        }


        var fullName = document.getElementById('input-fullName').value;
        var dob = document.getElementById('input-dob').value;

        if (fullName !== '' && dob !== '' && checkPhone && checkPassword && checkEmail) {
            document.getElementById('frm-register').submit();
        } else {
            alert("Please be sure all required informations were inputed!");
        }
    }
</script>