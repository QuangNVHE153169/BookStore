<%@ include file="../../layout/header.jsp" %>
<head>
    <title>Home Page</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

    <!-- Search navigation and link to cart details-->
    <%@ include file="../../layout/ShopHeaderSearchAndCart.jsp" %>

    <!--Shop menu navigation-->
    <%@ include file="../../layout/ShopNavigation.jsp" %>
    <!-- current page link  -->
    <div class="mt-3 mx-5 py-3 px-2 bg-white rounded-1 shadow-sm">
        Home / <span class="primary-color"> Cart Detail </span>
    </div>

    <div class="row px-5 mt-4">

        <!--include left side bar-->
        <%@ include file="../../layout/LeftSideBar.jsp" %>

        <div class="col-9 d-flex flex-column gap-5">
            <!-- Shopping cart section  -->
            <section>
                <div class="fs-3 text-start">
                    SHOPPING CART
                </div>
                <div>
                    <!-- MAP EACH PRODUCT HERE  -->
                    <div class="row py-3 ps-4 border-bottom border-2">
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <div style="height: 240px;">
                                <a href="#">
                                    <img class="object-fit-cover"
                                         src="//theme133-books.myshopify.com/cdn/shop/products/american_gods_by_neil_gaiman_2_medium.png?v=1422032887"
                                         alt="American Gods by Neil Gaiman - original">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <div class="fs-3 fw-medium">
                                        American Gods by Neil Gaiman - original
                                    </div>
                                    <h3 class="fs-6 fw-light">BOOKS</h3>
                                </div>
                                <a href="#"><i class="fa fa-xl fa-times primary-color"></i></a>
                            </div>
                            <hr>
                            <div>
                                <div class="row align-items-center">
                                    <div class="col-sm-4">
                                        <div class="fs-6 fw-light">
                                            Price: <span class="fs-5 fw-semibold">
                                                16$
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="d-flex align-items-center gap-2">
                                            <div>
                                                Qty:
                                            </div>
                                            <input class="form-control w-50" type="number" value="2" />
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-end mt-3">
                                    <h3>Total: <span class="money">$32</span></h3>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row py-3 ps-4 border-bottom border-2">
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <div style="height: 240px;">
                                <a href="#">
                                    <img class="object-fit-cover"
                                         src="//theme133-books.myshopify.com/cdn/shop/products/american_gods_by_neil_gaiman_2_medium.png?v=1422032887"
                                         alt="American Gods by Neil Gaiman - original">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <div class="fs-3 fw-medium">
                                        American Gods by Neil Gaiman - original
                                    </div>
                                    <h3 class="fs-6 fw-light">BOOKS</h3>
                                </div>
                                <a href="#"><i class="fa fa-xl fa-times primary-color"></i></a>
                            </div>
                            <hr>
                            <div>
                                <div class="row align-items-center">
                                    <div class="col-sm-4">
                                        <div class="fs-6 fw-light">
                                            Price: <span class="fs-5 fw-semibold">
                                                16$
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="d-flex align-items-center gap-2">
                                            <div>
                                                Qty:
                                            </div>
                                            <input class="form-control w-50" type="number" value="2" />
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-end mt-3">
                                    <h3>Total: <span class="money">$32</span></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="fs-4 fw-light">SUBTOTAL</div>
                    <div class="fs-4 fw-bold">
                        64$
                    </div>
                </div>
                <hr>
                <div class="mt-3 fs-6 fw-light">
                    Special instructions for seller
                </div>
                <textarea class="form-control" rows="1"></textarea>
                <div class="d-flex align-items-center gap-2 mt-3">
                    <a class="href-unstyled hover-color-primary cursor-pointer fw-medium">Continue shopping</a>
                    <div>Or</div>
                    <button class="btn btn-primary">UPDATE CART</button>
                    <div>Or</div>
                    <button class="btn btn-primary">CHECK OUT</button>
                </div>
                <div id="payment-methods" class="mt-3">
                    <ul class="list-unstyled d-flex align-items-center gap-2">
                        <li> <img
                                src="//theme133-books.myshopify.com/cdn/shop/t/2/assets/cc-amex.png?v=85206210438157468371422029679"
                                alt=""> </li>
                        <li> <img
                                src="//theme133-books.myshopify.com/cdn/shop/t/2/assets/cc-discover.png?v=159641487460128453101422029679"
                                alt=""> </li>
                        <li> <img
                                src="//theme133-books.myshopify.com/cdn/shop/t/2/assets/cc-visa.png?v=60401960785579442311422029679"
                                alt=""> </li>
                        <li> <img
                                src="//theme133-books.myshopify.com/cdn/shop/t/2/assets/cc-mastercard.png?v=163639441997642668931422029679"
                                alt=""> </li>
                        <li> <img
                                src="//theme133-books.myshopify.com/cdn/shop/t/2/assets/cc-maestro.png?v=139224602151549589811422029679"
                                alt=""> </li>
                        <li> <img
                                src="//theme133-books.myshopify.com/cdn/shop/t/2/assets/cc-cirrus.png?v=84032823879888718741422029679"
                                alt=""> </li>
                        <li> <img
                                src="//theme133-books.myshopify.com/cdn/shop/t/2/assets/cc-paypal.png?v=24241626605458918351422029679"
                                alt=""> </li>
                        <li> <img
                                src="//theme133-books.myshopify.com/cdn/shop/t/2/assets/cc-google.png?v=886431518207722091422029679"
                                alt=""> </li>
                    </ul>
                </div>
            </section>
        </div>
    </div>
    <div data-include="footer"></div>
    <!-- Script using  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    <script>
        $('.slider-nav').slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            arrows: true,
            dots: true,
            autoplay: true,
            autoplaySpeed: 4000,
        });
    </script>
</body>
