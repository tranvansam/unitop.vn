<!--  -->
<?php
get_header();
?>
<div id="main-content-wp" class="add-cat-page">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="fl-right">
            <div class="section" id="title-page">
                <div class="clearfix">
                    <h3 id="index" class="fl-left">Thêm sản phẩm</h3>
                </div>
            </div>
            <div class="section" id="detail-page">
                <div class="section-detail">
                    <form method="POST" enctype="multipart/form-data" id="form-upload-single">
                        <label for="product-name">Tên sản phẩm</label>
                        <input type="text" name="product_name" id="product-name">
                        <?php echo form_error('product_name')  ?>
                        <label for="product-code">Mã sản phẩm</label>
                        <input type="text" name="product_code" id="product-code">
                        <?php echo form_error('product_code')  ?>
                        <select name="status" id="status">
                            <option value="Passive" selected="selected">Chưa được duyệt</option>
                            <option value="Active">Đã được duyệt</option>
                        </select>
                        <?php echo form_error('status')  ?>
                        <label for="price">Giá sản phẩm</label>
                        <input type="text" name="price" id="price">
                        <label for="qty">Thêm số lượng sản phẩm</label>
                        <input type="number" min="1" max="100" name="qty" id="qty">
                        <?php echo form_error('price')  ?>
                        <label for="excerpt">Mô tả ngắn</label>
                        <textarea name="excerpt" id="excerpt" class="ckeditor"></textarea>
                        <?php echo form_error('excerpt')  ?>
                        <label for="desc">Chi tiết</label>
                        <textarea name="desc" id="desc" class="ckeditor"></textarea>
                        <?php echo form_error('desc')  ?>
                        <label>Hình ảnh</label>
                        <div id="uploadFile">
                            <input type="file" name="file" id="file" data-uri="?mod=product&action=upload_single">
                            <?php echo form_error('file')  ?>
                            <input type="submit" name="btn-upload-thumb" value="Upload" id="upload_single_bt">
                            <div id="show_list_file">
                                
                            </div>
                            <img src="public/images/img-thumb.png">
                        </div>
                        <label>Danh mục sản phẩm</label>
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
                        <?php echo form_error('cat_id')  ?>
                        <label>Danh mục con</label>
                        <select name="product_sub_category" id="product_sub_category">
                            <option value="">-Sub Category-</option>
                        </select>
                        <?php echo form_error('product_sub_category')  ?>
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