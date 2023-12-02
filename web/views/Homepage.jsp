<%-- 
    Document   : Homepage
    Created on : Dec 2, 2023, 8:15:32 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <body class="overflow-x-hidden background-gray">
        <!-- Main content  -->
        <%@ include file="../layout/header.jsp" %>

        <!-- don't show in profile tab  -->
        <!-- <div data-include="shop-header"></div> -->
        <header class="px-5 py-3 border-bottom background-white">
            <div class="row align-items-center">
                <div class="col-sm-12 col-md-4 col-lg-3 mobile-center">
                    <!-- LOGO -->
                    <div id="logo">
                        <a href="/" class="href-unstyled">
                            <b class="hover-color-primary">BOOKS</b>
                            <div>Online store</div>
                        </a>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-6 mobile-center">
                    <!-- HEADER SEARCH -->
                    <form action="/search" method="get" class="input-group">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="floatingInput" placeholder="Search" />
                            <label for="floatingInput">Search</label>
                        </div>
                        <button id="search-button" type="button" class="btn btn-primary">
                            SEARCH
                        </button>
                    </form>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 header_cart_wrapper">
                    <!-- HEADER CART -->
                    <a class="d-flex align-items-center gap-3 href-unstyled hover-color-primary" href="/cart"><i
                            class="fa fa-xl fa-shopping-cart"></i>
                        <div>
                            <div style="font-size: 18px; font-weight: 700">
                                Shopping cart:
                                <span style="font-size: 20; color: #fc5c3c" class="count">0</span>
                            </div>
                            <div style="color: #fc5c3c">Checkout</div>
                        </div>
                    </a>
                </div>
            </div>
        </header>

        <!-- <div data-include="shop-navigation"></div> -->
        <section class="sticky-top">
            <nav class="px-5 border-start border-end border-bottom background-white">
                <div class="border-start border-end py-3 px-3">
                    <ul class="nav col-12 col-md-auto">
                        <!-- ACTIVE TAB WILL USING primary-color css, other using link-dark  -->
                        <li>
                            <a href="#" class="nav-link px-3 primary-color fs-5">HOME</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link px-3 link-dark fs-5">PRODUCTS</a>
                        </li>
                        <li><a href="#" class="nav-link px-3 link-dark fs-5">BLOG</a></li>
                        <li><a href="#" class="nav-link px-3 link-dark fs-5">SALE</a></li>
                        <li>
                            <a href="#" class="nav-link px-3 link-dark fs-5">CONTACT US</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </section>

        <!-- only show when in subpage, don't show in home page -->
        <!-- active page will have primary-color css  -->
        <div class="mt-3 mx-5 py-3 px-2 bg-white rounded-1 shadow-sm">
            Home / <span class="primary-color"> Products </span>
        </div>

        <div class="row px-5 mt-4">
            <!-- book left side bar, different from profile side bar  -->
            <!-- <div data-include="left-side-bar"></div> -->
            <div class="col-3">
                <div class="fs-4">COLLECTIONS</div>
                <ul class="list-group mt-2">
                    <li class="list-group-item">
                        <a class="href-unstyled hover-color-primary" href="/collections/antiques"
                           title="Antiques">Antiques</a>
                    </li>
                    <li class="list-group-item">
                        <a class="href-unstyled hover-color-primary" href="/collections/blanks" title="Blanks">Blanks</a>
                    </li>
                </ul>
                <div class="fs-4 mt-4">BLOGS</div>
                <ul class="list-group mt-2">
                    <li class="list-group-item">
                        <a class="href-unstyled hover-color-primary" href="/collections/antiques"
                           title="Antiques">Antiques</a>
                    </li>
                    <li class="list-group-item">
                        <a class="href-unstyled hover-color-primary" href="/collections/blanks" title="Blanks">Blanks</a>
                    </li>
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
                        FEATURED PRODUCTS
                    </div>
                    <div class="mt-3">
                        <div class="main">
                            <div class="slider slider-nav">
                                <div class="product-grid slick-slide">
                                    <div class="product-image">
                                        <a href="#" class="image">
                                            <img
                                                src="https://theme133-books.myshopify.com/cdn/shop/products/an_army_at_dawn_the_war_in_north_africa_19421943_volume_one_of_the_liberation_trilogy_by_rick_atkinson_1_large.png?v=1422032906">
                                        </a>
                                        <span class="product-prop-label shadow">New</span>
                                        <span class="product-sale-label shadow">Sale</span>
                                        <a href="" class="add-to-cart">Add to Cart</a>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a class="h5 text-decoration-none text-dark"
                                                             style="font-weight: 600;" href="#">Women's
                                                Blouse Top</a></h3>
                                        <h6 class="text-secondary text-truncate">
                                            Description here lalalalal trung duc allalalla trung duc allalalla trung duc
                                            allalalla
                                        </h6>
                                        <div class="price">$53.55 <span>$68.88</span></div>
                                    </div>
                                </div>
                                <div class="product-grid slick-slide">
                                    <div class="product-image">
                                        <a href="#" class="image">
                                            <img
                                                src="https://theme133-books.myshopify.com/cdn/shop/products/elder_scrolls_v_skyrim_legendary_standard_edition_prima_official_game_guide_prima_official_game_guides_by_david_hodgson_1_large.png?v=1422032925">
                                        </a>
                                        <span class="product-prop-label shadow">New</span>
                                        <span class="product-sale-label shadow">Sale</span>
                                        <a href="" class="add-to-cart">Add to Cart</a>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a class="h5 text-decoration-none text-dark"
                                                             style="font-weight: 600;" href="#">Women's
                                                Blouse Top</a></h3>
                                        <h6 class="text-secondary text-truncate">
                                            Description here lalalalal trung duc allalalla trung duc allalalla trung duc
                                            allalalla
                                        </h6>
                                        <div class="price">$53.55 <span>$68.88</span></div>
                                    </div>
                                </div>
                                <div class="product-grid slick-slide">
                                    <div class="product-image">
                                        <a href="#" class="image">
                                            <img
                                                src="https://theme133-books.myshopify.com/cdn/shop/products/an_army_at_dawn_the_war_in_north_africa_19421943_volume_one_of_the_liberation_trilogy_by_rick_atkinson_1_large.png?v=1422032906">
                                        </a>
                                        <span class="product-prop-label shadow">New</span>
                                        <span class="product-sale-label shadow">Sale</span>
                                        <a href="" class="add-to-cart">Add to Cart</a>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a class="h5 text-decoration-none text-dark"
                                                             style="font-weight: 600;" href="#">Women's
                                                Blouse Top</a></h3>
                                        <h6 class="text-secondary text-truncate">
                                            Description here lalalalal trung duc allalalla trung duc allalalla trung duc
                                            allalalla
                                        </h6>
                                        <div class="price">$53.55 <span>$68.88</span></div>
                                    </div>
                                </div>
                                <div class="product-grid slick-slide">
                                    <div class="product-image">
                                        <a href="#" class="image">
                                            <img
                                                src="https://theme133-books.myshopify.com/cdn/shop/products/elder_scrolls_v_skyrim_legendary_standard_edition_prima_official_game_guide_prima_official_game_guides_by_david_hodgson_1_large.png?v=1422032925">
                                        </a>
                                        <span class="product-prop-label shadow">New</span>
                                        <span class="product-sale-label shadow">Sale</span>
                                        <a href="" class="add-to-cart">Add to Cart</a>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a class="h5 text-decoration-none text-dark"
                                                             style="font-weight: 600;" href="#">Women's
                                                Blouse Top</a></h3>
                                        <h6 class="text-secondary text-truncate">
                                            Description here lalalalal trung duc allalalla trung duc allalalla trung duc
                                            allalalla
                                        </h6>
                                        <div class="price">$53.55 <span>$68.88</span></div>
                                    </div>
                                </div>
                                <div class="product-grid slick-slide">
                                    <div class="product-image">
                                        <a href="#" class="image">
                                            <img
                                                src="https://theme133-books.myshopify.com/cdn/shop/products/an_army_at_dawn_the_war_in_north_africa_19421943_volume_one_of_the_liberation_trilogy_by_rick_atkinson_1_large.png?v=1422032906">
                                        </a>
                                        <span class="product-prop-label shadow">New</span>
                                        <span class="product-sale-label shadow">Sale</span>
                                        <a href="" class="add-to-cart">Add to Cart</a>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a class="h5 text-decoration-none text-dark"
                                                             style="font-weight: 600;" href="#">Women's
                                                Blouse Top</a></h3>
                                        <h6 class="text-secondary text-truncate">
                                            Description here lalalalal trung duc allalalla trung duc allalalla trung duc
                                            allalalla
                                        </h6>
                                        <div class="price">$53.55 <span>$68.88</span></div>
                                    </div>
                                </div>
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
            </div>
        </section>
    </div>
</div>
<div data-include="footer"></div>

</body>

</html>
