<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="http://localhost/unitop.vn/back-end/project/ismart.com/admin/">
    <title>Thiet lap mat khau moi</title>
    <link rel="stylesheet" href="public/reset.css">
    <link rel="stylesheet" href="public/login.css">
</head>

<body>
    <div id="wp-form-login">
        <h1 class="page-title">MAT KHAU MOI</h1>
        <form action="" id="form-login" method="POST">
            <p>Yeu cau ban da thay doi mat khau moi thanh cong vui long click vao link sau de dang nhap <a href="<?php echo base_url("?mod=users&action=login") ?>">DANG NHAP</a> </p>

        </form>
        <a href="<?php echo base_url("?mod=users&action=reset") ?>" id="lost_pass">Quen mat khau</a>
        <a href="<?php echo base_url("?mod=users&action=reg") ?>" id="lost_pass">Dang ky</a>

    </div>
</body>

</html>