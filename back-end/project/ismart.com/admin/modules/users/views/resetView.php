<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="http://localhost/unitop.vn/back-end/project/ismart.com/admin/">
    <title>Khoi phuc mat khau</title>
    <link rel="stylesheet" href="public/reset.css">
    <link rel="stylesheet" href="public/login.css">
</head>

<body>
    <div id="wp-form-login">
        <h1 class="page-title">KHOI PHUC MAT KHAU</h1>
        <form action="" id="form-login" method="POST">
            <input type="text" name="email" id="email" placeholder="Email">
            <?php echo form_error('email') ?>
            <input type="submit" name="btn_reset" id="btn-login" value="Gui yeu cau">
            <?php echo form_error('account') ?>
        </form>
        <a href="<?php echo base_url("?mod=users&action=reset") ?>" id="lost_pass">Quen mat khau</a>
        <a href="<?php echo base_url("?mod=users&action=reg") ?>" id="lost_pass">Dang ky</a>

    </div>
</body>

</html>