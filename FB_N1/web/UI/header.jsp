<%--
    Created on : May 30, 2025, 8:15:12 AM
    Author     : Đỗ Tuấn Anh
--%>

<%@page import="model.UserProfile"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <!-- comment -->
    <base href="${pageContext.request.contextPath}/UI/">
    <!-- comment -->
    <link rel="shortcut icon" href="assets/images/logoKoChu.png">
    <link rel="apple-touch-icon-precomposed" href="assets/images/logoKoChu.png">
</head>

<!-- Main Header -->
<header class="main-header flex">
    <!-- Header Lower -->
    <div id="header">
        <jsp:include page="toast.jsp" />
        <jsp:include page="sweetalert-include.jsp" />
        <script src="${pageContext.request.contextPath}/UI/app/js/userNoti-socket.js"></script>
        <%
            Account acc = (Account) session.getAttribute("account");
            int accountId = acc != null ? acc.getAccountId() : 0;
            int roleId = acc != null && acc.getUserProfile() != null ? acc.getUserProfile().getRoleId() : 0;
        %>
        <script>
            const accountId = <%= accountId%>;
            const roleId = <%= roleId%>;
            connectUserNotiSocket(accountId, roleId);
        </script>

        <div class="header-lower">
            <div class="tf-container full">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-container flex justify-space align-center">
                            <!-- Logo Box -->
                            <div class="mobile-nav-toggler mobie-mt mobile-button">
                                <i class="icon-Vector3"></i>
                            </div>
                            <div class="logo-box">
                                <div class="logo">
                                    <a href="/FB_N1/home">
                                        <img src="assets/images/logo22.png" alt="Logo">
                                    </a>
                                </div>
                            </div>
                            <div class="nav-outer flex align-center">
                                <!-- Main Menu -->
                                <nav class="main-menu show navbar-expand-md">
                                    <div class="navbar-collapse collapse clearfix" id="navbarSupportedContent">
                                        <ul class="navigation clearfix">
                                            <li><a href="/FB_N1/cua-hang">Cửa Hàng</a></li>
                                            <li><a href="/FB_N1/Danh-Sach-San">Danh sách sân</a></li>

                                            <li class="dropdown2 "><a href="/FB_N1/blog">Diễn Đàn</a>
                                                <ul>
                                                    <li><a href="/FB_N1/bai-viet">Diễn Đàn Tìm Đối Thủ</a></li>
                                                    <li><a href="/FB_N1/bai-dang">Diễn Đàn Tin Tức</a></li>
                                                </ul>
                                                <div class="dropdown2-btn"></div></li>



                                            <li><a href="/FB_N1/UI/lienHe.jsp">Liên Hệ</a></li>


                                            <c:if test="${sessionScope.account.userProfile.roleId == 1 || sessionScope.account.userProfile.roleId == 2 }">
                                                <li><a href="/FB_N1/admin/dat-san"
                                                       style="position: fixed; top: 70px; right: 20px;
                                                       background-color: #4da528; color: white;
                                                       padding: 10px 16px; border-radius: 8px;
                                                       text-decoration: none; font-weight: 500;
                                                       box-shadow: 0 2px 5px rgba(0,0,0,0.2);">
                                                        ️ Bảng điều khiển của Quản trị viên
                                                    </a></li>

                                            </c:if>
                                            <c:if test="${sessionScope.account != null}">

                                                <li class="dropdown2"
                                                    style="position: fixed; top: 20px; right: 20px; z-index: 1000;">

                                                    <a href="#" style="display: flex; align-items: center; gap: 8px; padding: 6px 12px;
                                                       background-color: #4da528; border-radius: 20px; text-decoration: none;
                                                       color: white; font-weight: 500;">
                                                        <img src="${sessionScope.userProfile.avatar}"
                                                             style="width: 30px; height: 30px; border-radius: 50%; object-fit: cover;">
                                                        ${sessionScope.account.userProfile.firstName} ${sessionScope.account.userProfile.lastName}
                                                    </a>

                                                    <ul>
                                                        <li><a href="/FB_N1/ho-so-nguoi-dung"><i class="icon-user"></i> Trang cá nhân</a></li>
                                                            <c:if test="${sessionScope.account.userProfile.roleId == 3}">
                                                            <li><a href="/FB_N1/quan-ly-bai-viet-nguoi-dung"><i class="icon-Group-81"></i> Bài Viết</a></li>
                                                            </c:if>
                                                        <li><a href="/FB_N1/lich-su-dat-san"><i class="icon-day"></i> Lịch sử đặt sân của tôi</a></li>
                                                        <li>
                                                            <a href="${pageContext.request.contextPath}/logout" class="me-3">
                                                                <i class="icon-turn-off-1"></i> Đăng Xuất
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </c:if>






                                        </ul>

                                    </div>
                                </nav>
                                <!-- Main Menu End-->
                            </div>



                            <div class="dropdown2-btn"></div></li>





                            <a   style="margin: 20px">

                            </a>


                            <c:if test="${sessionScope.account == null}">
                                <div class="header-account flex align-center">
                                    <div class="register">
                                        <ul class="flex align-center">
                                            <li class="">
                                                <a href="${pageContext.request.contextPath}/dang-nhap">Đăng nhập<i class="icon-user-1-1"></i>
                                                    <span></span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="register">
                                        <ul class="flex align-center">
                                            <li class="">
                                                <span> <a href="${pageContext.request.contextPath}/dang-ki"><i class="icon-user-1-1"></i>
                                                    Đăng kí</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>

        </div><div style="height: 184px; display: none;"></div>
    </div>

    <!-- End Header Lower -->


    <!-- Mobile Menu  -->
    <div class="close-btn"><span class="icon flaticon-cancel-1"></span></div>
    <div class="mobile-menu">
        <div class="menu-backdrop"></div>
        <nav class="menu-box">
            <div class="nav-logo"><a href="/FB_N1/home">
                    <img src="assets/images/logo22.png" alt="">FootballStar</a></div>
            <div class="bottom-canvas">
                <div class="menu-outer">

                    <div class="navbar-collapse collapse clearfix" id="navbarSupportedContent">

                        <li class="dropdown2">
                            <a href="#">Home</a>

                    </div>
                </div>
            </div>
        </nav>
    </div>
    <!-- End Mobile Menu -->

</header>
<!-- End Main Header -->
