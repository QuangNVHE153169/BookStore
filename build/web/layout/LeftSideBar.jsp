<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <body>
        <!-- book left side bar, different from profile side bar  -->
        <!-- <div data-include="left-side-bar"></div> -->
        <div class="col-3">
            <div class="fs-4 mt-4">Categories</div>
            <ul class="list-group mt-2">
                <li class="list-group-item">
                    <a class="href-unstyled hover-color-primary" href="#">All Category</a>
                </li>
                <c:forEach items="${sessionScope.categories}" var="c">
                    <li class="list-group-item">
                        <a class="href-unstyled hover-color-primary" href="#">${c.categoryName}</a>
                    </li>
                </c:forEach>
            </ul>
            <div class="fs-4 mt-4">Authors</div>
            <ul class="list-group mt-2">
                <li class="list-group-item">
                    <a class="href-unstyled hover-color-primary" href="#">All Author</a>
                </li>
                <c:forEach items="${sessionScope.authors}" var="a">
                    <li class="list-group-item">
                        <a class="href-unstyled hover-color-primary" href="#">${a.authorName}</a>
                    </li>
                </c:forEach>
            </ul>
            <div class="fs-4 mt-4">Publishers</div>
            <ul class="list-group mt-2">
                <li class="list-group-item">
                    <a class="href-unstyled hover-color-primary" href="#">All Publisher</a>
                </li>
                <c:forEach items="${sessionScope.publishers}" var="p">
                    <li class="list-group-item">
                        <a class="href-unstyled hover-color-primary" href="#">${p.publisherName}</a>
                    </li>
                </c:forEach>
            </ul>
            <div class="fs-4 mt-4">3 BEST SELLERS</div>
            <ul class="list-group mt-2">
                <c:forEach items="${sessionScope.top3book}" var="b">
                    <li class="list-group-item">
                        <div class="d-flex gap-2">
                            <a class="h5 text-decoration-none text-dark" style="font-weight: 600;"
                               href="listAllBook?bookId=${b.bookId}">
                                <img src="${b.images.get(0).url}"
                                     alt="book-img" style="height: 150px;width: 110px; object-fit: cover;">
                            </a>
                            <div class="flex flex-column gap-3">
                                <a class="h5 text-decoration-none text-dark" style="font-weight: 600;"
                                   href="listAllBook?bookId=${b.bookId}">
                                    ${b.title}
                                </a>
                                <div class="fs-5 fw-light primary-color">${b.price}$</div>
                                <button class="btn btn-primary mt-2 buy-hover-effect">
                                    <i class="fa fa-shopping-cart"></i>
                                </button>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </body>
</html>
