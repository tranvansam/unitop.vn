<?php
get_header();
?>
<div id="main-content-wp" class="add-cat-page">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Thêm mới danh mục</h3>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <form method="POST">
                        <label for="title">Tên danh mục</label>
                        <input type="text" name="title" id="title">
                        <?php echo form_error('title') ?>
                        <select name="status" id="status">
                            <option value="Passive" selected="selected">Chưa được duyệt</option>
                            <option value="Active">Đã được duyệt</option>
                        </select>
                        <!-- <label for="title">Slug ( Friendly_url )</label>
                        <input type="text" name="slug" id="slug"> -->
                        <label for="desc">Mô tả</label>
                        <textarea name="desc" id="desc" class="ckeditor"></textarea>
                        <!-- <label>Hình ảnh</label>
                        <div id="uploadFile">
                            <input type="file" name="file" id="upload-thumb">
                            <input type="submit" name="btn-upload-thumb" value="Upload" id="btn-upload-thumb">
                            <img src="public/images/img-thumb.png">
                        </div> -->
                        <label>Danh mục cha</label>
                        <select name="parent_id" id="product_category">
                            <option value="">-- Chọn danh mục --</option>
                            <?php
                            foreach ($cat_list as $item) {
                            ?>
                                <option value="<?php echo $item['cat_id']; ?>"><?php echo $item['cat_title'] ?></option>
                            <?php
                            }
                            ?>
                        </select>
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