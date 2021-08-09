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
            <h3 id="index" class="fl-left">Cập nhật tài khoản</h3>
        </div>
    </div>
    <div class="wrap clearfix">
        <?php get_sidebar('users'); ?>

        <div id="content" class="fl-right">
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <form method="POST" action="">
                        <label for="fullname">Ho va ten</label>
                        <input type="text" name="fullname" id="fullname" value="<?php echo $user_info['fullname'] ?>">
                        <?php echo form_error('display_name') ?>
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" name="username" id="username" placeholder="admin" readonly="readonly" value="<?php echo $user_info['username'] ?>">
                        <?php echo form_error('username') ?>
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" readonly="readonly" value="<?php echo $user_info['email'] ?>">
                        <?php echo form_error('email') ?>
                        <label for="tel">Số điện thoại</label>
                        <input type="tel" name="tel" id="tel" value="<?php echo $user_info['phone_number'] ?>">
                        <?php echo form_error('tel') ?>
                        <label for="address">Địa chỉ</label>
                        <textarea name="address" id="address"><?php echo $user_info['address'] ?></textarea>
                        <button type="submit" name="btn_submit" id="btn-submit">Cập nhật</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
get_footer();
?>