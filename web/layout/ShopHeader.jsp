<%-- 
    Document   : ShopHeader
    Created on : Dec 2, 2023, 8:29:32 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Book-shop</title>
        <link rel="stylesheet" href="styles.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    </head>

    <body>
        <!-- Header of all content  -->
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

        <!-- Script using  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>
