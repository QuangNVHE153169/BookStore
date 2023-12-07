<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Book-shop</title>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
    </head>

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
        <!-- Script using  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>
