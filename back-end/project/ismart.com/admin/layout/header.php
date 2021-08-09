<!DOCTYPE html>
<html>

<head>
    <base href="http://localhost/unitop.vn/back-end/project/ismart.com/admin/">
    <title>Quản lý ISMART</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="public/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="public/css/bootstrap/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <link href="public/reset.css" rel="stylesheet" type="text/css" />
    <link href="public/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="public/style.css" rel="stylesheet" type="text/css" />
    <link href="public/responsive.css" rel="stylesheet" type="text/css" />

    <script src="public/js/jquery.min.js" type="text/javascript"></script>
    <script src="public/js/popper.min.js" type="text/javascript"></script>
    <script src="public/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="public/js/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="public/js/customs.js" type="text/javascript"></script>
    <script src="public/js/ajax.js" type="text/javascript"></script>
    <script src="public/js/main.js" type="text/javascript"></script>
</head>

<body>
    <div id="site">
        <div id="container">
            <div id="header-wp">
                <div class="wp-inner clearfix">
                    <a href="?" title="" id="logo" class="fl-left">ADMIN</a>
                    <ul id="main-menu" class="fl-left">
                        <li>
                            <a href="?mod=users&controller=team" title="">Admin</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="?mod=users&controller=team&action=add" title="">Thêm mới</a>
                                </li>
                                <li>
                                    <a href="?mod=users&controller=team" title="">Danh sách admin</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="?mod=page" title="">Trang</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="?mod=page&action=add" title="">Thêm mới</a>
                                </li>
                                <li>
                                    <a href="?mod=page" title="">Danh sách trang</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="?mod=post" title="">Bài viết</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="?mod=post&action=add" title="">Thêm mới</a>
                                </li>
                                <li>
                                    <a href="?mod=post" title="">Danh sách bài viết</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="?mod=product" title="">Sản phẩm</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="?mod=product&action=add" title="">Thêm mới</a>
                                </li>
                                <li>
                                    <a href="?mod=product" title="">Danh sách sản phẩm</a>
                                </li>
                                <li>
                                    <a href="?mod=product&controller=product_cat&action=product_cat" title="">Danh mục sản phẩm</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="?mod=sales" title="">Bán hàng</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="?mod=sales" title="">Danh sách đơn hàng</a>
                                </li>
                                <li>
                                    <a href="?mod=sales&action=customer_list" title="">Danh sách khách hàng</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="?mod=slider" title="">Slider</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="?mod=slider" title="">Danh sách slider</a>
                                </li>
                                <li>
                                    <a href="?mod=slider&action=add_slider" title="">Thêm mới</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div id="dropdown-user" class="dropdown dropdown-extended fl-right">
                        <button class="dropdown-toggle clearfix" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            <div id="thumb-circle" class="fl-left">
                                <a href="?mod=users&action=avatar"><img src="public/images/img-admin.png"></a>

                            </div>
                            <h3 id="account" class="fl-right"><?php if (!empty($_SESSION['user_login'])) echo  $_SESSION['user_login'] ?></h3>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="?mod=users&action=info_account" title="Thông tin cá nhân">Thông tin tài khoản</a></li>
                            <li><a href="?mod=users&action=logout" title="Thoát">Thoát</a></li>
                        </ul>
                    </div>
                </div>
            </div>