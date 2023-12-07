<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    </body>

</html>
