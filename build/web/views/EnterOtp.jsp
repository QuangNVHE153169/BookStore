<%@ include file="../layout/header.jsp" %>
<body>
    <div class="form-gap"></div>
    <div class="container">
        <div class="row w-100 d-flex justify-content-center mt-3">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center w-100">
                            <h3>
                                <i class="fa fa-lock fa-4x"></i>
                            </h3>
                            <h2 class="text-center">Enter OTP</h2>
                            <c:if test="${message != null}">
                                <p class='text-danger ml-1'>${message}</p>
                            </c:if>
                            <div class="panel-body">
                                <form id="register-form" action="ValidateOtp" role="form" autocomplete="off"
                                      class="form" method="post">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i
                                                    class="glyphicon glyphicon-envelope color-blue"></i></span>
                                            <input id="opt" name="otp" placeholder="Enter OTP"
                                                   class="form-control" type="text" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group mt-2">
                                        <input name="recover-submit"
                                               class="btn btn-lg btn-primary btn-block"
                                               value="Reset Password" type="submit">
                                    </div>
                                    <input type="hidden" class="hide" name="token" id="token" value="">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>