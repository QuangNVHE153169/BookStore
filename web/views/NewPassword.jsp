<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Reset Password</title>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dee2e6;
                border: #dee2e6
            }
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body bg-info'>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <div>
            <!-- Container containing all contents -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                        <!-- White Container -->
                        <div class="container bg-white rounded mt-2 mb-2 px-0">
                            <!-- Main Heading -->
                            <div class="row justify-content-center align-items-center pt-3">
                                <h1>
                                    <strong>Reset Password</strong>
                                </h1>
                            </div>
                            <div class="pt-3 pb-3">
                                <form class="form-horizontal" action="newPassword" method="POST" id="frm-changePass">
                                    <!-- User Name Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <h6 class="mt-3">Enter new password<span class="text-danger">*</span></h6>
                                            <input id="input-newPwd" type="password" class="form-control mb-2" placeholder="Enter password" name="newPwd"
                                                   aria-label="Username" required oninput="validatePwd(this)"/>
                                            <h6 class="mt-3">Re-enter new password<span class="text-danger">*</span></h6>
                                            <span style="color: red;display: none" id="error-newPwd"></span>
                                            <input id="input-cfPwd" type="password" class="form-control mb-2" placeholder="Re-enter password"
                                                   aria-label="Username" required oninput="validateCfPwd(this)"/>
                                            <span style="color: red;display: none" id="error-cfPwd"></span>
                                        </div>
                                    </div>

                                    <!-- Log in Button -->
                                    <div class="form-group row justify-content-center">
                                        <div class="col-3 px-3 mt-3">
                                            <button type="button" onclick="changePass()" style="border: none;border-radius: 5px;background-color: #6edff6;font-size: 20px">Reset</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Alternative Login -->
                            <div class="mx-0 px-0 bg-light">
                                <!-- Horizontal Line -->
                                <div class="px-4 pt-5">
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
        <script>
                                                var checkNewPwd = false;
                                                var checkCfPass = false;

                                                function changePass() {
                                                    var newPwd = document.getElementById('input-newPwd').value;
                                                    var cfPwd = document.getElementById('input-cfPwd').value;
                                                    if (newPwd === '' && cfPwd === '') {
                                                        alert('Please enter correct information!');
                                                    } else {
                                                        if (checkNewPwd && checkCfPass) {
                                                            document.getElementById('frm-changePass').submit();
                                                        } else {
                                                            alert('Please enter correct information!');
                                                        }

                                                    }
                                                }

                                                function validatePwd(input) {
                                                    var value = input.value;
                                                    var regex = /^(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$/;

                                                    if (!regex.test(value)) {
                                                        document.getElementById('error-newPwd').textContent = "Password must have at least 8 characters and 1 special!";
                                                        document.getElementById('error-newPwd').style.display = "block";
                                                        checkNewPwd = false;
                                                    } else {
                                                        document.getElementById('error-newPwd').textContent = "";
                                                        document.getElementById('error-newPwd').style.display = "none";
                                                        checkNewPwd = true;
                                                    }
                                                }

                                                function validateCfPwd(input) {
                                                    var newPwd = document.getElementById('input-newPwd').value;
                                                    var value = input.value;
                                                    if (value !== newPwd) {
                                                        document.getElementById('error-cfPwd').textContent = "Confirm password must be same with new password!";
                                                        document.getElementById('error-cfPwd').style.display = "block";
                                                        checkCfPass = false;
                                                    } else {
                                                        document.getElementById('error-cfPwd').textContent = "";
                                                        document.getElementById('error-cfPwd').style.display = "none";
                                                        checkCfPass = true;
                                                    }
                                                }
        </script>
    </body>
</html>