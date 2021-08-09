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
                        <input type="text" name="post_title" id="title">
                        <?php echo form_error('post_title')  ?>
                        <label for="title">Slug ( Friendly_url )</label>
                        <input type="text" name="slug" id="slug">
                        <label for="status">Trạng thái bài viết</label>
                        <select name="status" id="status">
                            <option value="Passive" selected="selected">Chưa được duyệt</option>
                            <option value="Active">Đã được duyệt</option>
                        </select>
                        <?php echo form_error('status')  ?>
                        <label for="excerpt">Mô tả ngắn</label>
                        <textarea name="excerpt" id="excerpt" class="ckeditor"></textarea>
                        <?php echo form_error('excerpt')  ?>
                        <label for="desc">Mô tả</label>
                        <textarea name="desc" id="desc" class="ckeditor"></textarea>
                        <?php echo form_error('desc')  ?>
                        <label>Hình ảnh</label>
                        <div id="uploadFile">
                            <input type="file" name="file" id="upload-thumb">
                            <?php echo form_error('file')  ?>
                            <input type="submit" name="btn-upload-thumb" value="Upload" id="btn-upload-thumb">
                            <img src="public/images/img-thumb.png">
                        </div>
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