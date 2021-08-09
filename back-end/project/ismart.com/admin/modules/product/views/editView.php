
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
                    <form method="POST" enctype="multipart/form-data">
                        <label for="product-name">Tên sản phẩm</label>
                        <input type="text" name="product_name" id="product-name" value="<?php echo $product_info['product_name'] ?>">
                        <?php echo form_error('product_name')  ?>
                        <label for="product-code">Mã sản phẩm</label>
                        <input type="text" name="product_code" id="product-code" value="<?php echo $product_info['code'] ?>">
                        <?php echo form_error('product_code')  ?>
                        <label for="price">Giá sản phẩm</label>
                        <input type="text" name="price" id="price" value="<?php echo $product_info['price'] ?>">
                        <?php echo form_error('price')  ?>
                        <label for="qty">Thêm số lượng sản phẩm</label>
                        <input type="number" min="1" max="100" name="qty" id="qty" value="<?php echo $product_info['qty'] ?>">
                        <label for="excerpt">Mô tả ngắn</label>
                        <textarea name="excerpt" id="excerpt" class="ckeditor"><?php echo $product_info['excerpt'] ?></textarea>
                        <?php echo form_error('excerpt')  ?> 
                        <label for="desc">Chi tiết</label>
                        <textarea name="desc" id="desc" class="ckeditor"><?php echo $product_info['content'] ?></textarea>
                        <?php echo form_error('desc')  ?>
                        <label>Hình ảnh</label>
                        <div id="uploadFile">
                            <input type="file" name="file" id="upload-thumb">
                            <?php echo form_error('file')  ?>
                            <input type="submit" name="btn-upload-thumb" value="Upload" id="btn-upload-thumb">
                            <img src="<?php echo $product_info['image'] ?>">
                        </div>
                        <label>Danh mục sản phẩm</label>
                        <select name="parent_id" id="product_category">
                            <option value="">-- Chọn danh mục --</option>
                            <?php
                            $number = 0;
                            foreach ($cat_list as $item) {
                            ?>
                                <option value="<?php echo $item['cat_id']; ?>" <?php if ($item['cat_id'] == $product_parent_id) echo "selected = 'selected'"; ?>><?php echo $item['cat_title'] ?></option>
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
                        <label>Trạng thái</label>
                        <select name="status">
                            <option value="0">-- Chọn danh mục --</option>
                            <option value="1">Chờ duyệt</option>
                            <option value="2">Đã đăng</option>
                        </select>
                        <button type="submit" name="btn_update" id="btn-update">Cập nhật</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
get_footer();
?>