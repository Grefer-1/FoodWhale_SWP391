<%-- 
    Document   : RecipeDetail
    Created on : Dec 4, 2021, 4:55:44 PM
    Author     : Asus
--%>

<%@page import="model.Ingredient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Recipe_ingredient"%>
<%@page import="model.Recipe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="../img/favicon.png" type="">
        <title> Recipe Details </title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="../css/style-new.css" rel="stylesheet" type="text/css" />
        <link href="../css/responsive.css" rel="stylesheet" type="text/css" />
        <%
            ArrayList<Recipe> recipelist = (ArrayList<Recipe>) request.getAttribute("recipelist");
            ArrayList<Ingredient> recipeingredient = (ArrayList<Ingredient>) request.getAttribute("ingredient");
            Cookie cookie = null;
            Cookie[] cookies = request.getCookies();
            String USERNAME = "";
            String ROLE = "";
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if (cookie.getName().equalsIgnoreCase("USERNAME")) {
                    USERNAME = cookie.getName().toString();
                }
                if (cookie.getName().equalsIgnoreCase("ROLE")) {
                    ROLE = cookie.getValue().toString();
                }
            }
        %>
    </head>
    <body class="sub_page">
        <div class="hero_area">
            <div class="bg-box">
                <img src="../img/hero-bg.jpg" alt="">
            </div>
            <header class="header_section">
                <div class="container">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}">
                            <span>
                                FoodWhale
                            </span>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  mx-auto ">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/Recipe">Recipe</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/Ingredient">Ingredient</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/About">About</a>
                                </li>
                                <%
                                    if (ROLE.equalsIgnoreCase("") || ROLE.equalsIgnoreCase("user")) {
                                    } else if (ROLE.equalsIgnoreCase("admin") || ROLE.equalsIgnoreCase("staff")) {
                                %>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/Dashboard">Dashboard</a>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                            <div class="user_option">
                                <%
                                    if (ROLE.equalsIgnoreCase("") || ROLE.equalsIgnoreCase("user") || ROLE.equalsIgnoreCase("staff")) {
                                %>
                                <a class="user_link" href="${pageContext.request.contextPath}/Profile">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </a>
                                <%
                                    if (!ROLE.equalsIgnoreCase("staff")) {
                                %>
                                <a class="cart_link" href="${pageContext.request.contextPath}/Cart">
                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                    <g>
                                    <g>
                                    <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                          c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                    </g>
                                    <g>
                                    <g>
                                    <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                          C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                          c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                          C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                    </g>
                                    <g>
                                    <g>
                                    <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                          c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                    </g>
                                    </svg>
                                </a>
                                <form class="form-inline">
                                    <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </form>
                                <%
                                    }
                                %>
                                <%
                                    } else if (ROLE.equalsIgnoreCase("admin")) {
                                    }
                                %>
                                <%
                                    if (USERNAME == null || USERNAME.equalsIgnoreCase("")) {
                                %>
                                <a href="login" class="order_online">
                                    Login
                                </a>
                                <%
                                } else {
                                %>
                                <a href="${pageContext.request.contextPath}/Logout" class="order_online">
                                    Logout
                                </a>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
        </div>
        <section class="food_section layout_padding-bottom" style="padding-top: 90px;">
            <div class="container">
                <div class="page-containers">
                    <%
                        for (Recipe r : recipelist) {
                    %>
                    <div class="page-wrappers">
                        <div class="breadcrumbs">
                            <ul>
                                <li class="">
                                    <a href="${pageContext.request.contextPath}">FoodWhale/</a>
                                </li>
                                <li class="">
                                    <a href="${pageContext.request.contextPath}/Recipe">Recipe/</a>
                                </li>
                                <li class="active">
                                    <span><%= r.getrName()%></span>
                                </li>
                            </ul>
                        </div>
                        <div class="product-detail-container">
                            <div class="product-common">
                                <div class="photo-container">
                                    <div class="photo-box">
                                        <div class="main-photo">
                                            <div class="avaBox">
                                                <img class="img-fit" src="<%= r.getImage()%>"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="package-info">
                                    <div class="basic-info-box">
                                        <h1 class="names"><%= r.getrName()%></h1>
                                        <div class="stat">
                                            <div class="type"><%= r.getcID()%></div>
                                        </div>
                                        <div class="price-x">
                                            <div class="price">
                                                <div>
                                                    <span class="sale-info">Total: </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="extra-info-box">
                                        <div class="display-flex btn-cart-box">
                                            <button class="add-item-wrapper n-btn btn-add-to-cart btn-add-to-collection ">
                                                <span class="row-1">
                                                    <img class="icon" src="../img/rating.png" />
                                                    <span class="text display-block"></span>
                                                </span>
                                            </button>
                                            <button class="btn-add-to-cart n-btn btn-add-to-cart"
                                                    title="bam de them vao gio hang" style="background: none !important;">
                                                <span class="row-1">
                                                    <img class="icon" src="../img/cart.png" />
                                                    <span class="text display-block">Add to Cart</span>
                                                </span>
                                            </button>
                                            <button class="btn-add-to-cart n-btn btn-order "
                                                    title="bam de mua ngay" style="background: rgb(242, 39, 38) !important;">
                                                <span class="row-1">
                                                    <span class="text display-block">Buy Now</span>
                                                </span>
                                            </button>
                                        </div>
                                        <ul class="services-box">
                                            <li class="">
                                                <img src="../img/difficulties.png" />
                                                Difficulty
                                                <div><%= r.getDifficulty()%></div>
                                            </li>
                                            <li class="active">
                                                <img src="../img/clock.png" />
                                                Time
                                                <div><%= r.getTime()%>min</div>
                                            </li>
                                        </ul>
                                        <div class="overview">
                                            <label class="title"></label>
                                            <div class="container">
                                                <div class="option"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product-desc">
                                <div class="title-box">
                                    <div class="active">H?????ng d???n</div>
                                </div>
                                <div class="content-box">
                                    <div class="active">
                                        <ul class="rc-steps-box">
                                            <li>
                                                <span>Step 1:</span>
                                                <div>R???a s???ch c??c nguy??n li???u ???? s?? ch???, ????? r??o n?????c.<br />
                                                    M??i t??u, rau ng??? c???t nh???, c?? chua c???t m??i cau.</div>
                                            </li>
                                            <li>
                                                <span>Step 2:</span>
                                                <div>
                                                    B???t b???p l??n cho 1 mu???ng canh d???u ??n v??o n???i, ?????i d???u n??ng cho th???t b???m v??o x??o cho th???t s??n l???i.<br />
                                                    Sau ???? cho 500 ml n?????c l???c v??o ??un s??i l??n r???i cho d??a chua, c?? chua v??o n???u trong 5 ph??t.
                                                </div>
                                            </li>
                                            <li>
                                                <span>Step 3:</span>
                                                <div>
                                                    Ti???p ?????n, th??m t??? t??? g??i gia v??? ho??n ch???nh n???u chua v??o khu???y cho gia v??? tan ?????u v?? n??m n???m l???i cho v???a ??n, cho t???i phi, m??i t??u, rau ng??? v??o r???i t???t b???p. <br />
                                                    * B?? quy???t: Th??m n?????c m???m l??m d???y m??i th??m v?? canh th??m ?????m ????
                                                </div>
                                            </li>
                                            <li>
                                                <span>Step 4:</span>
                                                <div>B??y m??n ??n ra t?? v?? th?????ng th???c.<br /> Ngon h??n khi ??n n??ng c??ng c??m tr???ng.</div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer_section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-col">
                        <div class="footer_contact">
                            <h4>
                                Contact Us
                            </h4>
                            <div class="contact_link_box">
                                <a href="">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <span>
                                        Location
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <span>
                                        Call +01 1234567890
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span>
                                        demo@gmail.com
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <div class="footer_detail">
                            <a href="" class="footer-logo">
                                Feane
                            </a>
                            <p>
                                Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
                            </p>
                            <div class="footer_social">
                                <a href="">
                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-instagram" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-pinterest" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <h4>
                            Opening Hours
                        </h4>
                        <p>
                            Everyday
                        </p>
                        <p>
                            10.00 Am -10.00 Pm
                        </p>
                    </div>
                </div>
                <div class="footer-info">
                    <p>
                        &copy; <span id="displayYear"></span> All Rights Reserved By
                        <a href="https://html.design/">Free Html Templates</a>
                    </p>
                </div>
            </div>
        </footer>
        <script src="../js/jquery-3.4.1.min.js"></script>
        <script src="../js/ajax.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <script src="../js/bootstrap.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
        </script>
        <script src="../js/isotope.pkgd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <script src="../js/custom.js" async></script>
    </body>
</html>
