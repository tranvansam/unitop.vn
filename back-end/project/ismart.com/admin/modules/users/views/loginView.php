<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="http://localhost/unitop.vn/back-end/project/ismart.com/admin/">
    <title>Dang Nhap</title>
    <link rel="stylesheet" href="public/reset.css">
    <link rel="stylesheet" href="public/login.css">
</head>

<body>
    <div id="wp-form-login">
        <h1 class="page-title">ĐĂNG NHẬP</h1>
        <form action="" id="form-login" method="POST">
            <input type="text" name="username" id="username" value="<?php echo set_value('username') ?>" placeholder="Username">
            <?php echo form_error('username') ?>
            <input type="password" name="password" id="password" value="<?php echo set_value('password') ?>" placeholder="Password">
            <?php echo form_error('password') ?> 
            <input type="checkbox" name="check_box" id="check_box"> Remember_me
            
            <input type="submit" name="btn_login" id="btn-login" value="ĐĂNG NHẬP">
            <?php echo form_error('account') ?>
        </form>
        

    </div>
</body>

</html>