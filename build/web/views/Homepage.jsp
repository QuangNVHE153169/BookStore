<%@ include file="../layout/header.jsp" %>
<head>
    <title>Home Page</title>
</head>
<body class="overflow-x-hidden background-gray">
    
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
