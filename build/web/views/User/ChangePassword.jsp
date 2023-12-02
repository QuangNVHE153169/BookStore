<%-- 
    Document   : ChangePassword
    Created on : Dec 2, 2023, 8:27:12 PM
    Author     : dell
--%>

<%@include file="../../layout/header.jsp" %>
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
                    <a class="href-unstyled" href="user-profile"><span class="fa fa-user me-2"></span>
                        Information</a>
                </li>
                <li class="nav-link">
                    <a class="href-unstyled primary-color" href="change-password"><span class="fa-solid fa-unlock me-2"></span>
                        Password</a>
                </li>
            </ul>
        </div>
        <div class="w-100 py-3 px-4 background-gray">
            <form action="change-password" id="frm-changePassword" method="post">
                <div class="container bg-white rounded-3 border border-secondary-subtle p-3">
                    <h1>
                        Change password
                    </h1>
                    <h6 class="mt-3">Old Password <span class="text-danger">*</span></h6>
                    <input type="password" class="form-control mb-2"
                           required oninput="validatePassword(this)" placeholder="Enter old password" name="oldPwd" data-error="error-password">
                    <span id="error-password" class="mb-2" style="color: red; display: none;"></span>
                    <h6 class="mt-3">New Password <span class="text-danger">*</span></h6>
                    <input type="password" class="form-control mb-2"
                           required oninput="validatePassword(this)" id ="newPwd" placeholder="Enter new password" name="newPwd" data-error="error-new-password">
                    <span id="error-new-password" class="mb-2" style="color: red; display: none;"></span>
                    <h6 class="mt-3">Confirm New Password <span class="text-danger">*</span></h6>
                    <input type="password" class="form-control mb-2"
                           required oninput="confirmPassword(this)" placeholder="Enter re-password">
                    <span id="error-confirm-password" class="mb-2" style="color: red; display: none;"></span>
                </div>
                <div class="d-flex justify-content-end mt-3">
                    <button class="btn btn-primary btn-lg" onclick="changePassword()">
                        Save password
                    </button>
                </div>
            </form>
        </div>
    </div>
    <!--<div data-include="footer"></div>
     Script using  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>-->
</body>

<script>
    function validatePassword(input) {
        var value = input.value;
        var regex = /^(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$/;

        if (!regex.test(value)) {
            document.getElementById(input.getAttribute("data-error")).textContent = "Password must have at least one special character and its length is at least 8 characters";
            document.getElementById(input.getAttribute("data-error")).style.display = "block";
            checkPassword = false;
        } else {
            document.getElementById(input.getAttribute("data-error")).textContent = "";
            document.getElementById(input.getAttribute("data-error")).style.display = "none";
            checkPassword = true;
        }
    }

    function confirmPassword(input) {
        var value = input.value

        if (value !== document.getElementById('newPwd').value) {
            checkConfirmPassword = false;
            document.getElementById('error-confirm-password').textContent = "Confirm password needs to be same with new password";
            document.getElementById('error-confirm-password').style.display = "block";
        } else {
            checkConfirmPassword = true;
            document.getElementById('error-confirm-password').textContent = "";
            document.getElementById('error-confirm-password').style.display = "none";
        }
    }

    function changePassword() {
        if (checkConfirmPassword && checkPassword) {
            document.getElementById("frm-changePassword").submit();
        }
    }
</script>
