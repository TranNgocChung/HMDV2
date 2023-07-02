<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tintuc.aspx.cs" Inherits="WebApplication3.tintuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./files/logo32.png" style="width: 32px; height: 32px" >
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
                <h2 class="header_top-box-title">CÔNG TY CỔ PHẦN CÔNG NGHỆ SỐ HMD VIỆT NAM</h2>
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
                            <img src="./files/logo32.png" class="header_logo header_logo_mobile"  alt="">
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
        <style>
    .content-body {
        background: #fff;
    }
</style>
        <div class="container nopd dsTinTuc">
            <div style="margin-top: 20px" class="title-top"><span class="nd-cha"><a href="./">Trang chủ /</a> </span><span class="nd-con">Tin tức</span></div>
            <div class="row">
                <div class="col-lg-8 col-md-12 col-sm-12 tintuc-left">
                    <div id="boxResultCOntent">

<%--                        <div class="bot-blog" style="width: 100%; float: left">
                              <% foreach (var item in otherTours)
                           { %>
                            <div class="item item-news">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <div class="image">
                                            <a href="<%=item.PostUrl%>" title="<%= item.Title %>">
                                                <figure class="sixteen-nine-img">
                                                    <img src="<%= item.ImgUrl %>" width="100%" alt="<%= item.Title %>">
                                                </figure>

                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-sm-7">
                                        <div class="content">
                                            <h3>
                                                <a href="<%=item.PostUrl%>" title="<%= item.Title %>"><%= item.Title %></a>
                                            </h3>
                                            <div class="dong-5-an">
                                                <p><%= item.Conclude %></p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                            
                            <div class="wrapper">
                                <ul class="pager">
                                    <li class="pager__item"><a href="javascript:void(0)" onclick="GetDataResult(1)" class="pager__link">Trang đầu</a></li>
                                    <li class=" pager__item active"><a href="javascript:void(0)" class="pager__link">1</a></li>
                                    <li class="pager__item"><a href="javascript:void(0)" class="pager__link" onclick="GetDataResult(1)">Trang cuối </a></li>
                                </ul>
                            </div>

                        </div>--%>

                    </div>
                </div>


                <div class="col-lg-4 col-md-12 col-sm-12 tintuc-right">

                    <div class="content_tin-right">
                        <img src="./files/content_4.png" alt="">
                        <div class="content_tin-right-box text-content-right">
                            <p>ĐÁNH GIÁ CHUYỂN ĐỔI SỐ</p>
                            <button class="content_tin-right-btn">
                                <a style="color: white" href="javascript:void(0)" onclick="CreateAction(&#39;/AccountAdmin/LoginBaoChi&#39;)">

                                    <span>THỰC HIỆN ĐÁNH GIÁ</span>
                                </a>

                            </button>
                        </div>
                    </div>

                    <div class="right">
                        <div class="blog-hot">
                            <h2>Danh sách nền tảng số</h2>

                        </div>

                    </div>
                    <div class="content_4-box-bot" style="text-align: justify">
                        <div class="content_4-box-bot-first">
                            <div class="d-flex content_4-padding">
                                <div class="content_4-bot-img col-3">
                                    <a class="blacktitle" href="./tin-tuc/TOASOANHOITU">
                                        <img src="./files/content_3-1.png" alt="">
                                    </a>
                                </div>
                                <div class="col-9 no-padding-left">
                                    <a class="blacktitle" href="./tin-tuc/TOASOANHOITU">
                                        <div>
                                            <p class="content_4-bot-title-top-khong-cat ">
                                                Nền tảng tòa soạn hội tụ
                           
                                            </p>
                                            <p class="content_4-bot-title-bot-khongcat ">
                                                Cho phép xây dựng tòa soạn hội tụ công nghệ hiện đại, đưa toàn bộ
                                nghiệp vụ báo chí lên môi trường số bao gồm các hoạt động quản lý quy trình xuất bản, hoạt động quản trị
                                nội bộ của toàn soạn
                           
                                            </p>
                                        </div>
                                    </a>

                                </div>


                            </div>

                            <div class=" d-flex content_4-padding">
                                <div class="content_4-bot-img col-3">
                                    <a class="blacktitle" href="./tin-tuc/PTTTDLTRENMXH">
                                        <img src="./files/content_3-2.png" alt="">
                                    </a>
                                </div>
                                <div class="col-9 no-padding-left">
                                    <a class="blacktitle" href="./tin-tuc/PTTTDLTRENMXH">
                                        <div>
                                            <p class="content_4-bot-title-top-khong-cat ">
                                                Phân tích thông tin, dư luận trên mạng xã hội
                           
                                            </p>
                                            <p class="content_4-bot-title-bot-khongcat ">
                                                Giúp nắm bắt kịp thời thông tin, dư luận xã hội, nhờ đó nhận biết được nhu cầu thông tin,
                                có tin bài đáp ứng đúng mong muốn của người đọc, đúng thời điểm

                           
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class=" d-flex content_4-padding">
                                <div class="content_4-bot-img col-3">
                                    <a class="blacktitle" href="./tin-tuc/HTPCTCVAUCTTCCQBC">
                                        <img src="./files/content_3-3.png" alt="">
                                    </a>
                                </div>
                                <div class="col-9 no-padding-left">
                                    <a class="blacktitle" href="./tin-tuc/HTPCTCVAUCTTCCQBC">
                                        <div>
                                            <p class="content_4-bot-title-top-khong-cat ">Hỗ trợ phòng chống tấn công và ứng cứu khẩn cấp cho hệ thống thông tin của cơ quan báo chí</p>
                                            <p class="content_4-bot-title-bot-khongcat ">
                                                Nhằm tạo lá chắn, báo vệ hoạt động trên môi trường số cho cơ quan báo chí.
                           
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class=" d-flex content_4-padding">
                                <div class="content_4-bot-img col-3">
                                    <a class="blacktitle" href="./tin-tuc/NENTANGPHATTHANHSO">
                                        <img src="./files/content_3-4.png" alt="">
                                    </a>
                                </div>
                                <div class="col-9 no-padding-left">
                                    <a class="blacktitle" href="./tin-tuc/NENTANGPHATTHANHSO">
                                        <div>
                                            <p class="content_4-bot-title-top-khong-cat ">Nền tảng phát thanh số</p>
                                            <p class="content_4-bot-title-bot-khongcat ">
                                                Cho phép xây dựng tòa soạn hội tụ công nghệ hiện đại, đưa toàn bộ
                                nghiệp vụ báo chí lên môi trường số bao gồm các hoạt động quản lý quy trình xuất bản, hoạt động quản trị
                                nội bộ của toàn soạn
                           
                                            </p>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="d-flex content_4-padding">
                                <div class="content_4-bot-img col-3">
                                    <a class="blacktitle" href="./tin-tuc/NENTANGTRUYENHINHSO">
                                        <img src="./files/content_3-5.png" alt="">
                                    </a>
                                </div>
                                <div class="col-9 no-padding-left">
                                    <a class="blacktitle" href="./tin-tuc/NENTANGTRUYENHINHSO">
                                        <div>
                                            <p class="content_4-bot-title-top-khong-cat ">Nền tảng truyền hình số</p>
                                            <p class="content_4-bot-title-bot-khongcat ">
                                                Giúp nắm bắt kịp thời thông tin, dư luận xã hội, nhờ đó nhận biết được nhu cầu thông tin,
                                có tin bài đáp ứng đúng mong muốn của người đọc, đúng thời điểm
                           
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class=" d-flex content_4-padding">
                                <div class="content_4-bot-img col-3">
                                    <a class="blacktitle" href="./tin-tuc/NENTANGSANXUATNOIDUNGSO">
                                        <img src="./files/content_3-6.png" alt="">
                                    </a>
                                </div>
                                <div class="col-9 no-padding-left">
                                    <a class="blacktitle" href="./tin-tuc/NENTANGSANXUATNOIDUNGSO">
                                        <div>
                                            <p class="content_4-bot-title-top-khong-cat ">Nền tảng sản xuất nội dung số</p>
                                            <p class="content_4-bot-title-bot-khongcat ">
                                                Cho phép xây dựng tòa soạn hội tụ công nghệ hiện đại, đưa toàn bộ
                                nghiệp vụ báo chí lên môi trường số bao gồm các hoạt động quản lý quy trình xuất bản, hoạt động quản trị
                                nội bộ của toàn soạn
                           
                                            </p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        <script>

            function GetDataResult(page) {
                var dataSearch = $("#inputKeySearch").val();
                $.ajax({
                    url: '/CongThongTin/PanigationTinTuc?SlugTitle=TINTUC',
                    type: 'post',
                    data: { "KeySearch": dataSearch, "page": page },
                    success: function (result) {
                        $("#boxResultCOntent").html(result);
                        $('html,body').animate({
                            scrollTop: ($("#boxResultCOntent").offset().top - 100)
                        },
                            'slow');
                    }
                });
            }


</script>
        <!-- .egovenz-content -->
        <div id="MasterModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
        </div>
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
