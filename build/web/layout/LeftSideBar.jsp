<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <body>
        <!-- book left side bar, different from profile side bar  -->
        <!-- <div data-include="left-side-bar"></div> -->
        <div class="col-3">
            <div class="fs-4 mt-4">Categories</div>
            <ul class="list-group mt-2">
                <c:forEach items="${categories}" var="c">
                    <li class="list-group-item">
                        <a class="href-unstyled hover-color-primary" href="/collections/antiques">${c.categoryName}</a>
                    </li>
                </c:forEach>
            </ul>
            <div class="fs-4 mt-4">BEST SELLERS</div>
            <ul class="list-group mt-2">
                <li class="list-group-item">
                    <div class="d-flex gap-2">
                        <img src="https://theme133-books.myshopify.com/cdn/shop/products/american_gods_by_neil_gaiman_1_medium.png?v=1422032887"
                             alt="book-img" style="height: 150px;width: 110px; object-fit: cover;">
                        <div class="flex flex-column gap-3">
                            <div class="fs-5 fw-medium">
                                American gods
                            </div>
                            <div class="fs-5 fw-light primary-color">$53.55 <span
                                    class="text-decoration-line-through fs-6 fw-light text-black">$68.88</span>
                            </div>
                            <button class="btn btn-primary mt-2 buy-hover-effect">
                                <i class="fa fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="d-flex gap-2">
                        <img src="https://theme133-books.myshopify.com/cdn/shop/products/amusing_ourselves_to_death_public_discourse_in_the_age_of_show_business_by_neil_postman_1_medium.png?v=1422032897"
                             alt="book-img" style="height: 150px;width: 110px; object-fit: cover;">
                        <div class="flex flex-column gap-3">
                            <div class="fs-5 fw-medium">
                                Amusing
                            </div>
                            <div class="fs-5 fw-light primary-color">$53.55 <span
                                    class="text-decoration-line-through fs-6 fw-light text-black">$68.88</span>
                            </div>
                            <button class="btn btn-primary mt-2 buy-hover-effect">
                                <i class="fa fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </body>
</html>
