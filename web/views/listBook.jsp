<head>
    <title>Products</title>
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

    <%@ include file="../layout/header.jsp" %>
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
            <!-- LIST PRODUCTS -->
            <section>
                <div class="fs-3 text-start">
                    PRODUCTS
                </div>
                <hr>
                <div class="d-flex justify-content-end align-items-center gap-2">
                    <div class="fs-6 fw-light">Sort by</div>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="filterCategory"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            Filter by Category
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="filterCategory">
                            <li><a class="dropdown-item" href="#">Default</a></li>
                            <li><a class="dropdown-item" href="#">Sort by Title A-Z</a></li>
                            <li><a class="dropdown-item" href="#">Sort by Title Z-A</a></li>
                            <li><a class="dropdown-item" href="#">Sort by Price Ascending</a></li>
                            <li><a class="dropdown-item" href="#">Sort by Price Descending</a></li>
                        </ul>
                    </div>
                </div>
                <hr>
                <div class="mt-3 row">
                    <c:forEach items="${items}" var="b">
                        <div class="product-grid col-4 mt-2">
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
                <!--Pagination of item (6 item each page)--> 
                <c:if test="${items.size() > 1}">
                    <div class="d-flex justify-content-center mt-1">
                        <nav aria-label="Page navigation example col-12">
                            <ul class="pagination">
                                <%--For displaying Previous link except for the 1st page --%>
                                <c:if test="${currentPage != 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="listAllBook?${queryString}page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <%--For displaying Page numbers. The when condition does not display
                                            a link for the current page--%>
                                <c:forEach begin="1" end="${totalPage}" var="i">
                                    <c:choose>
                                        <c:when test="${currentPage eq i}"> 
                                            <li class="page-item"><a class="page-link bg-light">${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="listAllBook?${queryString}page=${i}">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                <%--For displaying Next link --%>
                                <c:if test="${currentPage lt totalPage}">
                                    <li class="page-item">
                                        <a class="page-link" href="listAllBook?${queryString}page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </c:if>
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