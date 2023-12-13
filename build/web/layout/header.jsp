<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
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
            <% session.removeAttribute("msg"); %>
        </c:if>

        <!-- Header of all content  -->
        <header class="d-flex flex-wrap justify-content-center py-3 border-bottom px-5 background-white">

            <a href="${sessionScope.account.role.id != 1 ? "home" : "admin-books"}" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                <div class="rounded-circle d-flex justify-content-center align-items-center home-button smooth-transform"
                     style="width: 40px; height: 40px">
                    <i class="fa fa-home"></i>
                </div>
            </a>

            <div class="d-flex align-items-center gap-3">
                <!-- If DO NOT login, show this -->
                <c:if test="${sessionScope.account == null}">
                    <button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#loginModal">
                        <i class="fa-solid fa-lock primary-color me-1"></i>
                        Log in
                    </button>

                    <button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#registerModal">
                        <i class="fa-solid fa-user-plus primary-color me-1"></i>
                        Register
                    </button>
                    <%@include file="../modals/user-realated.jsp" %>
                </c:if>

                <!-- If login, show this -->
                <c:if test="${sessionScope.account != null}">
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
                           id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user me-2 primary-color"></i>
                            Hello ${sessionScope.account.role.id != 1 ? "" : "Admin"}:&nbsp;<strong>${sessionScope.account.fullName}</strong>
                        </a>
                        <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                            <c:if test="${sessionScope.account.role.id != 1}"> 
                                <li><a class="dropdown-item" href="user-profile">User Profile</a></li>
                                <li><a class="dropdown-item" href="change-password">Change Password</a></li>
                                <li><a class="dropdown-item" href="my-order">My Order</a></li>
                                </c:if>                           
                            <li><a class="dropdown-item" href="logout">Sign out</a></li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </header>
        <div id="overlay">
            <div id="loader"></div>
        </div>
    </body>
</html>
<script>
    function simulateLoading() {
        var overlay = document.getElementById("overlay");
        overlay.style.display = "block"; // Show the loading overlay
    }
</script>
