-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2021 at 08:01 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(40) NOT NULL,
  `fullname` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(300) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `note` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `total` int(100) NOT NULL,
  `created_at` int(40) NOT NULL,
  `last_update` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `fullname`, `email`, `address`, `phone`, `note`, `total`, `created_at`, `last_update`) VALUES
(46, 'Nguyễn Mạnh Hùng', 'hungmanh201102@gmail.com', 'ngõ 126 phường Phùng khoang quận Nam từ liêm hà nội', '0399809781', NULL, 25000000, 1625504561, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `id` int(40) NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `product_name` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `order_id` int(40) NOT NULL,
  `product_id` int(40) NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `qty` int(40) NOT NULL,
  `price` int(40) NOT NULL,
  `created_at` int(40) NOT NULL,
  `last_update` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`id`, `code`, `product_name`, `order_id`, `product_id`, `image`, `qty`, `price`, `created_at`, `last_update`) VALUES
(57, 'WEB000013', 'Dell Aspire Intel Core', 46, 13, 'uploads/products/dell-inspiron600x600.jpg', 1, 25000000, 1625504561, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page`
--

CREATE TABLE `tbl_page` (
  `id` int(40) NOT NULL,
  `page_title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(1000) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` enum('Active','Passive') COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_page`
--

INSERT INTO `tbl_page` (`id`, `page_title`, `slug`, `description`, `image`, `status`, `created_name`, `created_at`) VALUES
(1, 'Giới thiệu ISMART', 'gioi-thieu-ismart', '<p>Đ&atilde; bao giờ bạn t&igrave;nh cờ nh&igrave;n thấy một chiếc điện thoại h&agrave;ng &ldquo;hiếm&rdquo; hay một chiếc v&aacute;y H&amp;M sale-off cực hấp dẫn tr&ecirc;n&nbsp;<strong>Amazon.com</strong>&nbsp;hay&nbsp;<strong>Ebay.com</strong>, v&agrave; bạn rất rất muốn sở hữu ch&uacute;ng&hellip;nhưng bạn đ&atilde; kh&ocirc;ng mua được?</p>\r\n\r\n<p>Kh&ocirc;ng c&oacute; người quen để gửi h&agrave;ng, chưa từng mua h&agrave;ng trực tuyến ở nước ngo&agrave;i/ đ&atilde; mua nhưng thất vọng v&igrave; sản phẩm kh&ocirc;ng như &yacute; m&agrave; gi&aacute; qu&aacute; cao&hellip; Cuối c&ugrave;ng bạn từ bỏ mong muốn sở hữu những m&oacute;n đồ chất lượng cao, mức gi&aacute; tốt từ c&aacute;c thương hiệu lớn.</p>\r\n\r\n<p>V&agrave;, d&ugrave; th&iacute;ch th&uacute; với những sản phẩm &ldquo;ti&ecirc;u chuẩn Mỹ&rdquo; nhưng bạn lại e ngại việc mua h&agrave;ng v&igrave;:</p>\r\n\r\n<ul>\r\n	<li>Thủ tục thanh to&aacute;n rắc rối</li>\r\n	<li>Ph&iacute; chuyển đổi ngoại tệ cao</li>\r\n	<li>Ph&iacute; vận chuyển cao (đ&ocirc;i khi c&ograve;n vượt qua gi&aacute; trị m&oacute;n h&agrave;ng)</li>\r\n	<li>Thời gian chờ qu&aacute; l&acirc;u</li>\r\n	<li>Rủi ro khi vận chuyển h&agrave;ng h&oacute;a: va đập, hư hỏng, thất lạc&hellip;</li>\r\n</ul>\r\n\r\n<p>V&agrave; những c&acirc;u hỏi kh&oacute; giải đ&aacute;p kh&aacute;c như bao giờ t&ocirc;i nhận được h&agrave;ng, sản phẩm c&oacute; như t&ocirc;i mong đợi, liệu c&aacute;c lần mua kh&aacute;c của t&ocirc;i c&oacute; th&agrave;nh c&ocirc;ng&hellip;?</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Page/Gioi%20thieu/PAGE.png\" style=\"width: 300px; height: 300px;\" /></p>\r\n\r\n<p><strong>Unishipping.vn</strong>&nbsp;&ndash; Dịch vụ mua h&agrave;ng v&agrave; vận chuyển h&agrave;ng h&oacute;a từ Mỹ về Việt Nam chuy&ecirc;n nghiệp, uy t&iacute;n sẽ giải quyết những thắc mắc tr&ecirc;n của bạn.</p>\r\n\r\n<p>Với sự t&iacute;ch hợp của c&ocirc;ng nghệ v&agrave; quy tr&igrave;nh mua h&agrave;ng &ndash; vận chuyển h&agrave;ng kh&eacute;p k&iacute;n do ch&iacute;nh đội ngũ Unishipping đảm nhận, chỉ cần bạn gửi cho ch&uacute;ng t&ocirc;i sản phẩm bạn muốn mua, ch&uacute;ng t&ocirc;i sẽ lo tất cả c&aacute;c kh&acirc;u c&ograve;n lại để bạn sở hữu m&oacute;n đồ m&igrave;nh y&ecirc;u th&iacute;ch trong thời gian ngắn nhất.</p>\r\n\r\n<p>Bạn chỉ ngồi trước m&aacute;y t&iacute;nh, chọn sản phẩm m&igrave;nh y&ecirc;u th&iacute;ch v&agrave; gửi cho Unishipping, ch&uacute;ng t&ocirc;i sẽ ho&agrave;n tất c&aacute;c kh&acirc;u từ mua h&agrave;ng đến vận chuyển h&agrave;ng cho bạn.</p>\r\n\r\n<p><strong>V&igrave; sao bạn n&ecirc;n chọn Unishipping?</strong></p>\r\n\r\n<ol>\r\n	<li><strong>Unishipping cam kết về chất lượng phục vụ&nbsp;</strong>Ch&uacute;ng t&ocirc;i biết rằng uy t&iacute;n v&agrave; sự đảm bảo chất lượng h&agrave;ng h&oacute;a l&agrave; yếu tố quyết định của ng&agrave;nh vận chuyển. Unishipping l&agrave;m việc r&otilde; r&agrave;ng, minh bạch, giấy tờ đầy đủ, đặt quyền lợi kh&aacute;ch h&agrave;ng l&ecirc;n tr&ecirc;n hết.</li>\r\n	<li><strong>Unishipping chọn h&agrave;ng tốt gi&uacute;p bạn&nbsp;</strong>C&aacute;c tư vấn vi&ecirc;n d&agrave;y dặn kinh nghiệm mua sắm trực tuyến tại thị trường Mỹ sẽ hướng dẫn bạn lựa chọn những mặt h&agrave;ng chất lượng cao, gi&aacute; tốt tại c&aacute;c&nbsp;<a href=\"https://paperwriter.org/about/\">website</a>&nbsp;thương mại điện tử uy t&iacute;n h&agrave;ng đầu của Mỹ.</li>\r\n	<li><strong>Chi ph&iacute; vận chuyển cạnh tranh&nbsp;</strong>Với quy tr&igrave;nh vận chuyển được thiết kế kh&eacute;p k&iacute;n, an to&agrave;n, Unishipping đảm bảo gi&aacute; tốt nhất với thời gian phục vụ nhanh nhất cho kh&aacute;ch h&agrave;ng.</li>\r\n	<li><strong>Bảo hiểm h&agrave;ng h&oacute;a v&agrave; bảo vệ quyền lợi kh&aacute;ch h&agrave;ng&nbsp;</strong>Unishipping x&acirc;y dựng ch&iacute;nh s&aacute;ch bảo hiểm h&agrave;ng h&oacute;a chặt chẽ, bảo vệ tối đa quyền lợi kh&aacute;ch h&agrave;ng trong những trường hợp h&agrave;ng h&oacute;a thất lạc, hư hỏng, mất m&aacute;t.</li>\r\n	<li><strong>Tiện &iacute;ch tra cứu h&agrave;nh tr&igrave;nh vận chuyển&nbsp;</strong>Unishipping gi&uacute;p bạn quản l&yacute; giao h&agrave;ng v&agrave; h&agrave;nh tr&igrave;nh vận chuyển một c&aacute;ch đầy đủ, chi tiết qua email, sms.</li>\r\n	<li><strong>Tối giản c&aacute;c quy tr&igrave;nh vận chuyển, thanh to&aacute;n&nbsp;</strong>Kh&aacute;ch h&agrave;ng chỉ cần thao t&aacute;c với những click chuột để nhận b&aacute;o gi&aacute;, đặt h&agrave;ng, thanh to&aacute;n tr&ecirc;n website Unishipping.com, hỗ trợ tr&ecirc;n tất cả c&aacute;c thiết bị số: mobile, tablet, laptop, desktop.</li>\r\n	<li><strong>Giao h&agrave;ng tận nơi&nbsp;</strong>D&ugrave; bạn đang ở th&agrave;nh phố, tỉnh huyện n&agrave;o, chỉ cần y&ecirc;u cầu, bạn sẽ được Unishipping giao h&agrave;ng tận nơi.</li>\r\n	<li><strong>Đội ngũ hỗ trợ 24/7</strong></li>\r\n</ol>\r\n\r\n<p>Mọi &yacute; kiến, thắc mắc của kh&aacute;ch h&agrave;ng sẽ được đội ngũ Unishipping tư vấn v&agrave; giải đ&aacute;p mọi l&uacute;c, mọi nơi. Kh&ocirc;ng chỉ t&iacute;nh chuy&ecirc;n nghiệp m&agrave; c&ograve;n sự tận t&acirc;m l&agrave; yếu tố nền tảng x&acirc;y dựng gi&aacute; trị cốt l&otilde;i của Unishipping.</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng dịch vụ Unishipping</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Bước 1:&nbsp;</strong>Chọn sản phẩm bạn muốn mua tr&ecirc;n c&aacute;c trang thương mại điện tử uy t&iacute;n hoặc c&aacute;c sản phẩm được đề xuất tr&ecirc;n&nbsp;<strong>Unishipping</strong>.</li>\r\n	<li><strong>Bước 2:&nbsp;</strong>Copy link sản phẩm, d&aacute;n v&agrave;o form b&aacute;o gi&aacute; sản phẩm tr&ecirc;n website Unishipping.vn. Ch&uacute;ng t&ocirc;i sẽ gửi b&aacute;o gi&aacute; qua email cho bạn.</li>\r\n	<li><strong>Bước 3:&nbsp;</strong>Tư vấn vi&ecirc;n của Unishipping li&ecirc;n hệ tư vấn chất lượng sản phẩm v&agrave; b&aacute;o gi&aacute; tổng chi ph&iacute; cần thanh to&aacute;n của sản phẩm cho kh&aacute;ch h&agrave;ng qua email, điện thoại.</li>\r\n	<li><strong>Bước 4:</strong>&nbsp;Kh&aacute;ch h&agrave;ng đồng &yacute; gi&aacute;, đặt cọc % gi&aacute; trị sản phẩm. Unishipping tiến h&agrave;nh mua sản phẩm.</li>\r\n	<li><strong>Bước 5:&nbsp;</strong>Sản phẩm được đơn vị b&aacute;n giao đến văn ph&ograve;ng Unishipping tại Mỹ sau 3 &ndash; 5 ng&agrave;y l&agrave;m việc.</li>\r\n	<li><strong>Bước 6:&nbsp;</strong>Sản phẩm được chuyển về Việt Nam trong v&ograve;ng 5 &ndash; 7 ng&agrave;y l&agrave;m việc.</li>\r\n	<li><strong>Bước 7:&nbsp;</strong>Unishipping giao tận nh&agrave; cho kh&aacute;ch h&agrave;ng hoặc kh&aacute;ch h&agrave;ng đến văn ph&ograve;ng Unishipping tại HCM để nhận.</li>\r\n</ul>\r\n\r\n<p><strong>Tiện &iacute;ch website Unishipping</strong></p>\r\n\r\n<ul>\r\n	<li>Chức năng b&aacute;o gi&aacute; sản phẩm vận chuyển từ Mỹ: Chỉ cần điền link sản phẩm, số điện thoại v&agrave; email, kh&aacute;ch h&agrave;ng sẽ nhận được ngay b&aacute;o gi&aacute; qua email.</li>\r\n	<li>Kh&aacute;ch h&agrave;ng tạo t&agrave;i khoản để quản l&yacute; đơn h&agrave;ng, h&agrave;nh tr&igrave;nh vận chuyển h&agrave;ng, dễ d&agrave;ng mua h&agrave;ng cho những lần sau.</li>\r\n	<li>Danh s&aacute;ch những sản phẩm gi&aacute; tốt, chất lượng cao đang được ưu đ&atilde;i tr&ecirc;n c&aacute;c website b&aacute;n h&agrave;ng uy t&iacute;n ở Mỹ</li>\r\n</ul>\r\n', 'uploads/pages/PAGE.png', 'Active', 'manhhung2011', 1625474516);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page_list`
--

CREATE TABLE `tbl_page_list` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` enum('Online','Offline') COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_name` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `update_time` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_page_list`
--

INSERT INTO `tbl_page_list` (`page_id`, `page_title`, `description`, `status`, `created_name`, `created_at`, `update_time`) VALUES
(3, 'liên hệ', '', NULL, 'manhhung2011', 0, NULL),
(4, 'Blog', '', NULL, 'manhhung2011', 0, NULL),
(5, 'Lien he doanh nghiep', '<h3>Doanh nghiệp EU t&igrave;m kiếm cơ hội hợp t&aacute;c đầu tư c&ocirc;ng nghệ xanh tại Việt Nam(Nguyen Manh Hung director )</h3>\r\n\r\n<p>28/11/2017</p>\r\n\r\n<p><strong>Elon Musk nghĩ rằng c&aacute;c c&ocirc;ng ty lưới điện kh&ocirc;ng c&oacute; g&igrave; phải lo sợ c&aacute;c hệ thống m&aacute;i ng&oacute;i năng lượng mặt trời. Nhiều b&aacute;o c&aacute;o cho rằng đang c&oacute; một &ldquo;cuộc chiến&rdquo; giữa c&aacute;c c&ocirc;ng ty năng lượng mặt trời v&agrave; c&aacute;c c&ocirc;ng ty lưới điện tại Hoa Kỳ, xoay quanh một số vấn đề quan trọng.</strong></p>\r\n\r\n<p>Một trong số đ&oacute; l&agrave; nhiều tiểu bang c&oacute; luật &ldquo;mua lại điện&rdquo; đỏi hỏi c&aacute;c c&ocirc;ng ty lưới điện phải mua lại lượng điện dư thừa m&agrave; kh&aacute;ch h&agrave;ng tạo ra bởi năng lượng mặt trời. Cũng c&oacute; những lo ngại rằng người ta c&oacute; thể d&ugrave;ng ng&oacute;i năng lượng mặt trời tự sản xuất điện năng lượng mặt trời độc lập với lưới &ndash; v&agrave; như vậy sẽ giảm số người phụ thuộc v&agrave;o lưới điện v&agrave; chuyển c&aacute;c chi ph&iacute; điện lưới đ&oacute; cho những người kh&ocirc;ng d&ugrave;ng điện năng lượng mặt trời.</p>\r\n\r\n<p>Ph&aacute;t biểu tại buổi ra mắt sản phẩm m&aacute;i ng&oacute;i năng lượng mặt trời v&agrave; hệ thống pin dự trữ mới của Tesla v&agrave; SolarCity v&agrave;o thứ S&aacute;u vừa rồi, Musk, người vừa l&agrave; chủ tịch của cả hai c&ocirc;ng ty vừa l&agrave; CEO của Tesla, n&oacute;i về l&yacute; do tại sao tầm nh&igrave;n của &ocirc;ng ấy về điện năng lượng mặt trời tại Mỹ s&acirc;u xa hơn sẽ c&oacute; nhiều việc cho c&aacute;c c&ocirc;ng lưới điện chứ kh&ocirc;ng phải &iacute;t hơn</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Page/Gioi%20thieu/EU.jpg\" style=\"width: 588px; height: 392px;\" /></p>\r\n\r\n<p>Một trong số đ&oacute; l&agrave; nhiều tiểu bang c&oacute; luật &ldquo;mua lại điện&rdquo; đỏi hỏi c&aacute;c c&ocirc;ng ty lưới điện phải mua lại lượng điện dư thừa m&agrave; kh&aacute;ch h&agrave;ng tạo ra bởi năng lượng mặt trời. Cũng c&oacute; những lo ngại rằng người ta c&oacute; thể d&ugrave;ng ng&oacute;i năng lượng mặt trời tự sản xuất điện năng lượng mặt trời độc lập với lưới &ndash; v&agrave; như vậy sẽ giảm số người phụ thuộc v&agrave;o lưới điện v&agrave; chuyển c&aacute;c chi ph&iacute; điện lưới đ&oacute; cho những người kh&ocirc;ng d&ugrave;ng điện năng lượng mặt trời. Ph&aacute;t biểu tại buổi ra mắt sản phẩm m&aacute;i ng&oacute;i năng lượng mặt trời v&agrave; hệ thống pin dự trữ mới của Tesla v&agrave; SolarCity v&agrave;o thứ S&aacute;u vừa rồi, Musk, người vừa l&agrave; chủ tịch của cả hai c&ocirc;ng ty vừa l&agrave; CEO của Tesla, n&oacute;i về l&yacute; do tại sao tầm nh&igrave;n của &ocirc;ng ấy về điện năng lượng mặt trời tại Mỹ s&acirc;u xa hơn sẽ c&oacute; nhiều việc cho c&aacute;c c&ocirc;ng lưới điện chứ kh&ocirc;ng phải &iacute;t hơn.</p>\r\n\r\n<p>Một trong số đ&oacute; l&agrave; nhiều tiểu bang c&oacute; luật &ldquo;mua lại điện&rdquo; đỏi hỏi c&aacute;c c&ocirc;ng ty lưới điện phải mua lại lượng điện dư thừa m&agrave; kh&aacute;ch h&agrave;ng tạo ra bởi năng lượng mặt trời. Cũng c&oacute; những lo ngại rằng người ta c&oacute; thể d&ugrave;ng ng&oacute;i năng lượng mặt trời tự sản xuất điện năng lượng mặt trời độc lập với lưới &ndash; v&agrave; như vậy sẽ giảm số người phụ thuộc v&agrave;o lưới điện v&agrave; chuyển c&aacute;c chi ph&iacute; điện lưới đ&oacute; cho những người kh&ocirc;ng d&ugrave;ng điện năng lượng mặt trời.</p>\r\n\r\n<p>Một trong số đ&oacute; l&agrave; nhiều tiểu bang c&oacute; luật &ldquo;mua lại điện&rdquo; đỏi hỏi c&aacute;c c&ocirc;ng ty lưới điện phải mua lại lượng điện dư thừa m&agrave; kh&aacute;ch h&agrave;ng tạo ra bởi năng lượng mặt trời. Cũng c&oacute; những lo ngại rằng người ta c&oacute; thể d&ugrave;ng ng&oacute;i năng lượng mặt trời tự sản xuất điện năng lượng mặt trời độc lập với lưới &ndash; v&agrave; như vậy sẽ giảm số người phụ thuộc v&agrave;o lưới điện v&agrave; chuyển c&aacute;c chi ph&iacute; điện lưới đ&oacute; cho những người kh&ocirc;ng d&ugrave;ng điện năng lượng mặt trời. Ph&aacute;t biểu tại buổi ra mắt sản phẩm m&aacute;i ng&oacute;i năng lượng mặt trời v&agrave; hệ thống pin dự trữ mới của Tesla v&agrave; SolarCity v&agrave;o thứ S&aacute;u vừa rồi, Musk, người vừa l&agrave; chủ tịch của cả hai c&ocirc;ng ty vừa l&agrave; CEO của Tesla, n&oacute;i về l&yacute; do tại sao tầm nh&igrave;n của &ocirc;ng ấy về điện năng lượng mặt trời tại Mỹ s&acirc;u xa hơn sẽ c&oacute; nhiều việc cho c&aacute;c c&ocirc;ng lưới điện chứ kh&ocirc;ng phải &iacute;t hơn.</p>\r\n\r\n<p>Một trong số đ&oacute; l&agrave; nhiều tiểu bang c&oacute; luật &ldquo;mua lại điện&rdquo; đỏi hỏi c&aacute;c c&ocirc;ng ty lưới điện phải mua lại lượng điện dư thừa m&agrave; kh&aacute;ch h&agrave;ng tạo ra bởi năng lượng mặt trời. Cũng c&oacute; những lo ngại rằng người ta c&oacute; thể d&ugrave;ng ng&oacute;i năng lượng mặt trời tự sản xuất điện năng lượng mặt trời độc lập với lưới &ndash; v&agrave; như vậy sẽ giảm số người phụ thuộc v&agrave;o lưới điện v&agrave; chuyển c&aacute;c chi ph&iacute; điện lưới đ&oacute; cho những người kh&ocirc;ng d&ugrave;ng điện năng lượng mặt trời.</p>\r\n', NULL, 'manhhung2011', 0, 1623334809),
(9, 'San pham cong nghe', '<p>Cuối th&aacute;ng 4 vừa qua, Ban Quản l&yacute; dự &aacute;n Đường sắt - Bộ Giao th&ocirc;ng vận tải (GTVT) v&agrave; C&ocirc;ng ty Metro H&agrave; Nội đ&atilde; ho&agrave;n th&agrave;nh c&ocirc;ng t&aacute;c b&agrave;n giao hồ sơ t&agrave;i liệu, ho&agrave;n th&agrave;nh c&ocirc;ng t&aacute;c kiểm đếm t&agrave;i sản dự &aacute;n tại hiện trường.</p>\r\n\r\n<p>Cong nghe chat luong cao</p>\r\n', NULL, 'manhhung2011', 8385959, 1623334921),
(10, 'lien he', '<p>L&atilde;nh đạo Bộ GTVT cho biết, tư vấn Ph&aacute;p đ&atilde; cấp chứng nhận an to&agrave;n hệ thống cho Dự &aacute;n đường sắt C&aacute;t Linh - H&agrave; Đ&ocirc;ng (H&agrave; Nội) v&agrave; đang chờ Hội đồng nghiệm thu Nh&agrave; nước xem x&eacute;t, ra quyết định cuối c&ugrave;ng.</p>\r\n', NULL, 'manhhung2011', 1623253387, NULL),
(11, 'Gioi thieu web', '<p>&quot;Bitcoin, n&oacute; giống như một tr&ograve; lừa đảo. T&ocirc;i kh&ocirc;ng th&iacute;ch n&oacute; v&igrave; n&oacute; l&agrave; một loại tiền tệ kh&aacute;c cạnh tranh với đồng USD&quot;, &ocirc;ng Trump n&oacute;i v&agrave; th&ecirc;m rằng &ocirc;ng muốn đồng USD l&agrave; &quot;tiền tệ của thế giới&quot;.</p>\r\n', NULL, 'manhhung2011', 1623256209, NULL),
(12, 'Gioi thieu web', '<p>&quot;Bitcoin, n&oacute; giống như một tr&ograve; lừa đảo. T&ocirc;i kh&ocirc;ng th&iacute;ch n&oacute; v&igrave; n&oacute; l&agrave; một loại tiền tệ kh&aacute;c cạnh tranh với đồng USD&quot;, &ocirc;ng Trump n&oacute;i v&agrave; th&ecirc;m rằng &ocirc;ng muốn đồng USD l&agrave; &quot;tiền tệ của thế giới&quot;.</p>\r\n', NULL, 'manhhung2011', 1623256304, NULL),
(13, 'Gioi thieu web', '<p>&quot;Bitcoin, n&oacute; giống như một tr&ograve; lừa đảo. T&ocirc;i kh&ocirc;ng th&iacute;ch n&oacute; v&igrave; n&oacute; l&agrave; một loại tiền tệ kh&aacute;c cạnh tranh với đồng USD&quot;, &ocirc;ng Trump n&oacute;i v&agrave; th&ecirc;m rằng &ocirc;ng muốn đồng USD l&agrave; &quot;tiền tệ của thế giới&quot;.</p>\r\n', NULL, 'manhhung2011', 1623256323, NULL),
(14, 'Gioi thieu web', '<p>&quot;Bitcoin, n&oacute; giống như một tr&ograve; lừa đảo. T&ocirc;i kh&ocirc;ng th&iacute;ch n&oacute; v&igrave; n&oacute; l&agrave; một loại tiền tệ kh&aacute;c cạnh tranh với đồng USD&quot;, &ocirc;ng Trump n&oacute;i v&agrave; th&ecirc;m rằng &ocirc;ng muốn đồng USD l&agrave; &quot;tiền tệ của thế giới&quot;.</p>\r\n', NULL, 'manhhung2011', 1623256366, NULL),
(15, 'San pham', '<p>&Ocirc;ng Justin Urquhart-Stewart, đồng s&aacute;ng lập quỹ Seven Investment Management v&agrave; nền tảng đầu tư Regionally, cho rằng bitcoin thực sự l&agrave; mối đe dọa tiềm ẩn trong việc g&acirc;y mất ổn định tiền tệ. &quot;Bởi n&oacute; đ&atilde; ph&aacute;t triển bằng c&aacute;ch tạo ra một sự hấp dẫn phổ biến m&agrave; kh&ocirc;ng dựa v&agrave;o bất kỳ sức mạnh t&agrave;i ch&iacute;nh vững chắc n&agrave;o&quot;, &ocirc;ng n&oacute;i.</p>\r\n', NULL, 'manhhung2011', 1623256445, NULL),
(16, 'San pham', '<p>&Ocirc;ng Justin Urquhart-Stewart, đồng s&aacute;ng lập quỹ Seven Investment Management v&agrave; nền tảng đầu tư Regionally, cho rằng bitcoin thực sự l&agrave; mối đe dọa tiềm ẩn trong việc g&acirc;y mất ổn định tiền tệ. &quot;Bởi n&oacute; đ&atilde; ph&aacute;t triển bằng c&aacute;ch tạo ra một sự hấp dẫn phổ biến m&agrave; kh&ocirc;ng dựa v&agrave;o bất kỳ sức mạnh t&agrave;i ch&iacute;nh vững chắc n&agrave;o&quot;, &ocirc;ng n&oacute;i.</p>\r\n', NULL, 'manhhung2011', 1623256486, NULL),
(17, 'My Pham ', '<p>&quot;Mặc d&ugrave; bitcoin được đ&aacute;nh gi&aacute; cao nhưng v&igrave; n&oacute; qu&aacute; biến động n&ecirc;n n&oacute; kh&oacute; trở th&agrave;nh một loại tiền tệ. N&oacute; l&ecirc;n xuống nhanh hơn so với hầu hết c&aacute;c loại cổ phiếu&quot;, &ocirc;ng n&oacute;i v&agrave; th&ecirc;m rằng, với bitcoin, mọi người chỉ mua v&agrave;o nắm giữ v&agrave; đầu tư thay v&igrave; sử dụng để chi ti&ecirc;u thường xuy&ecirc;n.</p>\r\n', NULL, 'manhhung2011', 1623256729, NULL),
(18, 'San pham', '<p>&quot;Mặc d&ugrave; bitcoin được đ&aacute;nh gi&aacute; cao nhưng v&igrave; n&oacute; qu&aacute; biến động n&ecirc;n n&oacute; kh&oacute; trở th&agrave;nh một loại tiền tệ. N&oacute; l&ecirc;n xuống nhanh hơn so với hầu hết c&aacute;c loại cổ phiếu&quot;, &ocirc;ng n&oacute;i v&agrave; th&ecirc;m rằng, với bitcoin, mọi người chỉ mua v&agrave;o nắm giữ v&agrave; đầu tư thay v&igrave; sử dụng để chi ti&ecirc;u thường xuy&ecirc;n.</p>\r\n', NULL, 'manhhung2011', 1623257236, NULL),
(19, 'Gioi thieu web', '<p>&quot;Mặc d&ugrave; bitcoin được đ&aacute;nh gi&aacute; cao nhưng v&igrave; n&oacute; qu&aacute; biến động n&ecirc;n n&oacute; kh&oacute; trở th&agrave;nh một loại tiền tệ. N&oacute; l&ecirc;n xuống nhanh hơn so với hầu hết c&aacute;c loại cổ phiếu&quot;, &ocirc;ng n&oacute;i v&agrave; th&ecirc;m rằng, với bitcoin, mọi người chỉ mua v&agrave;o nắm giữ v&agrave; đầu tư thay v&igrave; sử dụng để chi ti&ecirc;u thường xuy&ecirc;n.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Page/Gioi%20thieu/EU.jpg\" style=\"width: 588px; height: 392px;\" /></p>\r\n', NULL, 'manhhung2011', 1623257299, NULL),
(20, 'Gioi thieu web', '<p>&quot;Mặc d&ugrave; bitcoin được đ&aacute;nh gi&aacute; cao nhưng v&igrave; n&oacute; qu&aacute; biến động n&ecirc;n n&oacute; kh&oacute; trở th&agrave;nh một loại tiền tệ. N&oacute; l&ecirc;n xuống nhanh hơn so với hầu hết c&aacute;c loại cổ phiếu&quot;, &ocirc;ng n&oacute;i v&agrave; th&ecirc;m rằng, với bitcoin, mọi người chỉ mua v&agrave;o nắm giữ v&agrave; đầu tư thay v&igrave; sử dụng để chi ti&ecirc;u thường xuy&ecirc;n.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Page/Gioi%20thieu/EU.jpg\" style=\"width: 588px; height: 392px;\" /></p>\r\n', NULL, 'manhhung2011', 1623257335, NULL),
(21, 'Phuong phap chua mun hieu qua', '<p>S&aacute;ng 10/6, &ocirc;ng Dương Anh Đức, Ph&oacute; Chủ tịch UBND TPHCM, dẫn đầu đo&agrave;n c&ocirc;ng t&aacute;c đến l&agrave;m việc v&agrave; kiểm tra tại C&ocirc;ng ty PouYuen về những biện ph&aacute;p ph&ograve;ng, chống dịch Covid-19. Buổi l&agrave;m việc diễn ra sau khi c&ocirc;ng ty n&agrave;y ph&aacute;t hiện một ca dương t&iacute;nh&nbsp;<a data-auto-link-id=\"5fed3795b00b7a0012bca1d5\" href=\"https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm\">SARS-CoV-2</a>&nbsp;một ng&agrave;y trước đ&oacute;.</p>\r\n', NULL, 'manhhung2011', 1623310038, NULL),
(22, 'Gioi thieu my pham', '<p>Do đ&oacute;, Hội đồng Bầu cử quốc gia x&aacute;c định c&oacute; 499 người tr&uacute;ng cử đại biểu Quốc hội kh&oacute;a XV (đạt 99,8%). Con số n&agrave;y cao hơn nhiệm kỳ Quốc hội kh&oacute;a XIV, khi cả nước 5 năm trước bầu được 496 đại biểu (đạt 99,2%) nhưng c&oacute; 2 người tr&uacute;ng cử kh&ocirc;ng được Hội đồng Bầu cử quốc gia x&aacute;c nhận tư c&aacute;ch đại biểu n&ecirc;n c&ograve;n 494 đại biểu được x&aacute;c nhận tư c&aacute;ch tại Kỳ họp thứ nhất.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Page/Gioi%20thieu/Vote.jpg\" style=\"width: 660px; height: 464px;\" /></p>\r\n', NULL, 'manhhung2011', 1623331464, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_posts`
--

CREATE TABLE `tbl_posts` (
  `id` int(11) NOT NULL,
  `post_title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(400) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `excerpt` mediumtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` enum('Active','Passive') COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` int(100) NOT NULL,
  `last_update` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_posts`
--

INSERT INTO `tbl_posts` (`id`, `post_title`, `slug`, `excerpt`, `description`, `image`, `status`, `created_name`, `created_at`, `last_update`) VALUES
(7, 'Sự trùng hợp ở vòng bán kết chỉ ra bất công lớn tại Euro 2020', 'su-trung-hop-o-vong-ban-ket-chi-ra-bat-cong-lon-tai-euro-2020', '<p style=\"text-align: justify;\">C&oacute; một sự tr&ugrave;ng hợp l&agrave; 4 đội b&oacute;ng v&agrave;o b&aacute;n kết Euro 2020 đều thi đấu ba trận v&ograve;ng bảng tr&ecirc;n s&acirc;n nh&agrave;. Điều đ&oacute; chỉ ra bất c&ocirc;ng ở giải đấu.</p>\r\n', '<p style=\"text-align: justify;\">C&oacute; một sự tr&ugrave;ng hợp l&agrave; 4 đội b&oacute;ng v&agrave;o b&aacute;n kết Euro 2020 đều thi đấu ba trận v&ograve;ng bảng tr&ecirc;n s&acirc;n nh&agrave;. Điều đ&oacute; chỉ ra bất c&ocirc;ng ở giải đấu.</p>\r\n\r\n<p style=\"text-align: justify;\">Sau loạt trận đ&ecirc;m qua, UEFA đ&atilde; x&aacute;c định được 4 tấm v&eacute; lọt v&agrave;o b&aacute;n kết Euro 2020 l&agrave; Italia, T&acirc;y Ban Nha, Anh v&agrave; Đan Mạch. C&oacute; một sự tr&ugrave;ng hợp của cả 4 đội b&oacute;ng n&agrave;y l&agrave; họ đều được thi đấu ba trận v&ograve;ng bảng tr&ecirc;n s&acirc;n nh&agrave;.</p>\r\n\r\n<p style=\"text-align: justify;\">Euro 2020 l&agrave; giải đấu đầu ti&ecirc;n được tổ chức theo thể thức mới khi diễn ra ở 12 th&agrave;nh phố ở 12 quốc gia ch&acirc;u &Acirc;u. Điều n&agrave;y c&oacute; thể gi&uacute;p giải đấu&nbsp;<a data-auto-link-id=\"5fd33c895333a60018f3a1e8\" href=\"https://dantri.com.vn/the-thao/bong-da-trong-nuoc.htm\">b&oacute;ng đ&aacute;</a>&nbsp;lớn nhất ch&acirc;u &Acirc;u c&oacute; thể lan tỏa khắp Lục địa gi&agrave; nhưng n&oacute; cũng mang tới bất c&ocirc;ng lớn.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Post/harry-kane.jpg\" style=\"width: 890px; height: 534px;\" /></p>\r\n', 'uploads/posts/Euro.jpg', 'Active', 'manhhung2011', 1625391676, 0),
(9, 'Chuyên gia cảnh báo hiểm họa đáng sợ từ nhà máy sản xuất biến chủng', 'chuyen-gia-canh-bao-hiem-hoa-dang-so-tu-nha-may-san-xuat-bien-chung', '<p style=\"text-align: justify;\">C&aacute;c chuy&ecirc;n gia cảnh b&aacute;o, người kh&ocirc;ng ti&ecirc;m chủng vắc xin ngừa Covid-19 c&oacute; thể trở th&agrave;nh &quot;nh&agrave; m&aacute;y sản xuất biến chủng&quot; của virus SARS-CoV-2.</p>\r\n', '<p style=\"text-align: justify;\">C&aacute;c chuy&ecirc;n gia cảnh b&aacute;o, người kh&ocirc;ng ti&ecirc;m chủng vắc xin ngừa Covid-19 c&oacute; thể trở th&agrave;nh &quot;nh&agrave; m&aacute;y sản xuất biến chủng&quot; của virus SARS-CoV-2.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Post/bien-chung.jpg\" style=\"width: 660px; height: 406px;\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Những người kh&ocirc;ng ti&ecirc;m chủng vắc xin ngừa&nbsp;<a data-auto-link-id=\"5fed3436b00b7a0012bca1d1\" href=\"https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm\">Covid-19</a>&nbsp;kh&ocirc;ng chỉ mạo hiểm với sức khỏe của họ m&agrave; c&ograve;n l&agrave; mối nguy hiểm với cộng đồng nếu họ nhiễm virus, c&aacute;c chuy&ecirc;n gia về bệnh truyền nhiễm cảnh b&aacute;o. Điều n&agrave;y l&agrave; bởi nguồn duy nhất của c&aacute;c biến chủng SARS-CoV-2 l&agrave; cơ thể người nhiễm bệnh.</p>\r\n\r\n<p style=\"text-align: justify;\">&quot;Người kh&ocirc;ng ti&ecirc;m vắc xin c&oacute; nguy cơ trở th&agrave;nh c&aacute;c nh&agrave; m&aacute;y sản xuất biến chủng&quot;, William Schaffner, gi&aacute;o sư tại Khoa Bệnh truyền nhiễm tại Trung t&acirc;m Y tế Đại học Vanderbilt, cảnh b&aacute;o. Chuy&ecirc;n gia n&agrave;y nhấn mạnh: &quot;C&agrave;ng nhiều người kh&ocirc;ng ti&ecirc;m chủng, virus c&agrave;ng c&oacute; cơ hội sinh s&ocirc;i v&agrave; đột biến, v&agrave; thậm ch&iacute; c&oacute; thể tạo ra đột biến mới nguy hiểm hơn&quot;.</p>\r\n\r\n<p style=\"text-align: justify;\">Tất cả c&aacute;c virus đều biến đổi v&agrave; hầu hết theo hướng suy yếu đi, nhưng vẫn c&oacute; những trường hợp virus biến đổi theo hướng mang lại cho n&oacute; lợi thế hơn như l&acirc;y lan nhanh hơn, khả năng l&acirc;y nhiễm vật chủ đa dạng hơn. Nếu một đột biến đủ mạnh, n&oacute; sẽ trở th&agrave;nh biến chủng. Tuy nhi&ecirc;n, để l&agrave;m được điều đ&oacute;, n&oacute; cần l&acirc;y lan v&agrave; nh&acirc;n rộng, khi đ&oacute;, một người chưa ti&ecirc;m chủng sẽ l&agrave; điều kiện thuận lợi cho qu&aacute; tr&igrave;nh đ&oacute; diễn ra.</p>\r\n', 'uploads/posts/bien-chung - Copy(1).jpg', 'Active', 'manhhung2011', 1625392228, 1625392323);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(40) NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` int(100) NOT NULL,
  `qty` int(40) NOT NULL DEFAULT 0,
  `excerpt` mediumtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `cat_id` int(40) NOT NULL,
  `status` enum('Active','Passive') COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Active',
  `created_name` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` int(100) DEFAULT NULL,
  `last_update` int(100) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `code`, `price`, `qty`, `excerpt`, `content`, `image`, `cat_id`, `status`, `created_name`, `created_at`, `last_update`) VALUES
(2, 'Iphone 7 ', 'WEB00001', 15000000, 1, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n', '<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n', 'uploads/products/iphone-7-2.jpg', 3, 'Active', 'manhhung2011', 1743874498, 1625417260),
(3, 'Iphone 8', 'WEB00003', 2000000, 1, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n', '<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave;</p>\r\n', 'uploads/products/iphone-8-3.jpg', 3, 'Active', 'manhhung2011', 1623403967, 1625417359),
(4, 'Iphone 12', 'WEB00004', 100000000, 10, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n', '<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Dien%20thoai/iphone-12.jpg\" style=\"width: 225px; height: 225px;\" /></p>\r\n', 'uploads/products/iphone-12-pro-512.jpg', 3, 'Active', 'manhhung2011', 1623407427, 1625417492),
(5, 'Iphone 12 Pro max', 'WEB00005', 50000000, 5, '<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Dien%20thoai/iphone-12-pro-max.jpg\" style=\"width: 225px; height: 225px;\" /></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n', 'uploads/products/iphone-12-pro-max-2.jpg', 3, 'Active', 'manhhung2011', 1623408461, 1625417540),
(6, 'Laptop Acer 440', 'WEB00006', 14700000, 1, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz) Đồ họa :Intel HD Graphics Ổ đĩa cứng :500 GB (HDD) Sản phẩm: C&ograve;n h&agrave;ng</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Dien%20thoai/Laptop-Probook.jpg\" style=\"width: 273px; height: 185px;\" /></p>\r\n', 'uploads/products/acer-1.jpg', 6, 'Active', 'manhhung2011', 1623417066, 1625415590),
(7, 'Laptop Acer 440 G3 ', 'WEB00007', 49000000, 1, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz) Đồ họa :Intel HD Graphics Ổ đĩa cứng :500 GB (HDD) Sản phẩm: C&ograve;n h&agrave;ng</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Dien%20thoai/Laptop.jpg\" style=\"width: 272px; height: 185px;\" /></p>\r\n', 'uploads/products/acer-1 - Copy(1).jpg', 6, 'Active', 'manhhung2011', 1623417610, 1625503517),
(8, 'Iphone 5', 'WEB00008', 5000000, 1, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz) Đồ họa :Intel HD Graphics Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Dien%20thoai/iphone-5.jpg\" style=\"width: 225px; height: 225px;\" /></p>\r\n', 'uploads/products/iphone-7-1.jpg', 3, 'Active', 'manhhung2011', 1623429421, 1625417594),
(9, 'Iphone 7s Plus', 'WEB00009', 75000000, 1, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz) Đồ họa :Intel HD Graphics Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Dien%20thoai/Iphone/Iphone-7s-Plus.jpg\" style=\"width: 225px; height: 225px;\" /></p>\r\n', 'uploads/products/iphone-8-8-plus.jpg', 3, 'Active', 'manhhung2011', 1623495256, 1625417635),
(10, 'Acer Aspire Intel Core i5', 'WEB000010', 7950000, 1, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz) Đồ họa :Intel HD Graphics Ổ đĩa cứng :500 GB (HDD) Sản phẩm: C&ograve;n h&agrave;ng</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Laptop/Acer/Acer-aspire-intel-corei5.jpg\" style=\"width: 158px; height: 210px;\" /></p>\r\n', 'uploads/products/4764_acer_nitro_an515 - Copy.jpg', 6, 'Active', 'manhhung2011', 1623505768, 1625503542),
(11, 'Acer Aspire Intel Core i5 ', 'WEB000011', 25000000, 4, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz) Đồ họa :Intel HD Graphics Ổ đĩa cứng :500 GB (HDD) Sản phẩm: C&ograve;n h&agrave;ng</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Laptop/Acer/Acer-Nitro-5-2019.jpg\" style=\"width: 210px; height: 210px;\" /></p>\r\n', 'uploads/products/Acer-aspire-intel.jpg', 6, 'Active', 'manhhung2011', 1623514090, 1625415866),
(12, 'Acer Nitro 5 2019', 'WEB000012', 25000000, 2, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz) Đồ họa :Intel HD Graphics Ổ đĩa cứng :500 GB (HDD) Sản phẩm: C&ograve;n h&agrave;ng</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Laptop/Acer/Acer-Nitro-5-2019.jpg\" style=\"width: 210px; height: 210px;\" /></p>\r\n', 'uploads/products/4764_acer_nitro_an515.jpg', 6, 'Active', 'manhhung2011', 1623514139, 1625415957),
(13, 'Dell Aspire Intel Core', 'WEB000013', 25000000, 20, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Laptop/Dell/DELL-Inspiron-15-3505-Y1N1T1.png\" style=\"width: 131px; height: 110px;\" /></p>\r\n', 'uploads/products/dell-inspiron600x600.jpg', 7, 'Active', 'manhhung2011', 1623595141, 1625415216),
(14, 'Laptop Dell XPS 13 9310', 'WEB000014', 50000000, 10, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Laptop/Dell/Dell-xps-13.png\" style=\"width: 165px; height: 110px;\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n', 'uploads/products/DELL - Copy.jpg', 7, 'Active', 'manhhung2011', 1623749332, 1625415322),
(15, 'Samsung Galaxy A72 ', 'WEB000015', 35000000, 30, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Dien%20thoai/Samsung/sam-sung-a52.jpg\" style=\"width: 225px; height: 225px;\" /></p>\r\n', 'uploads/products/samsung-galaxy.jpg', 4, 'Active', 'manhhung2011', 1623858871, 1625417758),
(16, 'Oppo a92', 'WEB000016', 2000000, 10, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Dien%20thoai/Oppo/oppo-a92.png\" style=\"width: 177px; height: 215px;\" /></p>\r\n', 'uploads/products/oppo-a92-2.jpg', 5, 'Active', 'manhhung2011', 1624099834, 1625417900),
(17, 'Acer Aspire 7 A715-42G-R4ST', 'WEB000017', 13800000, 30, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz) Đồ họa :Intel HD Graphics Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Laptop/Acer/Acer-aspire-7-a715.png\" style=\"width: 177px; height: 220px;\" /></p>\r\n', 'uploads/products/acer-1 - Copy.jpg', 6, 'Active', 'manhhung2011', 1624325918, 1625415981),
(18, 'ACER NITRO 5 2020', 'WEB000018', 13999999, 20, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3) Cache upto 2.7 GHz Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz) Đồ họa :Intel HD Graphics Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Laptop/Acer/Acer-nitro-5-2020.png\" style=\"width: 177px; height: 196px;\" /></p>\r\n', 'uploads/products/acer-aspire-a715-600x600-600x400 - Copy(1).jpg', 6, 'Active', 'manhhung2011', 1624326030, 1625416004),
(19, 'Dell G7 Series 7588', 'WEB000019', 18980000, 10, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Laptop/Dell/Dell-g7-7588.png\" style=\"width: 177px; height: 233px;\" /></p>\r\n', 'uploads/products/Dell-G7.jpg', 7, 'Active', 'manhhung2011', 1624326197, 1625415403),
(20, 'Dell Inspiron 14 7490 ', 'WEB000020', 22550000, 10, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Laptop/Dell/Dell-inspiron-14.png\" style=\"width: 177px; height: 185px;\" /></p>\r\n', 'uploads/products/DELL - Copy(1).jpg', 7, 'Active', 'manhhung2011', 1624327454, 1625415424),
(21, 'Đồng hồ nam Nektom', 'WEB000021', 4500000, 21, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Trang%20s%E1%BB%A9c/Dong%20ho/dong-ho-nam-nektom.jpg\" style=\"width: 210px; height: 210px;\" /></p>\r\n', 'uploads/products/dong-ho-nektom.jpg', 10, 'Active', 'manhhung2011', 1624846705, 1625416093);
INSERT INTO `tbl_product` (`product_id`, `product_name`, `code`, `price`, `qty`, `excerpt`, `content`, `image`, `cat_id`, `status`, `created_name`, `created_at`, `last_update`) VALUES
(22, 'Đồng hồ Rolex Day-date', 'WEB000022', 15000000, 30, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Trang%20s%E1%BB%A9c/Dong%20ho/dong-ho-rolex.jpg\" style=\"width: 230px; height: 230px;\" /></p>\r\n', 'uploads/products/rolex.jpg', 10, 'Active', 'manhhung2011', 1624846840, 1625416178),
(23, 'DÂY CHUYỀN VÀNG TÂY', 'WEB000023', 4300000, 10, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Trang%20s%E1%BB%A9c/Day%20chuyen/day-chuyen-vang-nam.jpg\" style=\"width: 500px; height: 500px;\" /></p>\r\n', 'uploads/products/day-chuyen.jpg', 11, 'Active', 'manhhung2011', 1624847045, 1625416352),
(24, 'Dây chuyền nữ vàng italy', 'WEB000024', 22000000, 10, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/Trang%20s%E1%BB%A9c/Day%20chuyen/day-chuyen-nu-italy.jpg\" style=\"width: 480px; height: 480px;\" /></p>\r\n', 'uploads/products/day-chuyen-itali.png', 11, 'Active', 'manhhung2011', 1624847289, 1625416419),
(25, 'iPad Pro 11 2020 128GB', 'WEB000025', 18000000, 20, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/May%20tinh%20bang/Ipad/ipad-pro-11.jpg\" style=\"width: 210px; height: 210px;\" /></p>\r\n', 'uploads/products/ipad-pro-2020-11-inch (1).jpg', 12, 'Active', 'manhhung2011', 1624847473, 1625416515),
(26, 'iPad Pro 12.9 M1 2021', 'WEB000026', 18500000, 12, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/May%20tinh%20bang/Ipad/Ipad-pro-12.jpg\" style=\"width: 210px; height: 210px;\" /></p>\r\n', 'uploads/products/ipad-pro-m1-2021 (1).jpg', 12, 'Active', 'manhhung2011', 1624847604, 1625416658),
(27, 'Lenovo Tab M8', 'WEB000027', 4560000, 30, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/May%20tinh%20bang/Lenovo/lenovo-tab-m8.jpg\" style=\"width: 210px; height: 210px;\" /></p>\r\n', 'uploads/products/lenovo-1 - Copy.jpg', 13, 'Active', 'manhhung2011', 1624847715, 1625416742),
(28, 'Lenovo Tab M10', 'WEB000028', 3900000, 18, '<p>Bộ vi xử l&yacute; :Intel Core i505200U 2.2 GHz (3MB L3)</p>\r\n\r\n<p>Cache upto 2.7 GHz</p>\r\n\r\n<p>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</p>\r\n\r\n<p>Đồ họa :Intel HD Graphics</p>\r\n\r\n<p>Ổ đĩa cứng :500 GB (HDD)</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://localhost/unitop.vn/back-end/project/ismart.com/admin/public/js/plugins/uploads/images/Product/May%20tinh%20bang/Lenovo/tab-m10-gen-2.jpg\" style=\"width: 600px; height: 600px;\" /></p>\r\n', 'uploads/products/lenovo-tab-m10.jpg', 13, 'Active', 'manhhung2011', 1624847956, 1625416811),
(29, 'Đồng hồ nam Thụy Sỹ ', 'WEB000029', 1500000, 12, '<p style=\"text-align: justify;\">Trung t&iacute;nh</p>\r\n\r\n<p style=\"text-align: justify;\">Giảm Hơn 50% Khi Mua Sản Phẩm Đồng Hồ Nam Thụy Sỹ Ch&iacute;nh H&atilde;ng Easop - Nam - Đủ M&agrave;u - Đủ Size - Mẫu Mới Nhất Th&aacute;ng 6/2021! Số Lượng C&oacute; Hạn Mua Ngay Tại Sendo!</p>\r\n', '<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align: justify;\">M&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 l&agrave; d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay th&iacute;ch hợp cho doanh nghiệp v&agrave; những người l&agrave;m văn ph&ograve;ng. Do đ&oacute;, ngo&agrave;i cấu h&igrave;nh tốt, thiết kế bền bỉ, m&aacute;y t&iacute;nh x&aacute;ch tay HP Probook 440 G2 c&ograve;n c&oacute; khả năng bảo mật to&agrave;n diện gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m về dữ liệu của m&igrave;nh.</p>\r\n', 'uploads/products/review-top-dong-ho.jpg', 10, 'Active', 'manhhung2011', 1625321041, 1625416234);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `product_cat` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` enum('Online','Offline') COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_name` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` int(100) NOT NULL,
  `update_time` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`product_id`, `product_title`, `product_cat`, `status`, `created_name`, `created_at`, `update_time`) VALUES
(1, 'Tuyển Việt Nam đại chiến Malaysia: Lấy nhu thắng cương', 'Bóng đá', NULL, 'manhhung2011', 1743874498, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_cat`
--

CREATE TABLE `tbl_product_cat` (
  `cat_id` int(11) NOT NULL,
  `cat_title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `desc` mediumtext COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `status` enum('Active','Passive') COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` int(40) NOT NULL,
  `created_name` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `last_update` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_product_cat`
--

INSERT INTO `tbl_product_cat` (`cat_id`, `cat_title`, `parent_id`, `desc`, `status`, `created_at`, `created_name`, `last_update`) VALUES
(1, 'Điện thoại', 0, '', 'Active', 117763383, 'manhhung2011', 117763383),
(2, 'Laptop', 0, '', 'Active', 1743874447, 'manhhung2011', 1743874447),
(3, 'Iphone', 1, NULL, 'Active', 1623485857, 'manhhung2011', NULL),
(4, 'Samsung', 1, NULL, 'Active', 1623486260, 'manhhung2011', NULL),
(5, 'Oppo', 1, NULL, 'Active', 1623486378, 'manhhung2011', NULL),
(6, 'Acer', 2, NULL, 'Active', 1623504766, 'manhhung2011', NULL),
(7, 'Dell', 2, NULL, 'Active', 1623504776, 'manhhung2011', NULL),
(8, 'Trang sức', 0, NULL, 'Active', 1623834958, 'ngocanh1009', NULL),
(9, 'Máy tính bảng', 0, NULL, 'Active', 1623835066, 'ngocanh1009', NULL),
(10, 'Đồng hồ', 8, NULL, 'Active', 1624846185, 'ngocanh1009', NULL),
(11, 'Dây chuyền', 8, NULL, 'Active', 1624846212, 'ngocanh1009', NULL),
(12, 'Ipad', 9, NULL, 'Active', 1624846226, 'ngocanh1009', NULL),
(13, 'Lenovo', 9, NULL, 'Active', 1624846288, 'ngocanh1009', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `id` int(40) NOT NULL,
  `title` varchar(60) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `link` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `num_order` int(100) NOT NULL,
  `status` enum('Active','Passive') COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Passive',
  `description` varchar(1000) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_name` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` int(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_thumb`
--

CREATE TABLE `tbl_thumb` (
  `thumb_id` int(40) NOT NULL,
  `product_id` int(40) NOT NULL,
  `thumb_path` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_thumb`
--

INSERT INTO `tbl_thumb` (`thumb_id`, `product_id`, `thumb_path`) VALUES
(1, 2, 'uploads/product-thumb/iphone-7-1.jpg'),
(2, 2, 'uploads/product-thumb/iphone-7-2.jpg'),
(3, 2, 'uploads/product-thumb/iphone-7-3.jpg'),
(4, 2, 'uploads/product-thumb/iphone-8-4.jpg'),
(5, 3, 'uploads/product-thumb/iphone-8-3.jpg'),
(6, 3, 'uploads/product-thumb/iphone-8-4 - Copy.jpg'),
(7, 3, 'uploads/product-thumb/iphone-8-8-plus.jpg'),
(8, 3, 'uploads/product-thumb/iphone8-8plus_11.jpg'),
(9, 4, 'uploads/product-thumb/apple-iphone-12-1-600x400.jpg'),
(10, 4, 'uploads/product-thumb/iphone-12-pro-512.jpg'),
(11, 4, 'uploads/product-thumb/iphone-12-pro-max.jpg'),
(12, 4, 'uploads/product-thumb/iphone-12-pro-max-2.jpg'),
(13, 5, 'uploads/product-thumb/apple-iphone-12-1-600x400 - Copy.jpg'),
(14, 5, 'uploads/product-thumb/iphone-12-pro-512 - Copy.jpg'),
(15, 5, 'uploads/product-thumb/iphone-12-pro-max - Copy.jpg'),
(16, 5, 'uploads/product-thumb/iphone-12-pro-max-2 - Copy.jpg'),
(17, 6, 'uploads/product-thumb/4764_acer_nitro_an515.jpg'),
(18, 6, 'uploads/product-thumb/acer-1.jpg'),
(19, 6, 'uploads/product-thumb/acer-aspire-a715-600x600-600x400.jpg'),
(20, 6, 'uploads/product-thumb/Acer-aspire-intel.jpg'),
(21, 7, 'uploads/product-thumb/4764_acer_nitro_an515 - Copy.jpg'),
(22, 7, 'uploads/product-thumb/acer-1 - Copy.jpg'),
(23, 7, 'uploads/product-thumb/acer-aspire-a715-600x600-600x400 - Copy.jpg'),
(24, 7, 'uploads/product-thumb/Acer-aspire-intel - Copy.jpg'),
(25, 8, 'uploads/product-thumb/iphone-7-1 - Copy.jpg'),
(26, 8, 'uploads/product-thumb/iphone-7-2 - Copy.jpg'),
(27, 8, 'uploads/product-thumb/iphone-7-3 - Copy.jpg'),
(28, 8, 'uploads/product-thumb/iphone-8-3 - Copy.jpg'),
(29, 9, 'uploads/product-thumb/iphone-7-1 - Copy(1).jpg'),
(30, 9, 'uploads/product-thumb/iphone-7-3 - Copy(1).jpg'),
(31, 9, 'uploads/product-thumb/iphone-7-2 - Copy(1).jpg'),
(32, 9, 'uploads/product-thumb/iphone-8-4 - Copy(1).jpg'),
(33, 10, 'uploads/product-thumb/4764_acer_nitro_an515 - Copy(1).jpg'),
(34, 10, 'uploads/product-thumb/acer-aspire-a715-600x600-600x400 - Copy(1).jpg'),
(35, 10, 'uploads/product-thumb/acer-1 - Copy(1).jpg'),
(36, 10, 'uploads/product-thumb/Acer-aspire-intel - Copy(1).jpg'),
(37, 11, 'uploads/product-thumb/Acer-aspire-intel - Copy(2).jpg'),
(38, 11, 'uploads/product-thumb/acer-aspire-a715-600x600-600x400 - Copy(2).jpg'),
(39, 11, 'uploads/product-thumb/acer-1 - Copy(2).jpg'),
(40, 11, 'uploads/product-thumb/4764_acer_nitro_an515 - Copy(2).jpg'),
(41, 12, 'uploads/product-thumb/4764_acer_nitro_an515 - Copy(3).jpg'),
(42, 12, 'uploads/product-thumb/acer-1 - Copy(3).jpg'),
(43, 12, 'uploads/product-thumb/acer-aspire-a715-600x600-600x400 - Copy(3).jpg'),
(44, 12, 'uploads/product-thumb/Acer-aspire-intel - Copy(3).jpg'),
(45, 13, 'uploads/product-thumb/DELL.jpg'),
(46, 13, 'uploads/product-thumb/Dell-G7.jpg'),
(47, 14, 'uploads/product-thumb/DELL - Copy.jpg'),
(48, 14, 'uploads/product-thumb/Dell-G7 - Copy.jpg'),
(49, 15, 'uploads/product-thumb/sam-sung.jpg'),
(50, 15, 'uploads/product-thumb/samsung-galaxy-a72-8gb256gb-large.jpg'),
(51, 15, 'uploads/product-thumb/samsung-galaxy-a72.jpg'),
(52, 15, 'uploads/product-thumb/samsung-galaxy.jpg'),
(53, 16, 'uploads/product-thumb/oppo-a92.jpg'),
(54, 16, 'uploads/product-thumb/oppo-a92-1 - Copy.jpg'),
(55, 16, 'uploads/product-thumb/oppo-a92-1 - Copy(1).jpg'),
(56, 16, 'uploads/product-thumb/oppo-a92-1 - Copy(2).jpg'),
(57, 16, 'uploads/product-thumb/oppo-a92-4.jpg'),
(58, 16, 'uploads/product-thumb/oppo-a92-2 - Copy.jpg'),
(59, 17, 'uploads/product-thumb/4764_acer_nitro_an515 - Copy(4).jpg'),
(60, 17, 'uploads/product-thumb/acer-1 - Copy(4).jpg'),
(61, 17, 'uploads/product-thumb/acer-aspire-a715-600x600-600x400 - Copy(4).jpg'),
(62, 17, 'uploads/product-thumb/Acer-aspire-intel - Copy(4).jpg'),
(63, 18, 'uploads/product-thumb/acer-1 - Copy(5).jpg'),
(64, 18, 'uploads/product-thumb/4764_acer_nitro_an515 - Copy(5).jpg'),
(65, 18, 'uploads/product-thumb/acer-aspire-a715-600x600-600x400 - Copy(5).jpg'),
(66, 18, 'uploads/product-thumb/Acer-aspire-intel - Copy(5).jpg'),
(67, 19, 'uploads/product-thumb/DELL - Copy(1).jpg'),
(68, 19, 'uploads/product-thumb/Dell-G7 - Copy(1).jpg'),
(69, 20, 'uploads/product-thumb/DELL - Copy(2).jpg'),
(70, 20, 'uploads/product-thumb/Dell-G7 - Copy(2).jpg'),
(71, 21, 'uploads/product-thumb/dong-ho-nektom.jpg'),
(72, 21, 'uploads/product-thumb/dong-ho-thuy-si.jpg'),
(73, 21, 'uploads/product-thumb/rolex.jpg'),
(74, 21, 'uploads/product-thumb/review-top-dong-ho.jpg'),
(75, 22, 'uploads/product-thumb/dong-ho-nektom - Copy.jpg'),
(76, 22, 'uploads/product-thumb/dong-ho-thuy-si - Copy.jpg'),
(77, 22, 'uploads/product-thumb/review-top-dong-ho - Copy.jpg'),
(78, 22, 'uploads/product-thumb/rolex - Copy.jpg'),
(79, 23, 'uploads/product-thumb/day-chuyen.jpg'),
(80, 23, 'uploads/product-thumb/day-chuyen-bac.jpg'),
(81, 23, 'uploads/product-thumb/day-chuyen-hcm.jpg'),
(82, 23, 'uploads/product-thumb/day-chuyen-itali.png'),
(83, 24, 'uploads/product-thumb/day-chuyen - Copy.jpg'),
(84, 24, 'uploads/product-thumb/day-chuyen-bac - Copy.jpg'),
(85, 24, 'uploads/product-thumb/day-chuyen-hcm - Copy.jpg'),
(86, 24, 'uploads/product-thumb/day-chuyen-itali - Copy.png'),
(87, 25, 'uploads/product-thumb/ipad-pro.jpg'),
(88, 25, 'uploads/product-thumb/ipad-pro-2020-11-inch (1).jpg'),
(89, 25, 'uploads/product-thumb/ipad-pro-2020-12-9-inch (1).jpg'),
(90, 25, 'uploads/product-thumb/ipad-pro-m1-2021 (1).jpg'),
(91, 26, 'uploads/product-thumb/ipad-pro - Copy.jpg'),
(92, 26, 'uploads/product-thumb/ipad-pro-2020-11-inch (1) - Copy.jpg'),
(93, 26, 'uploads/product-thumb/ipad-pro-2020-12-9-inch (1) - Copy.jpg'),
(94, 26, 'uploads/product-thumb/ipad-pro-m1-2021 (1) - Copy.jpg'),
(95, 27, 'uploads/product-thumb/lenovo-1 - Copy(1).jpg'),
(96, 27, 'uploads/product-thumb/lenovo-m10.jpg'),
(97, 27, 'uploads/product-thumb/lenovo-new.jpg'),
(98, 27, 'uploads/product-thumb/lenovo-tab-m10.jpg'),
(99, 28, 'uploads/product-thumb/lenovo-1 - Copy(2).jpg'),
(100, 28, 'uploads/product-thumb/lenovo-m10 - Copy.jpg'),
(101, 28, 'uploads/product-thumb/lenovo-new - Copy.jpg'),
(102, 28, 'uploads/product-thumb/lenovo-tab-m10 - Copy.jpg'),
(103, 29, 'uploads/product-thumb/dong-ho-thuy-si - Copy(1).jpg'),
(104, 29, 'uploads/product-thumb/dong-ho-nektom - Copy(1).jpg'),
(105, 29, 'uploads/product-thumb/review-top-dong-ho - Copy(1).jpg'),
(106, 29, 'uploads/product-thumb/rolex - Copy(1).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `reg_date` int(20) NOT NULL,
  `active_token` varchar(60) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT '0',
  `reset_token` varchar(40) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `last_update` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `fullname`, `username`, `password`, `email`, `gender`, `reg_date`, `active_token`, `is_active`, `reset_token`, `last_update`) VALUES
(2, 'Đỗ Thị Ngọc Ánh', 'ngocanhxinhgai', '98162006e818dba454315214c72834df', 'nguyenmanhhung201106@gmail.com', 'Female', 1624890279, '02588f0833d1a32327ff9b808be9f386', '1', '', NULL),
(3, 'Nguyễn Mạnh Hùng', 'manhhung2011', 'a84f2beef4ef5ae769effbff0e9b7599', 'nguyenmanhhung201102@gmail.com', 'Male', 1625507309, '69c081ce2df9ecddc99d7f8f344f7e82', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_date` int(11) DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone_number` varchar(12) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `role` enum('1','2','3') COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `active_token` varchar(60) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT '0',
  `reset_token` varchar(40) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `fullname`, `username`, `email`, `created_date`, `password`, `address`, `phone_number`, `role`, `active_token`, `is_active`, `reset_token`) VALUES
(2, 'Nguyễn Mạnh Hùng', 'manhhung2011', 'nguyenmanhhung201103@gmail.com', 1623146702, 'a84f2beef4ef5ae769effbff0e9b7599', 'Thon dai lu xa dong ich huyen lap thach tinh vinh phuc', '0399809781', '1', '', '1', '697c4f283175ddf24eff7d9446024696'),
(5, 'Đỗ Thị Ngọc Ánh', 'ngocanh1009', 'nguyenmanhhung201102@gmail.com', 1623693905, '1a9e6f2cb4bcff0fdb72462b36c5219f', 'Th&ocirc;n Cẩm B&igrave;nh X&atilde; T&acirc;n Lập Huyện S&ocirc;ng L&ocirc; Tỉnh Vĩnh Ph&uacute;c', '0399809781', NULL, 'bd360efc3f9bc958e979cb211a6265a1', '1', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `tbl_order_detail_ibfk_2` (`product_id`);

--
-- Indexes for table `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_page_list`
--
ALTER TABLE `tbl_page_list`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_product_cat`
--
ALTER TABLE `tbl_product_cat`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_thumb`
--
ALTER TABLE `tbl_thumb`
  ADD PRIMARY KEY (`thumb_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_page_list`
--
ALTER TABLE `tbl_page_list`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_product_cat`
--
ALTER TABLE `tbl_product_cat`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_thumb`
--
ALTER TABLE `tbl_thumb`
  MODIFY `thumb_id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD CONSTRAINT `tbl_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `tbl_product_cat` (`cat_id`);

--
-- Constraints for table `tbl_thumb`
--
ALTER TABLE `tbl_thumb`
  ADD CONSTRAINT `tbl_thumb_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
