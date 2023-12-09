<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Book-shop</title>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    </head>

    <body class="overflow-x-hidden background-gray">
        <%@ include file="../layout/header.jsp" %>
        <!-- Search navigation and link to cart details-->
        <%@ include file="/layout/ShopHeaderSearchAndCart.jsp" %>
        <!--Shop menu navigation-->
        <%@ include file="/layout/ShopNavigation.jsp" %>
        <!-- current page link  -->
        <div class="mt-3 mx-5 py-3 px-2 bg-white rounded-1 shadow-sm">
            Home / <span class="primary-color"> Product Details </span>
        </div>

        <div class="row px-5 mt-4">
            <!--include left side bar-->
            <%@ include file="../layout/LeftSideBar.jsp" %>
            <div class="col-9 d-flex flex-column gap-5 mb-5">
                <!-- PRODUCT DETAIL -->
                <section>
                    <div class="row">
                        <div class="col-md-4 col-12">
                            <div class="slider slider-show-image">
                                <!-- list all image you have here -->
                                <c:forEach items="${book.images}" var="img">
                                    <img style="width: 100%; height: 450px; object-fit: cover; border-radius: 8px;"
                                         src="${img.url}"
                                         alt="book-shop">
                                </c:forEach>

                            </div>
                            <div class="slider slider-list-image">
                                <!-- list all image you have here -->
                                <c:forEach items="${book.images}" var="img">
                                    <img style="width: 100%; height: 150px; object-fit: cover; border-radius: 8px;"
                                         src="${img.url}"
                                         alt="book-shop">
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-md-8 col-12">
                            <div style="font-size: 18px; color: #333; margin-bottom: 10px; font-weight: bold;">
                                ${book.category.categoryName}
                            </div>
                            <h3 style="font-weight: 400; margin-bottom: 14px;">${book.title}</h3>
                            <p style="color: #c83252; font-weight: 700; font-size: 26px; margin-bottom: 14px;">${book.price}$
                            </p>
                            <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                            <div class="mt-3 mb-4">
                                <div class="row">
                                    <div class="col-6">
                                        <p class="mb-0"><span style="font-weight: bold;">Author: </span> ${book.author.authorName}</p>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-6">
                                        <p class="mb-0"><span style="font-weight: bold;">Publisher:</span> ${book.publisher.publisherName}</p>
                                    </div>
                                </div>
                            </div>
                            <div style="height: 1px; width: 100%; background-color: #33333330;"></div>
                            <div class="row" style="padding-top: 12px; padding-bottom: 12px;">
                                <div class="col-6">
                                    <div class="d-flex gap-2 align-items-center">
                                        <i class="fa-solid fa-box-open"></i>
                                        <p class="mb-0">Free shipping</p>
                                    </div>
                                    <div class="d-flex gap-2 align-items-center mt-2">
                                        <i class="fa-solid fa-right-left"></i>
                                        <p class="mb-0">Free return</p>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="d-flex gap-2 align-items-center">
                                        <i class="fa-solid fa-sack-dollar"></i>
                                        <p class="mb-0">Ship COD</p>
                                    </div>
                                    <div class="d-flex gap-2 align-items-center mt-2">
                                        <i class="fa-solid fa-truck-fast"></i>
                                        <p class="mb-0">Nationwide Delivery</p>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <p class="mb-0 mt-1"><span style="font-weight: bold;">Description:</span> ${book.description}</p>
                            <!-- if else to show each case, if have product, show below. If out of stock, show sold out -->
                            <c:if test="${book.quantity != 0}">
                                <div class="mt-3 d-flex flex-column flex-md-row gap-3 align-items-md-center" id="show_buy">
                                    <div class="d-flex gap-3 align-items-center">
                                        <input type="number" class="input_cart_width" name="qty" value="1">
                                        <button class="btn btn-outline-secondary btn-lg custom_btn_add">Add to cart</button>
                                    </div>
                                    <button class="btn btn-primary btn-lg custom_btn_buynow">Buy now</button>
                                </div>
                            </c:if>
                            <c:if test="${book.quantity == 0}">
                                <div class="mt-3" id="show_out">
                                    <button class="btn btn-outline-danger btn-lg" style="cursor: not-allowed;">Out of
                                        stock</button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </section>

                <!-- Recommend Book -->
                <seciton>
                    <div class="fs-4 fw-light my-3">Recommend Book</div>
                    <div class="row">
                        <c:forEach items="${featurebook}" var="b">
                            <div class="product-grid col-3 mt-2">
                                <div class="product-image">
                                    <a href="listAllBook?bookId=${b.bookId}" class="image image-in-list">
                                        <img
                                            src="${b.images.get(0).url}" style="width: 350px;height: 350px">
                                    </a>
                                    <a href="" class="add-to-cart show-add-to-cart">Add to Cart</a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a class="h5 text-decoration-none text-dark" style="font-weight: 600;"
                                                         href="listAllBook?bookId=${b.bookId}">
                                            <c:if test="${b.title.trim().length() > 25}">
                                                ${b.title.trim().substring(0,25)}...
                                            </c:if>
                                            <c:if test="${b.title.trim().length() <= 25}">
                                                ${b.title.trim()}
                                            </c:if>
                                        </a></h3>
                                    <h6 class="text-secondary text-truncate">
                                        <c:if test="${b.description.trim().length() > 40}">
                                            ${b.description.trim().substring(0,50)}...
                                        </c:if>
                                        <c:if test="${b.description.trim().length() <= 40}">
                                            ${b.description.trim()}
                                        </c:if>
                                    </h6>
                                    <div class="price">${b.price}$</div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </seciton>
            </div>
        </div>
        <div data-include="footer"></div>
        <!-- Script using  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
        <script>
            $('.slider-show-image').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                fade: true,
                asNavFor: '.slider-list-image'
            });
            $('.slider-list-image').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                asNavFor: '.slider-show-image',
                focusOnSelect: true
            });
        </script>
    </body>

</html>