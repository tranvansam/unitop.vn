<?php
get_header();
?>
<div id="main-content-wp" class="list-product-page">
    <div class="wrap clearfix">
        <?php get_sidebar() ?>
        <div id="content" class="detail-exhibition fl-right">
            <div class="section" id="info">
                <div class="section-head">
                    <h3 class="section-title">Thông tin đơn hàng</h3>
                </div>
                <ul class="list-item">
                    <li>
                        <h3 class="title">Số điện thoại</h3>
                        <span class="detail"><?php echo $customer_info['phone'] ?></span>
                    </li>
                    <li>
                        <h3 class="title">Địa chỉ nhận hàng</h3>
                        <span class="detail"><?php echo $customer_info['address'] ?></span>
                    </li>
                    <li>
                        <h3 class="title">Thông tin vận chuyển</h3>
                        <span class="detail">Thanh toán tại nhà</span>
                    </li>
                    <form method="POST" action="">
                        <li>
                            <h3 class="title">Tình trạng đơn hàng</h3>
                            <select name="status">
                                <option value='0'>Chờ duyệt</option>
                                <option selected='selected' value='1'>Đang vận chuyển</option>
                                <option value='2'>Thành công</option>
                            </select>
                            <input type="submit" name="sm_status" value="Cập nhật đơn hàng">
                        </li>
                    </form>
                </ul>
            </div>
            <?php
            if (!empty($order_info)) {
            ?>
                <div class="section">
                    <div class="section-head">
                        <h3 class="section-title">Sản phẩm đơn hàng</h3>
                    </div>


                    <div class="table-responsive">
                        <table class="table info-exhibition">
                            <thead>
                                <tr>
                                    <td class="thead-text">STT</td>
                                    <td class="thead-text">Mã sản phẩm</td>
                                    <td class="thead-text">Ảnh sản phẩm</td>
                                    <td class="thead-text">Tên sản phẩm</td>
                                    <td class="thead-text">Đơn giá</td>
                                    <td class="thead-text">Số lượng</td>
                                    <td class="thead-text">Thành tiền</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $num = 0;
                                $qty_total = 0;
                                foreach ($order_info as $item) {
                                    $qty_total += $item['qty'];
                                    $num++;
                                ?>
                                    <tr>
                                        <td class="thead-text"><?php echo $num ?></td>
                                        <td class="thead-text"><?php echo $item['code'] ?></td>
                                        <td class="thead-text">
                                            <div class="thumb">
                                                <img src="<?php echo $item['image'] ?>" alt="">
                                            </div>
                                        </td>
                                        <td class="thead-text"><?php echo $item['product_name'] ?></td>
                                        <td class="thead-text"><?php echo currency_format($item['price']) ?></td>
                                        <td class="thead-text"><?php echo $item['qty'] ?></td>
                                        <td class="thead-text"><?php echo currency_format($item['qty'] * $item['price']) ?></td>
                                    </tr>
                                <?php
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="section">
                    <h3 class="section-title">Giá trị đơn hàng</h3>
                    <div class="section-detail">
                        <ul class="list-item clearfix">
                            <li>
                                <span class="total-fee">Tổng số lượng</span>
                                <span class="total">Tổng đơn hàng</span>
                            </li>
                            <li>
                                <span class="total-fee"><?php echo $qty_total ?></span>
                                <span class="total"><?php echo currency_format($customer_info['total']) ?></span>
                            </li>
                        </ul>
                    </div>
                </div>
            <?php
            }
            ?>
        </div>
    </div>
</div>
</div>
<?php
get_footer();
?>