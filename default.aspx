<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="./files/logo32.png" style="width: 32px; height: 32px">
        <title>CÔNG TY CỔ PHẦN CÔNG NGHỆ SỐ HMD VIỆT NAM</title>
        <link href="./files/main.css" rel="stylesheet">
        <link href="./files/responsive.css" rel="stylesheet">
        <!-- Bootrap -->

        <link href="./files/bootstrap.min.css" rel="stylesheet">
        <!-- Icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css">
        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="">
        <script src="./files/Common.js.download"></script>
        <link href="./files/css2" rel="stylesheet">
        <!-- Owl -->
        <link href="./files/owl.carousel.min.css" rel="stylesheet">
        <link href="./files/owl.theme.default.min.css" rel="stylesheet">
        <link href="./files/jquery.gritter.min.css" rel="stylesheet">
        <link href="./files/gritter-ace.min.css" rel="stylesheet">

        <style>
            .ButtonSearch {
                position: relative;
                float: left;
            }

                .ButtonSearch > .form-control {
                    position: absolute;
                    right: 50px;
                    height: 32px;
                    border-radius: 0;
                    padding: 10px 15px;
                    background: #eaeaea;
                    border: 0;
                    width: 0;
                    -webkit-transition: width 1.5s;
                    transition: width 1.5s;
                    z-index: -2;
                    opacity: 0;
                }

                    .ButtonSearch > .form-control > input {
                        width: 100%;
                        height: 32px;
                        font-style: italic;
                        border: 0;
                        border-radius: 0;
                        background: #eaeaea;
                        font-family: Roboto-Medium;
                        box-shadow: none;
                        top: -21px;
                        float: left;
                        margin-top: -10px;
                    }

                .ButtonSearch #keyword {
                    /*background-image: url(https://tnue.edu.vn/Data/Sites/1/skins/framework/images/iconsearch.png);
                background-repeat: no-repeat;
                background-position: center;*/
                    /*        padding: 10px 25px;
                height: 52px;
                background-color: #014b85;
                border: none;
                border-radius: 0;
                box-shadow: none;*/
                }

            #search-header {
                position: absolute;
                width: 50px;
                cursor: pointer;
                height: 52px;
                top: 0;
            }

            .hienthi {
                width: 300px !important;
                opacity: 1 !important;
                z-index: 99 !important;
                transition: all .5s linear !important;
            }
        </style>
    </head>
    <body class="" style="">

        <!-- Header -->
        <div class="header fixed-top bg-white" style="">
            <div class="header_top">
                <div class="header_top-box container d-lg-flex d-sm-block text-sm-center">
                    <h2 class="header_top-box_title header_top-box_title_mobile">CÔNG TY CỔ PHẦN CÔNG NGHỆ SỐ HMD VIỆT NAM</h2>
                    <div class="header_top-right pb-sm-1">
                        <div class="ButtonSearch">
                            <div class="form-control">
                                <input type="text" id="search_text" class="form-control search_text" placeholder="Nhập từ khóa">
                            </div>
                            <button type="button" class="header_top-right-find" name="keyword" id="keyword">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                            <div id="search-header">
                            </div>
                        </div>



                        <a class="header_top-right-pen" href="./AccountAdmin/RegisterBaoChi">
                            <i class="fa-sharp fa-solid fa-pencil"></i>
                            <span>Đăng ký</span>
                        </a>
                        <span class="header_top-right-space">|</span>
                        <button class="header_top-right-user btn-login" id="model_login" type="button" data-toggle="modal" data-target="#exampleModalCenter">
                            <i class="fa-solid fa-user-large"></i>
                            <span><a href="javascript:void(0)" onclick="CreateAction(&#39;/AccountAdmin/LoginBaoChi&#39;)">Đăng nhập</a></span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="header_bot">
                <div class="container">

                    <div class="header_bot-box row d-flex">
                        <div class="col-md-3 col-sm-9 header_bot-box-left">
                            <a href="./default.aspx">
                                <img src="./files/logo32.png" class="header_logo header_logo_mobile" alt="">
                            </a>
                        </div>
                        <div class="col-md-9 col-sm-3 header_bot-box-right d-sm-flex justify-content-sm-end">

                            <nav class="navbar navbar-expand-lg navbar-light" id="navbar_menu">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarnav" aria-controls="navbarnav" aria-expanded="false" aria-label="toggle navigation" style="">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse menu-mobile" id="navbarnav">
                                    <button class="navbar-toggler menu-close" type="button" data-toggle="collapse" data-target="#navbarnav" aria-controls="navbarnav" aria-expanded="false" aria-label="toggle navigation" style="">
                                        <span>X</span>
                                    </button>


                                    <ul class="navbar-nav menu">
                                        <li class="nav-item ">
                                            <a class="nav-link is_active" href="./default.aspx">Trang chủ </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="./about.html">Giới thiệu</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="./tintuc.aspx">Tin tức sự kiện</a>
                                        </li>
                                        <li class="nav-item menu-item">
                                            <a class="nav-link" href="./?AspxAutoDetectCookieSupport=1#">Xếp hạng &nbsp;<i class="fas fa-angle-down" style="font-size: 16px;"></i></a>
                                            <ul class="drop-menu">
                                                <li class="nav-item drop-menu-item">
                                                    <a class="nav-link" href="./gioi-thieu-bcs">Giới thiệu bộ chỉ số</a>
                                                </li>
                                                <li class="nav-item drop-menu-item">
                                                    <a class="nav-link" href="javascript:void(0)" onclick="CreateAction(&#39;/AccountAdmin/LoginBaoChi&#39;)">Công cụ đánh giá</a>
                                                </li>
                                                <!-- <li class="nav-item drop-menu-item"> -->
                                                <!-- <a class="nav-link" href="/Tài liệu HDSD.pdf" target="__blank">Hướng dẫn sử dụng</a> -->
                                                <!-- </li> -->
                                                <!-- <li class="nav-item drop-menu-item"> -->
                                                <!-- <a class="nav-link" href="/Bản mô tả, hướng dẫn cách tính điểm.pdf" target="__blank">Hướng dẫn cách tính điểm</a> -->
                                                <!-- </li> -->
                                                <li class="nav-item drop-menu-item">
                                                    <a class="nav-link" href="./xep-hang">Xếp hạng</a>
                                                </li>

                                            </ul>
                                        </li>

                                        <li class="nav-item menu-item">
                                            <a class="nav-link" href="./?AspxAutoDetectCookieSupport=1#">Hoạt động hỗ trợ  &nbsp;<i class="fas fa-angle-down" style="font-size: 16px;"></i></a>
                                            <ul class="drop-menu" style="width: 262px; height: 270px;">
                                                <li class="nav-item drop-menu-item">
                                                    <a class="nav-link" href="./hoi-thao">Hội thảo, diễn đàn</a>
                                                </li>
                                                <li class="nav-item drop-menu-item">
                                                    <a class="nav-link" href="./mo-hinh-cds">Đào tạo, tập huấn</a>
                                                    <!-- <a class="nav-link" href="/dao-tao-tap-huan">Đào tạo, tập huấn</a> -->
                                                </li>
                                                <li class="nav-item drop-menu-item">
                                                    <a class="nav-link" href="./Ha-tang-nen-tang-so">Hạ tầng, nền tảng số</a>
                                                </li>
                                                <li class="nav-item drop-menu-item">
                                                    <a class="nav-link" href="./an-toan-thong-tin">An toàn thông tin</a>
                                                </li>
                                                <li class="nav-item drop-menu-item">
                                                    <a class="nav-link" href="./mo-hinh-cds">Mô hình CĐS thành công</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item menu-item">
                                            <a class="nav-link" href="./doanh-nghiep-cong-nghe">Đồng hành </a>

                                        </li>
                                        <li class="nav-item nav-item-p-0">
                                            <a class="nav-link" href="./lien-he">Liên hệ</a>
                                        </li>
                                        <li class="nav-item ">
                                            <a class="nav-link login_nav" href="javascript:void(0)" onclick="CreateAction(&#39;/AccountAdmin/LoginBaoChi&#39;)">Đăng nhập</a>
                                        </li>
                                        <li class="nav-item nav-item-p-0">
                                            <a class="nav-link login_nav" href="./AccountAdmin/RegisterBaoChi">Đăng ký</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="content-body">

            <div class="header_img-bg">

                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" style="height: 100%">
                        <div class="carousel-item active " style="height: 100%">
                            <img class="d-block w-100" style="height: 100%" src="./files/hom-bg.jpg" alt="banner1">
                        </div>


                    </div>
                    <a class="carousel-control-prev" href="./?AspxAutoDetectCookieSupport=1#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="./?AspxAutoDetectCookieSupport=1#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="header_img-bot">
                <div class="header_img-main">
                    <div class="header_img-bot-box container">
                        <div class="row w-100 d-lg-flex justify-content-center align-items-center">
                            <div class="col-lg-3 col-md-4 col-sm-6 header_img-bot-title-list text-center">
                                <div class="header-img">
                                    <img src="./files/content_1_2.png">
                                    <div class="henit-border"></div>
                                </div>
                                <div class="hinet-text d-flex justify-content-center align-items-center">
                                    <h1 class="header_img-bot-title-list-left">268</h1>
                                    <div class="header_img-bot-title-list-right">
                                        <p class="header_img-bot-title-list-right-1">Bài toán</p>
                                        <p class="header_img-bot-title-list-right-2">
                                            Được giải quyết
                           
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 header_img-bot-title-list text-center">
                                <div class="header-img">
                                    <img src="./files/content_1_3.png">
                                    <div class="henit-border"></div>
                                </div>
                                <div class="hinet-text d-flex justify-content-center align-items-center">
                                    <h1 class="header_img-bot-title-list-left">120</h1>
                                    <div class="header_img-bot-title-list-right">
                                        <p class="header_img-bot-title-list-right-1">Đơn vị</p>
                                        <p class="header_img-bot-title-list-right-2">
                                            Đăng ký tài khoản
                           
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 header_img-bot-title-list text-center">
                                <div class="header-img">
                                    <img src="./files/content_1_4.png">
                                    <div class="henit-border"></div>
                                </div>
                                <div class="hinet-text d-flex justify-content-center align-items-center">
                                    <h1 class="header_img-bot-title-list-left">115</h1>
                                    <div class="header_img-bot-title-list-right">
                                        <p class="header_img-bot-title-list-right-1">Đơn vị</p>
                                        <p class="header_img-bot-title-list-right-2">
                                            Đã thực hiện đánh giá
                           
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 header_img-bot-title-list header-icon-end text-center">
                                <div class="header-img">
                                    <img src="./files/content_1_1.png">
                                </div>
                                <div class="hinet-text d-flex justify-content-center align-items-center">
                                    <h1 class="header_img-bot-title-list-left">90</h1>
                                    <div class="header_img-bot-title-list-right">
                                        <p class="header_img-bot-title-list-right-1">Đơn vị</p>
                                        <p class="header_img-bot-title-list-right-2">
                                            Được thẩm định
                           
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container">
                <!-- content 1 -->
                <div class="row content_2">
                    <div class="col-md-7 content_right">

                        <img class="content_2-img-right" src="<%=curentTour.ImgUrl%>" alt="">


                        <div class="content_2-top">
                            <a class="titleblue" href="<%=curentTour.PostUrl%>">
                                <h2 class="content_2-top-title catchuoi2dong"><%=curentTour.Title %>
                                </h2>
                                <div class="content_2-top-description blacktitle cssnone">
                                    <p><%=curentTour.Conclude %></p>

                                </div>

                            </a>
                        </div>
                    </div>
                    <div class="col-md-5 content-left">
                        <% foreach (var item in otherTours)
                           { %>
                        <div class="content_2-mid content_2-mid1">

                            <div class="col-md-4 img-responsive p-0 h-100">
                                <a class="titleblue content_2-mid-img" href="<%=item.PostUrl%>">
                                    <img class="content_2-right-bot" src="<%= item.ImgUrl %>" alt="">
                                </a>
                            </div>
                            <div class="col-md-8 padding-0">
                                <a class="blacktitle" href="<%=item.PostUrl%>">
                                    <h3 class="content_2-mid-title titleblue catchuoi2dong content_text_title"><%= item.Title %>
                                    </h3>

                                </a>
                            </div>

                        </div>

                        <% } %>
                    </div>



                </div>
            </div>


            <div class="content_3">
                <img class="content_3-img" src="./files/content_2.png" alt="">
                <div class="content_3-box container">
                    <div class="content_3-box-title cssfooter">
                        <p></p>
                    </div>
                    <div class="content_3-box-list row">
                        <div class="content_3-list-item">
                            <div class="content_3-list-item-box">
                                <div class="content_3-img-icon">
                                    <img class="content_3-list-item-img" src="./files/sua_1.png">
                                </div>
                                <div class="content_3-title">
                                    <p class="content_3-list-item-des"></p>
                                </div>
                            </div>
                        </div>
                        <div class="content_3-list-item">
                            <div class="content_3-list-item-box">
                                <div class="content_3-img-icon">
                                    <img class="content_3-list-item-img" src="./files/sua_2.png">
                                </div>
                                <div class="content_3-title">
                                    <p class="content_3-list-item-des">
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="content_3-list-item">
                            <div class="content_3-list-item-box">
                                <div class="content_3-img-icon">
                                    <img class="content_3-list-item-img" src="./files/sua_3.png">
                                </div>
                                <div class="content_3-title">
                                    <p class="content_3-list-item-des"></p>
                                </div>
                            </div>
                        </div>
                        <div class="content_3-list-item">
                            <div class="content_3-list-item-box">
                                <div class="content_3-img-icon">
                                    <img class="content_3-list-item-img" src="./files/sua_4.png">
                                </div>
                                <div class="content_3-title">
                                    <p class="content_3-list-item-des"></p>
                                </div>
                            </div>
                        </div>
                        <div class="content_3-list-item">
                            <div class="content_3-list-item-box">
                                <div class="content_3-img-icon">
                                    <img class="content_3-list-item-img" src="./files/sua_5.png">
                                </div>
                                <div class="content_3-title">
                                    <p class="content_3-list-item-des"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container content_4">
                <div class="content_4-box">
                    <p>CÁC DỊCH VỤ</p>
                </div>
                <div class="content_4-box-bot">
                    <div class="row content_4-box-bot-firstx">

                        <div class="col-lg-4 col-md-6 col-sm-12 d-flex content_4-padding">

                            <a class="titleblue" href="./?AspxAutoDetectCookieSupport=1#">

                                <div class="content_4-bot-title">
                                    <div class="content_4-bot-img">
                                        <a class="blacktitle" href="./?AspxAutoDetectCookieSupport=1#">
                                            <img class="content_2-img-right" src="./files/AI-Smart-warning-e1605540195573.png" alt="Image" />

                                        </a>
                                    </div>

                                    <p class="content_4-bot-title-top titleblue">
                                        Nhóm sản phẩm AI nhận diện hành động (sản phẩm AI Smart Warning)
                                    </p>
                                    <p class="content_4-bot-title-bot">
                                        được xây dựng trên nền tảng trí thông minh nhân tạo (AI), cho phép tự động nhận diện những hành động của con người thông qua camera như: hành động đánh nhau...
                                    </p>
                                </div>
                            </a>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 d-flex content_4-padding">

                            <a class="titleblue" href="./?AspxAutoDetectCookieSupport=1#">
                               
                                 <div class="content_4-bot-title">
                                    <div class="content_4-bot-img">
                                        <a class="blacktitle" href="./?AspxAutoDetectCookieSupport=1#">
                                            <img class="content_2-img-right" src="./files/inlad.png" alt="Image" />

                                        </a>
                                    </div>

                                    <p class="content_4-bot-title-top titleblue">
                                        Nhóm sản phẩm hỗ trợ công việc dán nhãn dữ liệu, cung cấp dịch vụ dán nhãn và cung cấp dịch vụ gói dữ liệu chuẩn để huấn luyện AI (Công ty cổ phần Inlab).
                                    </p>
                                    <p class="content_4-bot-title-bot">
                                        Nền tảng nguồn lực cộng đồng (Crowd Sourcing) là nền tảng hỗ trợ các cá nhân, tổ chức, doanh nghiệp hoàn thành công việc, nhiệm vụ bằng cách cộng tác với lực lượng lao động bên ngoài (ví dụ: dán nhãn dữ liệu, xác thực thông tin, khảo sát nhanh, ...)
                                    </p>
                                </div>
                            </a>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 d-flex content_4-padding">

                            <a class="titleblue" href="./?AspxAutoDetectCookieSupport=1#">
                               
                                 <div class="content_4-bot-title">
                                    <div class="content_4-bot-img">
                                        <a class="blacktitle" href="./?AspxAutoDetectCookieSupport=1#">
                                            <!-- <a class="blacktitle" href="/tin-tuc/TOASOANHOITU"> -->
                                            <img class="content_2-img-right" src="./files/tranformationTraning.png" alt="Image" />
                                        </a>
                                    </div>
                                    <p class="content_4-bot-title-top titleblue">
                                        Phần mềm nền tảng đào tạo Digital Transformation Training
                                    </p>
                                    <p class="content_4-bot-title-bot">
                                        Phần mềm nền tảng đào tạo Digital Transformation Training
                                    </p>
                                </div>
                            </a>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12 d-flex content_4-padding">

                            <a class="titleblue" href="./?AspxAutoDetectCookieSupport=1#">
                              
                                 <div class="content_4-bot-title">
                                    <div class="content_4-bot-img">
                                        <a class="blacktitle" href="./?AspxAutoDetectCookieSupport=1#">
                                            <!-- <a class="blacktitle" href="/tin-tuc/TOASOANHOITU"> -->
                                            <img class="content_2-img-right" src="./files/AI-Medical-Assistant.png" alt="Image" />
                                        </a>
                                    </div>
                                    <p class="content_4-bot-title-top titleblue">
                                        Giải pháp "Trợ lý y tế bằng công nghệ AI"
                                    </p>
                                    <p class="content_4-bot-title-bot">
                                        Giải pháp "Trợ lý y tế bằng công nghệ AI"
                                    </p>
                                </div>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
            <!-- content 7 -->
            <div class="content_7">
                <div class="content_7-main container">
                    <div class="content_7-main-box">
                        <div class="content_7-img">
                            <img src="./files/content_6.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <!-- content 8 -->

            <!-- Footer -->
            <div class="footer">
                <div class="footer_top">
                    <div class="container footer_top-main">
                        <div class="footer_top-list d-flex">
                            <div class="container fix-p-0">
                                <div class="owl-carousel owl-theme owl-loaded owl-drag">




                                    <div class="owl-stage-outer">
                                        <div class="owl-stage" style="transform: translate3d(-1140px, 0px, 0px); transition: all 0s ease 0s; width: 3420px;">
                                            <% foreach (var item in otherTours)
                                               { %>
                                            <div class="owl-item cloned" style="width: 255px; margin-right: 30px;">
                                                <div class="footer_top-item ">
                                                    <div class="footer_top-item">
                                                        <a href="./bo-sach-cam-nang-ve-chuyen-doi-so-31403.html">
                                                            <img src="<%= item.ImgUrl %>" alt="">
                                                        </a>

                                                    </div>
                                                    <a href="./bo-sach-cam-nang-ve-chuyen-doi-so-31403.html">
                                                        <p class="footer_top-des"><%= item.Title %></p>
                                                    </a>
                                                </div>
                                            </div>


                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="owl-nav disabled">
                                        <button type="button" role="presentation" class="owl-prev">
                                            <div class="nav-button owl-prev">‹</div>
                                        </button>
                                        <button type="button" role="presentation" class="owl-next">
                                            <div class="nav-button owl-next">›</div>
                                        </button>
                                    </div>
                                    <div class="owl-dots disabled">
                                        <button role="button" class="owl-dot active"><span></span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <style type="text/css">
                .login-bdi .modal-header {
                    padding: 15px;
                    border-bottom: 1px solid #ff6a00;
                    min-height: 16.43px;
                    background: #ff6a00;
                }

                .login-bdi .tieude-login {
                    color: white;
                    font-family: HelBold;
                    font-size: 22px;
                    text-transform: uppercase;
                    text-align: center;
                }

                #LoginBtn, #SignUpBtn {
                    margin-top: 15px;
                }

                .forget-password {
                    font-size: 12px;
                    color: #ff6a00;
                    text-decoration: underline;
                }

                .signup {
                    font-size: 14px;
                    text-decoration: underline;
                }
            </style>
            <div class="modal fade login-bdi" data-backdrop="static" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" onclick="CloseModal()" aria-label="Close">×</button>
                            <h4 class="modal-title text-center tieude-login" id="exampleModalLabel" style="">Đăng nhập
                            </h4>
                        </div>

                        <div class="modal-body">
                            <form action="./AccountAdmin/PopupLogin" class="session form-horizontal" data-ajax="true" data-ajax-begin="LoginFrontEndBegin" data-ajax-failure="AjaxFormError" data-ajax-method="POST" data-ajax-success="LoginFrontEndSuccess" id="FormLogin" method="post">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="UserName">Tên đăng nhập</label>
                                    <div class="col-md-8 input-login">
                                        <input class="form-control" data-val="true" data-val-maxlength="Độ dài tối đa là 50 ký tự" data-val-maxlength-max="50" data-val-minlength="Độ dài tối thiểu là 3 ký tự" data-val-minlength-min="3" data-val-requiredextend="Vui lòng nhập Tên đăng nhập" id="UserName" name="UserName" type="text" value="">
                                        <span class="field-validation-valid text-danger" data-valmsg-for="UserName" data-valmsg-replace="true"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="Password">Mật khẩu</label>
                                    <div class="col-md-8 input-login">
                                        <input class="form-control" data-val="true" data-val-requiredextend="Vui lòng nhập Mật khẩu" id="Password" name="Password" type="password">
                                        <span class="field-validation-valid text-danger" data-valmsg-for="Password" data-valmsg-replace="true"></span>
                                    </div>
                                </div>
                                <div class="form-group" id="div_error">
                                </div>
                                <div class="form-group" id="div_sucss">
                                </div>
                                <center>
                        <button type="submit" class="btn btn-success" id="LoginBtn">
                            <i class="fa fa-sign-in static-sign-in"></i>
                            <i class="fa fa-spinner fa-spin spin-sign-in hide"></i>&nbsp;Đăng nhập
                        </button>

                        <div class="form-group">
                            <small>
                                <a href="./quen-mat-khau" class="forget-password" title="Quên mật khẩu">
                                    Quên mật khẩu
                                </a>
                            </small>
                        </div>

                        <div class="form-group">
                            <small>
                                <a href="./dang-ky" class="signup" title="Đăng ký">
                                    Chưa có tài khoản? Đăng ký tại đây!
                                </a>
                            </small>
                        </div>

                    </center>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <style>
                #div_error {
                    margin: 0;
                    color: red;
                    font-size: 14px;
                }

                #div_sucss {
                    margin: 0;
                    color: olivedrab;
                    font-size: 14px;
                }
            </style>
            <script>
                function CloseModal() {
                    $("#login").addClass("hide");
                    $("#div_error").html("");
                    $('.modal-backdrop').remove();
                    $('body').removeClass("modal-open");
                }



                var onToggleBtnLogin = function (isLogin) {
                    var eleButtonLogin = $('#LoginBtn');
                    if (isLogin) {
                        eleButtonLogin.attr('disabled', 'disabled');
                        eleButtonLogin.find('.static-sign-in').addClass('hide');
                        eleButtonLogin.find('.spin-sign-in').removeClass('hide');
                    } else {
                        eleButtonLogin.removeAttr('disabled');
                        eleButtonLogin.find('.static-sign-in').removeClass('hide');
                        eleButtonLogin.find('.spin-sign-in').addClass('hide');
                    }
                }

                var LoginFrontEndBegin = function () {
                    onToggleBtnLogin(true);
                }

                var LoginFrontEndSuccess = function (result) {
                    if (result.Status) {
                        NotiSuccess('Thành công', 'Đăng nhập thành công');
                        setTimeout(function () {
                            location.href = '/DashboardArea/Dashboard';
                        }, 1500)
                    } else {
                        onToggleBtnLogin(false);
                        $("#div_error").html(result.Message);
                    }
                }

            </script>



            <!-- .egovenz-content -->
            <div id="MasterModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" style="display: none;" aria-hidden="true"></div>
        </div>
        <div class="footer_end">
            <div class="footer_bot">

                <p style="text-align: center"><span style="font-size: 16px"><strong>CÔNG TY CỔ PHẦN CÔNG NGHỆ SỐ HMD VIỆT NAM</strong></span></p>

                <p style="text-align: center"></p>

                <p style="text-align: center"><strong>Trụ sở chính: </strong>Tòa nhà N09B2 - Khu đô thị mới Dịch Vọng, quận Cầu Giấy - TP Hà Nội</p>

                <p style="text-align: center"><strong>Điện thoại:</strong> +8436662675. <strong>Email:</strong> HMDTechnology@gmail.com</p>

                <p style="text-align: center"></p>
            </div>
            <style>
                .footer_bot {
                    color: #fff;
                    background-color: #0a71ef;
                    padding-top: 25px;
                }

                    .footer_bot table tbody tr td {
                        padding: 1px 13px;
                    }
            </style>
        </div>


        <script src="./files/Jquery.min.js.download"></script>
        <script src="./files/Common.js(1).download"></script>
        <script src="./files/owl.carousel.min.js.download"></script>
        <script src="./files/popper.min.js.download"></script>
        <script src="./files/poper.min.js.download"></script>
        <script src="./files/bootstrap.min.js.download"></script>
        <script src="./files/jquery.bootstrap-duallistbox.min.js.download"></script>
        <script src="./files/responsiveCarousel.min.js.download"></script>
        <script src="./files/scrollreveal.js.download"></script>
        <script src="./files/wow.js.download"></script>
        <script src="./files/owl.carousel.js.download"></script>
        <script src="./files/autoNumeric.js.download"></script>
        <script src="./files/jquery.gritter.min.js.download"></script>
        <script src="./files/jquery.unobtrusive-ajax.min.js.download"></script>
        <script src="./files/script.js.download"></script>
        <script src="./files/Common.js.download"></script>
        <script src="./files/jquery-confirm.js.download"></script>
        <script>
            $(document).ready(function () {
                $(".owl-carousel").owlCarousel({
                    loop: true,
                    margin: 30,
                    nav: true,
                    dots: true,
                    // autoplay:true,
                    // autoplayTimeout: 3000,
                    // autoplaySpeed: 2000,
                    navText: ["<div class='nav-button owl-prev'>‹</div>", "<div class='nav-button owl-next'>›</div>"],
                    responsive: {
                        0: {
                            items: 1,
                        },
                        425: {
                            items: 2,
                        },
                        600: {
                            items: 3,
                        },
                        1000: {
                            items: 5,
                        },
                        1024: {
                            items: 4,
                        }
                    },
                });
            })

            var LoginFrontEndSuccess = function (result) {

                if (result.Status) {

                    setTimeout(function () {
                        location.href = '/DashboardArea/Dashboard';
                        NotiSuccess('Thành công', 'Đăng nhập thành công');
                    }, 0)
                } else {
                    onToggleBtnLogin(false);
                    $("#div_error").html(result.Message);
                }
            };



            $(document).ready(function () {
                $(".navbar-nav li a").each(function (item, idex) {
                    var current = $(this);

                    var val = current.attr("href");
                    console.log(location.pathname)
                    if (val == location.pathname) {
                        current.addClass("is_active");
                        if (current.parent().hasClass("drop-menu-item")) {
                            current.parent().parent().parent().find("> .nav-link").addClass("is_active");
                        }
                    }
                })

                $(".nav-link").click(function () {

                    var val = $(".nav-link").attr("href");

                    // Clear các thẻ li có Class click cũ
                    console.log(val);
                    // Thêm Class
                    if (val == location.pathname) {
                        $(this).addClass("is_active");

                    } else {
                        $(".nav-link").removeClass("is_active");
                    }

                });
            });
            $(document).on("click", "#search-header", function () {

                $(".ButtonSearch > .form-control").toggleClass("hienthi");
            })




            $('#search_text').keypress(function (event) {
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if (keycode == '13') {
                    window.location.href = "/home/search?keyword=" + $(this).val();

                }
            });




        </script>





    </body>
</asp:Content>
