<%@ include file="../layout/header.jsp" %>
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
    <%@ include file="/layout/ShopHeaderSearchAndCart.jsp" %>

    <!--Shop menu navigation-->
    <%@ include file="/layout/ShopNavigation.jsp" %>
    <!-- current page link  -->
    <div class="mt-3 mx-5 py-3 px-2 bg-white rounded-1 shadow-sm">
        Home / <span class="primary-color"> Products </span>
    </div>

    <div class="row px-5 mt-4">

        <!--include left side bar-->
        <%@ include file="../layout/LeftSideBar.jsp" %>

        <div class="col-9 d-flex flex-column gap-5">
            <!-- BANNER CAROUSEL  -->
            <section id="banner">
                <!-- Carousel wrapper -->
                <div id="carousel-starter" class="carousel slide" data-bs-slide="carousel">
                    <div class=" carousel-inner carousel-starter">
                        <div class="carousel-item active">
                            <div class="position-relative" style="height: 420px; width: auto;">
                                <img src="https://theme133-books.myshopify.com/cdn/shop/t/2/assets/slide1_image.jpg?v=166582052477369407421422267868"
                                     alt="bg-blog" style="object-fit: cover; width: 100%;">
                                <div class="position-absolute top-0 start-0 end-0 row">
                                    <div class="col-5">
                                    </div>
                                    <div class="col-7 d-flex flex-column gap-3 justify-content-center align-items-center pe-5"
                                         style="height: 400px;">
                                        <div class="primary-color fs-5">
                                            Book best seller
                                        </div>
                                        <div class="text-white fs-1">
                                            Book head title
                                        </div>
                                        <div class="text-white fs-6">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit saepe
                                            officia neque sit vitae fugiat sapiente consequuntur vero, distinctio omnis
                                            illo in. Fugit quibusdam quae obcaecati id eum, culpa harum.
                                        </div>
                                        <button class="btn btn-primary btn-lg">
                                            SHOP NOW
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="position-relative" style="height: 420px; width: auto;">
                                <img src="https://theme133-books.myshopify.com/cdn/shop/t/2/assets/slide3_image.jpg?v=176244652812457041241422267869"
                                     alt="bg-blog" style="object-fit: cover; width: 100%;">
                                <div class="position-absolute top-0 start-0 end-0 row">
                                    <div class="col-5">
                                    </div>
                                    <div class="col-7 d-flex flex-column gap-3 justify-content-center align-items-center pe-5"
                                         style="height: 400px;">
                                        <div class="primary-color fs-5">
                                            Book best seller
                                        </div>
                                        <div class="text-white fs-1">
                                            Book head title
                                        </div>
                                        <div class="text-white fs-6">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit saepe
                                            officia neque sit vitae fugiat sapiente consequuntur vero, distinctio omnis
                                            illo in. Fugit quibusdam quae obcaecati id eum, culpa harum.
                                        </div>
                                        <button class="btn btn-primary btn-lg">
                                            SHOP NOW
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel-starter"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carousel-starter"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </section>

            <!-- FEATURED COLLECTIONS -->
            <section class="w-100">
                <div class="fs-3 text-center">
                    FEATURED COLLECTIONS
                </div>
                <div class="mt-3 row">
                    <div class="col-4 d-grid">
                        <div class="border shadow-sm bg-white px-4 py-3 d-flex flex-column gap-3 align-items-center">
                            <img src="https://theme133-books.myshopify.com/cdn/shop/collections/Antiques_large.png?v=1422268491"
                                 alt="collection-img" style="height: 210px; object-fit: cover; width: 100%;">
                            <div class="fs-5 fw-bold">ANTIQUES</div>
                            <div>We have variety of products</div>
                            <button class="btn btn-primary btn-lg">SEE COLLECTION</button>
                        </div>
                    </div>
                    <div class="col-4 d-grid">
                        <div class="border shadow-sm bg-white px-4 py-3 d-flex flex-column gap-3 align-items-center">
                            <img src="	https://theme133-books.myshopify.com/cdn/shop/collections/Writing-materials_large.png?v=1422268504"
                                 alt="collection-img" style="height: 210px; object-fit: cover; width: 100%;">
                            <div class="fs-5 fw-bold">ANTIQUES</div>
                            <div>We have variety of products</div>
                            <button class="btn btn-primary btn-lg">SEE COLLECTION</button>
                        </div>
                    </div>
                    <div class="col-4 d-grid">
                        <div class="border shadow-sm bg-white px-4 py-3 d-flex flex-column gap-3 align-items-center">
                            <img src="https://theme133-books.myshopify.com/cdn/shop/collections/Magazines_large.png?v=1422268514"
                                 alt="collection-img" style="height: 210px; object-fit: cover; width: 100%;">
                            <div class="fs-5 fw-bold">ANTIQUES</div>
                            <div>We have variety of products</div>
                            <button class="btn btn-primary btn-lg">SEE COLLECTION</button>
                        </div>
                    </div>
                </div>
            </section>

            <!-- FEATURED PRODUCTS -->
            <section>
                <div class="fs-3 text-center">
                    FEATURED BOOKS
                </div>
                <div class="mt-3">
                    <div class="main">
                        <div class="slider slider-nav">
                            <c:forEach items="${sessionScope.featurebook}" var="b">
                                <div class="product-grid slick-slide">
                                    <div class="product-image">
                                        <a class="h5 text-decoration-none text-dark" style="font-weight: 600;"
                                           href="listAllBook?bookId=${b.bookId}">
                                            <img src="${b.latestImage.url}" style="width: 350px;height: 350px">
                                        </a>
                                        <a href="" class="add-to-cart">Add to Cart</a>
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
                    </div>
                </div>
            </section>

            <!-- FROM THE BLOG -->
            <section>
                <div class="fs-3 text-center">
                    FROM THE BLOG
                </div>
                <div class="mt-3 row">
                    <div class="d-grid col-4">
                        <div class="border shadow-sm bg-white px-4 py-3 d-flex flex-column gap-3 align-items-center">
                            <div class="fs-6 fw-light primary-color">
                                Monday, January 26, 2015
                            </div>
                            <div class="fs-4">
                                Blog 1
                            </div>
                            <img class="rounded" style="height: 200px; object-fit: cover; max-width: 260px;"
                                 src="https://cdn.shopify.com/s/files/1/0752/1473/files/blog3.jpg?53" alt="">
                            <div class="fs-6 fw-light text-black">
                                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas assumenda minima,
                                iusto corrupti quidem ipsam ab? Eos, dolores. Assumenda nisi, nemo officia natus quidem
                                adipisci sint quam? Officia, perspiciatis cumque!
                            </div>
                            <button class="btn btn-primary btn-lg">READ MORE</button>
                        </div>
                    </div>
                    <div class="d-grid col-4">
                        <div class="border shadow-sm bg-white px-4 py-3 d-flex flex-column gap-3 align-items-center">
                            <div class="fs-6 fw-light primary-color">
                                Monday, January 26, 2015
                            </div>
                            <div class="fs-4">
                                Blog 1
                            </div>
                            <img class="rounded" style="height: 200px; object-fit: cover; max-width: 260px;"
                                 src="https://cdn.shopify.com/s/files/1/0752/1473/files/blog3.jpg?53" alt="">
                            <div class="fs-6 fw-light text-black">
                                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas assumenda minima,
                                iusto corrupti quidem ipsam ab? Eos, dolores. Assumenda nisi, nemo officia natus quidem
                                adipisci sint quam? Officia, perspiciatis cumque!
                            </div>
                            <button class="btn btn-primary btn-lg">READ MORE</button>
                        </div>
                    </div>
                    <div class="d-grid col-4">
                        <div class="border shadow-sm bg-white px-4 py-3 d-flex flex-column gap-3 align-items-center">
                            <div class="fs-6 fw-light primary-color">
                                Monday, January 26, 2015
                            </div>
                            <div class="fs-4">
                                Blog 1
                            </div>
                            <img class="rounded" style="height: 200px; object-fit: cover; max-width: 260px;"
                                 src="https://cdn.shopify.com/s/files/1/0752/1473/files/blog3.jpg?53" alt="">
                            <div class="fs-6 fw-light text-black">
                                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas assumenda minima,
                                iusto corrupti quidem ipsam ab? Eos, dolores. Assumenda nisi, nemo officia natus quidem
                                adipisci sint quam? Officia, perspiciatis cumque!
                            </div>
                            <button class="btn btn-primary btn-lg">READ MORE</button>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ABOUT STORE -->
            <section class="mb-5">
                <div class="fs-3 text-center">
                    ABOUT STORE
                </div>
                <div class="mt-3 row">
                    <div class="d-grid col">
                        <div class="border shadow-sm bg-white px-4 py-3 d-flex flex-column gap-3 align-items-center">
                            <i class="fa fa-truck fa-2xl primary-color mt-4"></i>
                            <div class="fs-5 fw-bold">FREE SHIPPING</div>
                            <div>We have variety of products</div>
                        </div>
                    </div>
                    <div class="d-grid col">
                        <div class="border shadow-sm bg-white px-4 py-3 d-flex flex-column gap-3 align-items-center">
                            <i class="fa fa-thumbs-o-up fa-2xl primary-color mt-4"></i>
                            <div class="fs-5 fw-bold text-center">SATISFACTION
                                100% GUARANTEED</div>
                            <div>We have variety of products</div>
                        </div>
                    </div>
                    <div class="d-grid col">
                        <div class="border shadow-sm bg-white px-4 py-3 d-flex flex-column gap-3 align-items-center">
                            <i class="fa fa-refresh fa-2xl primary-color mt-4"></i>
                            <div class="fs-5 fw-bold text-center">EASY RETURN</div>
                            <div>We have variety of products</div>
                        </div>
                    </div>
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
