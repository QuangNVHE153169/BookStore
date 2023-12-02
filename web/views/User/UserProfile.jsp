<%-- 
    Document   : UserProfile
    Created on : Dec 2, 2023, 8:27:12 PM
    Author     : dell
--%>

<%@include file="../../layout/header.jsp" %>

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
        
    </div>
</div>
<div data-include="footer"></div>
<!-- Script using  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>