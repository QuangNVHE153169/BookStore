<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book-shop</title>
    <link rel="stylesheet" href="../css/styles.css" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
</head>

<body>
    <!-- Main content  -->
    <!-- <div data-include="header"></div> -->
    <%@include file="../layout/book-header.jsp" %>

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
                    <a class="href-unstyled" href="#"><span class="fa fa-user me-2"></span>
                        Information</a>
                </li>
                <li class="nav-link">
                    <a class="href-unstyled primary-color" href="#"><span class="fa-solid fa-unlock me-2"></span>
                        Password</a>
                </li>
            </ul>
        </div>
        <div class="w-100 py-3 px-4 background-gray">
            <div class="container bg-white rounded-3 border border-secondary-subtle p-3">
                <h1>
                    Change password
                </h1>
                <h6 class="mt-3">Old Password <span class="text-danger">*</span></h6>
                <input type="password" class="form-control mb-2" placeholder="Enter old password">
                <h6 class="mt-3">New Password <span class="text-danger">*</span></h6>
                <input type="password" class="form-control mb-2" placeholder="Enter new password">
                <h6 class="mt-3">Confirm New Password <span class="text-danger">*</span></h6>
                <input type="password" class="form-control mb-2" placeholder="Enter re-password">
            </div>
            <div class="d-flex justify-content-end mt-3">
                <button class="btn btn-primary btn-lg">
                    Save password
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