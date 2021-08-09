<?php
get_header();
?>
<div id="main-content-wp" class="add-cat-page slider-page">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Thêm Slider</h3>
                </div>
            </div>
            <div class="section" id="detail-page"> 
                <div class="section-detail">
                    <form method="POST" enctype="multipart/form-data">  
                        <label for="title">Tên slider</label>
                        <input type="text" name="title" id="title" value="<?php set_value('title') ?>">
                        <?php echo form_error('title')  ?>
                        <label for="title">Link</label>
                        <input type="text" name="slug" id="slug" value="<?php set_value('link') ?>">
                        <?php echo form_error('link')  ?>
                        <label for="desc">Mô tả</label>
                        <textarea name="desc" id="desc" class="ckeditor"><?php set_value('desc') ?></textarea>
                        <?php echo form_error('desc')  ?>
                        <label for="title">Thứ tự</label>
                        <input type="text" name="num_order" id="num-order" value="<?php set_value('num_order') ?>">
                        <?php echo form_error('num_order')  ?>
                        <label>Hình ảnh</label>
                        <div id="uploadFile">
                            <input type="file" name="file" id="upload-thumb">
                            <?php echo form_error('file')  ?>
                            <img src="public/images/img-thumb.png">
                        </div>
                        <label>Trạng thái</label>
                        <select name="status">
                            <option value="">-- Chọn trạng thái --</option>
                            <option value="Active">Công khai</option>
                            <option value="Passive">Chờ duyệt</option>
                        </select>
                        <?php echo form_error('status')  ?>
                        <button type="submit" name="btn_submit" id="btn-submit">Thêm mới</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
get_footer();
?>