<?php
get_header();

?>
<style>
    .error {
        color: red;
    }
</style>
<div id="main-content-wp" class="info-account-page">
    <div class="section" id="title-page">
        <div class="clearfix">
            <a href="?mod=users&action=add_member" title="" id="add-new" class="fl-left">Thêm mới</a>
            <h3 id="index" class="fl-left">Đăng ký tài khoản</h3>
        </div>
    </div>
    <div class="wrap clearfix">
        <?php get_sidebar('users'); ?>

        <div id="content" class="fl-right">
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <form method="POST" action="">
                        <label for="fullname">Họ và tên <strong class="suffix">*</strong> </label>
                        <input type="text" name="fullname" id="fullname" value="<?php set_value('fullname') ?>">
                        <?php echo form_error('fullname') ?>
                        <label for="username">Tên đăng nhập <strong class="suffix">*</strong></label>
                        <input type="text" name="username" id="username" placeholder="admin" value="<?php set_value('username') ?>">
                        <?php echo form_error('username') ?>
                        <label for="password">Mật khẩu <strong class="suffix">*</strong></label>
                        <input type="password" name="password" id="password" placeholder="password">
                        <?php echo form_error('password') ?>
                        <label for="confirm_password">Xác nhận mật khẩu <strong class="suffix">*</strong></label>
                        <input type="password" name="confirm_password" id="confirm_password" placeholder="password">
                        <?php echo form_error('confirm_password') ?>
                        <label for="email">Email <strong class="suffix">*</strong></label>
                        <input type="email" name="email" id="email" value="<?php set_value('email') ?>">
                        <?php echo form_error('email') ?>
                        <label for="tel">Số điện thoại <strong class="suffix">*</strong></label>
                        <input type="tel" name="tel" id="tel" value="<?php set_value('phone_number') ?>">
                        <?php echo form_error('tel') ?>
                        <label for="address">Địa chỉ <strong class="suffix">*</strong></label>
                        <textarea name="address" id="address"><?php set_value('address') ?></textarea>
                        <button type="submit" name="btn_add" id="btn_add">Thêm mới</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
get_footer();
?>