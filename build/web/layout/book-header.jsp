<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="d-flex flex-wrap justify-content-center py-3 border-bottom px-5">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
        <div class="rounded-circle d-flex justify-content-center align-items-center home-button smooth-transform"
             style="width: 40px; height: 40px;">
            <i class="fa fa-home primary-color"></i>
        </div>
    </a>

    <div class="d-flex align-items-center gap-3">
        <div class="nav-item"><a href="/cart.html" class="nav-link link-dark">
                <i class="fa-solid fa-cart-shopping"></i>
                Your cart: 1 products</a></div>
        <!-- If DO NOT login, show this      -->
        <c:if test="${sessionScope.account == null}">    
            <button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#loginModal">
                <i class="fa-solid fa-lock primary-color me-1"></i>
                Log in</button>

            <button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#registerModal">
                <i class="fa-solid fa-user-plus primary-color me-1"></i>
                Register</button>

            <%@include file="../modals/user-realated.jsp" %>
        </c:if>

        <!-- If login, show this -->
        <c:if test="${sessionScope.account != null}">
            <div class="dropdown">
                <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
                   id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fa-solid fa-user me-2 primary-color"></i>
                    Hello:&nbsp;<strong> ${sessionScope.account.fullName}</strong>
                </a>
                <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                    <li><a class="dropdown-item" href="logout">Sign out</a></li>
                </ul>
            </div>
        </c:if>
    </div>
</header>

