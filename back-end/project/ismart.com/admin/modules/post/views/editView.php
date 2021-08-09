<?php
get_header();
?>
<div id="main-content-wp" class="add-cat-page">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Thêm mới bài viết</h3>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <form method="POST" enctype="multipart/form-data">
                        <label for="title">Tiêu đề</label>
                        <input type="text" name="post_title" id="title" value="<?php echo $post_info['post_title'] ?>">
                        <?php echo form_error('post_title')  ?>
                        <label for="title">Slug ( Friendly_url )</label>
                        <input type="text" name="slug" id="slug" value="<?php echo $post_info['slug'] ?>">
                        <?php echo form_error('slug')?>
                        <label for="status">Trạng thái bài viết</label>
                        <select name="status" id="status">
                            <option value="Passive" <?php if ($post_info['status'] == 'Passive') {
                                                        echo "selected";
                                                    } ?>>Chưa được duyệt</option>
                            <option value="Active" <?php if ($post_info['status'] == 'Active') {
                                                        echo "selected";
                                                    } ?>>Đã được duyệt</option>
                        </select>
                        <?php echo form_error('status')  ?>
                        <label for="excerpt">Mô tả ngắn</label>
                        <textarea name="excerpt" id="excerpt" class="ckeditor"><?php echo $post_info['excerpt'] ?></textarea>
                        <?php echo form_error('excerpt')  ?>
                        <label for="desc">Mô tả</label>
                        <textarea name="desc" id="desc" class="ckeditor"><?php echo $post_info['description'] ?></textarea>
                        <?php echo form_error('desc')  ?>
                        <label>Hình ảnh</label>
                        <div id="uploadFile">
                            <input type="file" name="file" id="upload-thumb">
                            <?php echo form_error('file')  ?>
                            <img src="<?php echo $post_info['image'] ?>">
                        </div>
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