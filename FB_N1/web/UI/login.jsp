

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="vi">

    <head>
        <!-- đường dẫn tương đối được tính từ 1 gốc chung -->
        <!-- đường dẫn tương đối được tính từ 1 gốc chung -->
        <base href="${pageContext.request.contextPath}/UI/">
            <!-- đường dẫn tương đối được tính từ 1 gốc chung -->
            <!-- đường dẫn tương đối được tính từ 1 gốc chung -->
            <meta charset="utf-8">
                <title>Đăng nhập - FootballStar</title>

                <meta name="author" content="themesflat.com">
                    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

                        <link rel="stylesheet" href="app/css/app.css">
                            <link rel="stylesheet" href="app/css/jquery.fancybox.min.css">

                                <!-- Favicon and Touch Icons  -->
                                <link rel="shortcut icon" href="assets/images/logoKoChu.png">
                                    <link rel="apple-touch-icon-precomposed" href="assets/images/logoKoChu.png">
                                        <link href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" rel="stylesheet">

                                            <link rel="stylesheet" href="fonts/line-icons.css" type="text/css">

                                                </head>

                                                <body class="body header-fixed ">

                                                    <div class="preload preload-container">
                                                        <svg class="pl" width="240" height="240" viewBox="0 0 240 240">
                                                            <circle class="pl__ring pl__ring--a" cx="120" cy="120" r="105" fill="none" stroke="#000" stroke-width="20" stroke-dasharray="0 660" stroke-dashoffset="-330" stroke-linecap="round"></circle>
                                                            <circle class="pl__ring pl__ring--b" cx="120" cy="120" r="35" fill="none" stroke="#000" stroke-width="20" stroke-dasharray="0 220" stroke-dashoffset="-110" stroke-linecap="round"></circle>
                                                            <circle class="pl__ring pl__ring--c" cx="85" cy="120" r="70" fill="none" stroke="#000" stroke-width="20" stroke-dasharray="0 440" stroke-linecap="round"></circle>
                                                            <circle class="pl__ring pl__ring--d" cx="155" cy="120" r="70" fill="none" stroke="#000" stroke-width="20" stroke-dasharray="0 440" stroke-linecap="round"></circle>
                                                        </svg>
                                                    </div>

                                                    <!-- /preload -->

                                                    <div id="wrapper">
                                                        <div id="pagee" class="clearfix">

                                                            <!-- Main Header -->
                                                            <jsp:include page="header.jsp"></jsp:include>
                                                                <!-- End Main Header -->
                                                                <main id="main">

                                                                    <section class="breadcumb-section">
                                                                        <div class="tf-container">
                                                                            <div class="row">
                                                                                <div class="col-lg-12 center z-index1">
                                                                                    <h1 class="title">Đăng nhập tài khoản</h1>
                                                                                    <ul class="breadcumb-list flex-five">
                                                                                        <li><a href="/FB_N1/home">Trang chủ</a></li>
                                                                                        <li><span>Đăng nhập </span></li>
                                                                                    </ul>
                                                                                    <img class="bcrumb-ab" src="./assets/images/page/mask-bcrumb.png" alt="">
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </section>

                                                                    <section class="login">
                                                                        <div class="tf-container">
                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <div class="login-wrap flex">
                                                                                        <div class="image">
                                                                                            <img src="./assets/images/page/sign-up.jpg" alt="image">
                                                                                        </div>
                                                                                        <div class="content">
                                                                                            <div class="inner-header-login">
                                                                                                <h3 class="title">Đăng nhập </h3>

                                                                                            </div>
                                                                                            <form action="${pageContext.request.contextPath}/dang-nhap" method="post" id="login" class="login-user">
                                                                                            <div class="row">
                                                                                                <div class="col-md-12">
                                                                                                    <div class="input-wrap">
                                                                                                        <label>Tên đăng nhập*</label>
                                                                                                        <input type="text" id ="username" name="username"   placeholder="Tên đăng nhập của bạn" autofocus> 
                                                                                                    </div>

                                                                                                </div>

                                                                                                <div class="col-lg-12">
                                                                                                    <div class="input-wrap">
                                                                                                        <div class="flex-two">
                                                                                                            <label>Mật khẩu*</label>

                                                                                                        </div>

                                                                                                        <input type="password" id="password"  name="password" placeholder="Mật Khẩu của bạn">
                                                                                                    </div>
                                                                                                    <a  style="font-family: DM Sans, sans-serif;;
                                                                                                        font-weight: 400;
                                                                                                        font-size: 16px;"  href ="javascript:void(0);" onclick="daoTT()" > <span>Hiển thị mật khẩu</span></a>

                                                                                                    <div id="loginError" class="text-danger mb-2" style="font-size: 14px;">
                                                                                                    </div>
                                                                                                    <c:if test="${error != null}">
                                                                                                        <div   class="text-danger mb-2" style="font-size: 14px;"> ${error} 
                                                                                                        </div>
                                                                                                    </c:if>

                                                                                                    <div class="form-group mb-2">

                                                                                                        <input type="checkbox" name="remember" class="custom-control-input" id="rememberCheck">
                                                                                                            <label class="custom-control-label mb-0" for="rememberCheck">Nhớ Mật Khẩu</label>
                                                                                                            <a href="${pageContext.request.contextPath}/xac-minh-doi-mat-khau"  class="mb-15 float-end">Quên mật khẩu?</a>
                                                                                                    </div>
                                                                                                    <div class="col-lg-12 mb-40">
                                                                                                        <div class="input-wrap-social ">
                                                                                                            <span class="or">or</span>
                                                                                                            <div class="flex-three">
                                                                                                                <a href="/FB_N1/google-auth" class="login-social flex-three">
                                                                                                                    <img src="./assets/images/page/gg.png" alt="image">
                                                                                                                        <span>Đăng nhập bằng Google</span>
                                                                                                                </a>

                                                                                                            </div>
                                                                                                            <br>
                                                                                                                <div class="g-recaptcha" data-sitekey="6LcquVMrAAAAAIJw3WB_NnA7uH2XN9_DLg_-Ygxj"></div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="col-lg-12 mb-30">
                                                                                                        <button type="submit" name ="submit_Btn" id="btndangnhap" onclick="checkLogin()" class="btn-submit">Đăng nhập</button>
                                                                                                    </div>

                                                                                                    <div class="col-md-12">
                                                                                                        <div class="flex-three">
                                                                                                            <span class="account">Bạn chưa có tài khoản ?</span>
                                                                                                            <a href="${pageContext.request.contextPath}/dang-ki" class="link-login">Đăng ký ngay</a>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>

                                                                                        </form>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </section>

                                                              

                                                            </main>

                                                            <jsp:include page ="footer.jsp"></jsp:include>

                                                            <!-- Bottom -->
                                                        </div>
                                                        <!-- /#page -->
                                                    </div>

                                                    <!-- Modal Popup Bid -->

                                                    <a id="scroll-top" class="button-go"></a>

                                                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                                                        <div class="offcanvas-header">
                                                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                                        </div>
                                                        <div class="offcanvas-body">
                                                            <div class="logo-canvas">
                                                                <img src="./assets/images/logo.png" alt="image">
                                                            </div>
                                                            <p class="des">The world’s first and largest digital market
                                                                for crypto collectibles and non-fungible
                                                            </p>
                                                            <ul class="canvas-info">
                                                                <li class="flex-three">
                                                                    <i class="icon-noun-mail-5780740-1"></i>
                                                                    <p>Info@webmail.com</p>
                                                                </li>
                                                                <li class="flex-three">
                                                                    <i class="icon-Group-9"></i>
                                                                    <p>684 555-0102 490</p>
                                                                </li>
                                                                <li class="flex-three">
                                                                    <i class="icon-Layer-19"></i>
                                                                    <p>6391 Elgin St. Celina, NYC 10299</p>
                                                                </li>
                                                            </ul>
                                                            <ul class="social flex-three">
                                                                <li>
                                                                    <a href="#">
                                                                        <i class="icon-icon-2"></i>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <i class="icon-x"></i>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <i class="icon-8"></i>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">
                                                                        <i class="icon-6"></i>
                                                                    </a>
                                                                </li>
                                                            </ul>

                                                        </div>
                                                    </div>

                                                    <!-- Javascript -->
                                                    <script src="https://www.google.com/recaptcha/api.js" async defer></script>


                                                    <script>

                                                                                                            document.addEventListener("DOMContentLoaded", () => {
                                                                                                                const form = document.getElementById("login");
                                                                                                                const errorDiv = document.getElementById("loginError");

                                                                                                                const usernameInput = document.getElementById("username");
                                                                                                                const passwordInput = document.getElementById("password");







                                                                                                                // Kiểm tra form phía client
                                                                                                                if (form) {
                                                                                                                    form.addEventListener("submit", function (event) {
                                                                                                                        const username = usernameInput.value.trim();
                                                                                                                        const password = passwordInput.value.trim();

                                                                                                                        if (!username || !password) {
                                                                                                                            event.preventDefault();
                                                                                                                            errorDiv.textContent = "Vui lòng nhập tên đăng nhập và mật khẩu.";
                                                                                                                        }
                                                                                                                    });
                                                                                                                }
                                                                                                            });


                                                                                                            // Ẩn/hiện mật khẩu
                                                                                                            function daoTT() {
                                                                                                                const mk = document.getElementById("password");
                                                                                                                if (mk) {
                                                                                                                    mk.type = (mk.type === "password") ? "text" : "password";
                                                                                                                }
                                                                                                            }
                                                    </script>


                                                    <script src="app/js/jquery.min.js"></script>
                                                    <script src="app/js/jquery.nice-select.min.js"></script>
                                                    <script src="app/js/bootstrap.min.js"></script>
                                                    <script src="app/js/swiper-bundle.min.js"></script>
                                                    <script src="app/js/swiper.js"></script>
                                                    <script src="app/js/plugin.js"></script>
                                                    <script src="app/js/jquery.fancybox.js"></script>
                                                    <script src="app/js/shortcodes.js"></script>
                                                    <script src="app/js/main.js"></script>

                                                </body>

                                                </html>