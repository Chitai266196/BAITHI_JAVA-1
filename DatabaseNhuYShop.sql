
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 24, 2017 at 02:55 AM
-- Server version: 10.0.28-MariaDB
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `u544892810_nhuyd`
--

-- --------------------------------------------------------

--
-- Table structure for table `Chitietdonhang`
--

CREATE TABLE IF NOT EXISTS `Chitietdonhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `madonhang` int(11) NOT NULL,
  `masanpham` int(11) NOT NULL,
  `tensanpham` varchar(200) NOT NULL,
  `giasanpham` int(11) NOT NULL,
  `soluongsanpham` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Donhang`
--

CREATE TABLE IF NOT EXISTS `Donhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenkhachhang` varchar(200) NOT NULL,
  `sodienthoai` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenloaisanpham` varchar(200) NOT NULL,
  `hinhanhloaisanpham` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`id`, `tenloaisanpham`, `hinhanhloaisanpham`) VALUES
(1, 'Điện thoại', 'http://icons.iconarchive.com/icons/designbolts/free-multimedia/64/iPhone-icon.png'),
(2, 'Laptop', 'https://cdn0.iconfinder.com/data/icons/media-5/512/laptop-64.png');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE IF NOT EXISTS `sanpham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tensanpham` varchar(200) NOT NULL,
  `giasanpham` int(15) NOT NULL,
  `hinhanhsanpham` varchar(200) NOT NULL,
  `motasanpham` varchar(10000) NOT NULL,
  `idloaisanpham` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `giasanpham`, `hinhanhsanpham`, `motasanpham`, `idloaisanpham`) VALUES
(5, 'Samsung Galaxy J7 Prime 32GB (Đen) - Hãng Phân phối chính thức  ', 4899000, 'http://vn-live-03.slatic.net/p/2/samsung-galaxy-j7-prime-32gb-den-hang-phan-phoi-chinh-thuc-3744-5397182-12d006b16edcb58bb3a72cfe93bad3ac-webp-product.jpg', 'Thiết kế sang trọng Galaxy J7 Prime sở hữu thiết kế khá quen thuộc của Samsung cho các chiếc smartphone tầm trung của mình ra mắt trong thời gian gần đây mà điển hình là chiếc Galaxy C5 cho thị trường Trung Quốc. Máy mang trong mình vẻ nGoài thanh mảnh với các góc cạnh được bo tròn mềm mại cho bạn cảm giác cầm nắm khá thoải mái.', 1),
(6, 'Sony Xperia XA 16GB ( Trắng ) - Hãng phân phối chính thức  ', 3690000, 'http://vn-live-03.slatic.net/p/2/sony-xperia-xa-16gb-trang-hang-phan-phoi-chinh-thuc-6211-9804184-c4dedc8344062e33372a8319012adbeb-webp-product.jpg', 'Điện thoại Sony Xperia XA thuộc series Xperia X được giới thiệu lần đầu tại MWC 2016. Máy được xem là bước đi mới của thương hiệu điện thoại đến từ “xứ sở hoa anh đào” nhằm định hình lại dòng sản phẩm trong phân khúc tầm trung của hãng. Qua đó, tạo sức cạnh tranh mới trên thị trường smartphone đang ngày càng khốc liệt. Sony Xperia XA được đổi mới với một thiết kế đẹp mắt. Cấu hình mạnh mẽ với vi xử lý 64-bit 8nhân và camera được đầu tư kỹ lưỡng. Sản phẩm hứa hẹn sẽ thu hút được nhiều sự quan tâm của giới công nghệ cũng như người dùng yêu thích thương hiệu Sony.\r\n\r\nThiết kế mới mẻ, không viền cạnh', 1),
(7, 'Apple Macbook Air MMGG2 13.3inch (Bạc) - Hàng nhập khẩu  ', 22943000, 'http://vn-live-01.slatic.net/p/2/apple-macbook-air-mmgg2-133inch-bac-hang-nhap-khau-8870-9845712-86ce6644cfa51f10adf11b1c7c9910f0-webp-product.jpg', 'Bên cạnh việc ra mắt MacBook 12 mới thì Apple cũng nâng cấp luôn MacBook Air phiên bản 13", bằng cách nâng cấp RAM từ 4 GB lên thành 8GB và hệ điều hành OS X El Capitan. Trước đó nếu muốn lên 8GB RAM thì người dùng phải bỏ ra thêm 100 USD còn bây giờ thì nó đã trở thành cấu hình tiêu chuẩn với giá bán không thay đổi nhiều. MacBook Air 11" vẫn giữ nguyên mức RAM cũ là 4 GB.\r\n\r\n\r\nVới mức RAM mới, MacBook Air 13" sẽ có tính cạnh tranh cao hơn so với các đối thủ và đây cũng chính là dung lượng RAM mặc định của MacBook Pro Retina 15" vài năm trước đây (bây giờ đã là 16GB). Các thông số khác bao gồm: màn hình 13.3" độ phân giải như cũ 1440x900, ổ lưu trữ SSD PCIe 256GB, CPU Intel Core i5 hai nhân 1.6 GHz, card đồ họa Intel HD Graphics 6000, nặng 1,35 kg và pin lướt web 12 tiếng và cả hệ điều hành OS X El Capitan với hiệu suất ứng dụng nhanh và mượt hơn các bản trước.', 2),
(8, 'Laptop Lenovo 80RK0041VN 14 inch (Đen) - Hãng phân phối chính thức', 6900000, 'http://vn-live-03.slatic.net/p/2/laptop-lenovo-80rk0041vn-14-inch-den-hang-phan-phoi-chinh-thuc-0392-1475703-13261974a90f1d17eb6ad2f972460a4e-webp-product.jpg', 'Laptop Lenovo IdeaPad 100 80RK0041VN được thiết kế chắc chắn, mạnh mẽ với bề ngoài vuông vắn cùng màu đen lịch lãm, lớp vỏ chống bám vân tay, mồ hôi. Góc cạnh bo tròn giúp cầm thoải mái, trọng lượng nhẹ dễ dàng di chuyển.\r\n\r\n\r\nMàn hình 14.1 inch\r\nMàn hình 14.1 inch, độ phân giải 1366 x 768 pixels, chuẩn HD có khả năng hiển thị hình ảnh đẹp và sắc nét, màu sắc tươi tắn, sống động, sử dụng công nghệ chống lóa giúp nhìn tốt trong mọi điều kiện sáng.', 2),
(9, 'Samsung Galaxy S8 64G Ram 4GB 5.8inch (Đen) - Hãng phân phối chính thức', 15834000, 'http://vn-live-02.slatic.net/p/2/samsung-galaxy-s8-64g-ram-4gb-58inch-den-hang-phan-phoi-chinhthuc-4429-6077765-e33965110eaa33dd96e7b768bc4018c5-webp-product.jpg', 'Màu	Đen huyền bí\r\nCổng kết nối	smart connector\r\nTablet Connection	Smart Connector\r\nCPU Speed	2-3GHz\r\nĐộ phân giải màn hình (pixels)	1440 x 2960\r\nKích thước màn hình	5.8\r\nLoại màn hình	Super AMOLED\r\nĐộ phân giải camera (MP)	12.0\r\nMẫu mã	Samsung Galaxy S8 (Đen) - Tặng loa Level Box Slim + pin sạc dựphòngSamsung 2017 10.000 mAH - Hãng phân phối chính thức\r\nSố lượng nhân	8\r\nHệ điều hành	Android\r\nTrọng lượng (KG)	0.155\r\nSản xuất tại	Việt Nam\r\nRAM memory	4GB\r\nBộ nhớ trong (GB)	64\r\nThời gian bảo hành	12 tháng\r\nLoại hình bảo hành	Bảo hành điện tử', 1),
(10, 'Laptop Asus X441SA-WX020D 14inch (Đen)', 5249000, 'http://vn-live-02.slatic.net/p/2/laptop-asus-x441sa-wx020d-14inch-den-hang-phan-phoi-chinh-thuc-0324-1571803-8ea6e4c84b4d0b2c2b98e48c0deb3728-webp-product.jpg', 'Laptop Asus X441SA thuộc dòng ASUS VivoBook X Series được thiết kế để mang đến cho người dùng một trải nghiệm điện toán đa phương tiện hoàn chỉnh. Máy được vận hành trên nền bộ vi xử lý của Intel bên cạnh công nghệ âm thanh SonicMaster độc quyền tích hợp ICEpower, cho bạn chất lượng âm thanh và hình ảnh tuyệt vời nhất chưa từng được trang bị trên máy tính xách tay.', 2),
(11, 'Laptop Dell Latitude E6430 core i5 3320 Ram 8g HDD 1000g', 8137000, 'http://vn-live-01.slatic.net/p/2/laptop-dell-latitude-e6430-core-i5-3320-ram-8g-hdd-1000g-hangnhap-khau-6680-2506333-90a0d80a806d03f88a8ba786190e7181-webp-product.jpg', 'Máy có độ bền cao, pin tốt, hiệu suất cao nhưng hơi đáng tiếc là khá nặng.\r\n\r\nDòng sản phẩm máy tính xách tay Latitude của Dell được sản xuất theo định hướng hiệu suất manh mẽ, phong cách, độ bền cao và hướng đến đối tượng khách hàng là doanh nhân. Phiên bản Latitude E6430 của Dell vẫn tiếp tục truyền thống của dòng sản phẩm Latitude, hứa hẹn mang đến cho người dùng một hiệu suất mạnh mẽ, thiết kế hấp dẫn, khung kim loại bền và thời lượng pin hơn 10 giờ.', 2),
(12, 'Sony Xperia XA 16GB ( Trắng ) - Hãng phân phối chính thức', 3690000, 'http://vn-live-03.slatic.net/p/2/sony-xperia-xa-16gb-trang-hang-phan-phoi-chinh-thuc-6211-9804184-c4dedc8344062e33372a8319012adbeb-webp-product.jpg', 'Điện thoại Sony Xperia XA thuộc series Xperia X được giới thiệu lần đầu tại MWC 2016. Máy được xem là bước đi mới của thương hiệu điện thoại đến từ “xứ sở hoa anh đào” nhằm định hình lại dòng sản phẩm trong phân khúc tầm trung của hãng. Qua đó, tạo sức cạnh tranh mới trên thị trường smartphone đang ngày càng khốc liệt. Sony Xperia XA được đổi mới với một thiết kế đẹp mắt. Cấu hình mạnh mẽ với vi xử lý 64-bit 8nhân và camera được đầu tư kỹ lưỡng. Sản phẩm hứa hẹn sẽ thu hút được nhiều sự quan tâm của giới công nghệ cũng như người dùng yêu thích thương hiệu Sony', 1),
(13, 'Samsung Galaxy J5 Prime (White Gold) - Hàng phân phối chính thức', 3950000, 'http://vn-live-02.slatic.net/p/2/samsung-galaxy-j5-prime-white-gold-hang-phan-phoi-chinh-thuc-1372-1990243-026d40f55b34d7ca043df12bbbc21965-webp-product.jpg', 'Màu	Vàng\r\nCổng kết nối	MicroSD, 3.5mm, MicroUSB\r\nTablet Connection	Smart Connector\r\nCPU Speed	1-2Ghz\r\nĐộ phân giải màn hình (pixels)	720 x 1280\r\nKích thước màn hình	5.0\r\nLoại màn hình	TFT\r\nĐộ phân giải camera (MP)	13.0\r\nMẫu mã	J5 Prime\r\nSố lượng nhân	4\r\nHệ điều hành	Android 6.0 Marshmallow\r\nKích thước sản phẩm (D x R x C cm)	15 x 7 x 0.8\r\nTrọng lượng (KG)	0.3\r\nSản xuất tại	Hàn Quốc\r\nRAM memory	3GB\r\nBộ nhớ trong (GB)	16\r\nThời gian bảo hành	12 tháng\r\nLoại hình bảo hành	Bằng Phiếu bảo hành và Hóa đơn', 1),
(14, 'Laptop Dell Inspiron 13-7359 Core i7-6500U', 20000000, 'http://vn-live-03.slatic.net/p/2/laptop-dell-inspiron-13-7359-core-i7-6500u-25ghz-256-ssd-8gb133-inch-tang-cap-dell-hang-nhap-khau-8882-2514394-d13c560e87f8636d70a5df9f319c9073-webp-product.jpg', 'Battery Life	6-10 giờ\r\nCamera trước	0-1 MP\r\nBộ vi xử lý	Intel Core i5\r\nCPU Speed	2-3GHz\r\nKích thước màn hình	14.0\r\nGraphics Card	Intel và Nvidia\r\nGraphics Memory	2GB\r\nHard Drive Capacity	1TB\r\nInput/Output Ports	USB 3.0\r\nMẫu mã	laptop\r\nHệ điều hành	Windows\r\nProcessor Type	Dual-core\r\nKích thước sản phẩm (D x R x C cm)	30x20x10\r\nTrọng lượng (KG)	1.5\r\nSoftware Offerings	Windows\r\nBộ nhớ hệ thống (MB)	8GB\r\nThời gian bảo hành	12 tháng\r\nLoại hình bảo hành	Bằng Hóa đơn mua hàng\r\nWireless Connectivity	Wifi', 2),
(15, 'Apple iPhone 7 Plus 128GB (Vàng) - Hàng nhập khẩu', 19268000, 'http://vn-live-03.slatic.net/p/2/apple-iphone-7-plus-128gb-vang-hang-nhap-khau-1026-4996672-3bda9d905cb6744547967cd34db579dd-webp-product.jpg', 'Không còn jack cắm tai nghe truyền thống, thay vào đó tai tai nghe EarPod không dây hoặc kết nối thông quan đầu cắm Lightning. Dung lượng bộ nhớ được tăng đáng kể, bạn có thể sở hữu phiên bản lên đến 256GB. Ngoài những màu sắc quen thuộc, Apple đã giới thiệu đến người dùng phiên bản màu đen bóng (Jet Black) cực kỳ ấn tượng. Trọng lượng máy nhẹ hơn và màn hình sáng hơn cũng là một điểm đáng chú ý. Nhờ bỏ đi jack cắm tai nghe Apple đã có thể trang bị hệ thống loa kép với âm thanh stereo cực kỳ sống động. Apple đã loại bỏ nút Home vật lý thay bằng nút cảm ứng với công nghệ cảm ứng lực Force Touch độc đáo. Cuối cùng là pin “khủng” hơn, bộ xử lý mạnh hơn cũng như camera tốt hơn hỗ trợ quay video 4K. Mặc dù vẻ ngoài không có nhiều thay đổi nhưng hãng đã bổ sung khả năng chống nước biến chiếc iPhone 7 và 7s càng trở nên hoàn hảo hơn.\r\nĐúng như chu kì giới thiệu sản phẩm mới của Apple, iPhone thế hệ thứ 7 đã được ra mắt vào ngày 7 tháng 9. Ở thế hệ thứ 7 này, Apple đã có nhiều nâng cấp mạnh mẽ từ cấu hình chip A10 mạnh hơn 40% so với chip A9, tích hợp khả năng chống nước, Camera kép (trên iPhone 7 Plus) theo công nghệ thấu kính 6 thành phần, loa stereo, cổng tai nghe 3.5 được thay thế bằng cổng digital Lightning cho đến thiết kế với màu đen bóng (Jet Black) chủ lực...\r\nMột số thay đổi đáng chú ý từ thiết kế\r\nDải ăng ten mỏng hơn và gọn gàng hơn ở mặt sau.\r\nLoại bỏ jack cắm tai nghe 3.5mm Analog.\r\nChống nước.', 1),
(16, 'Laptop Hp Elitebook 2570p I5.3210M/4/Ssd120', 7090000, 'http://vn-live-03.slatic.net/p/2/laptop-hp-elitebook-2570p-i53210m4ssd120-hang-nhap-khau-7901-4336225-ec6eba774363c3ae11128b9bd936a75c-webp-product.jpg', 'EliteBook 2570p tiếp tục truyền thống của dòng EliteBook, cho hiệu suất mạnh mẽ, thiết kế siêu bền đáp ứng tốt các bài kiểm tra theo chuẩn quân sự MILSPEC của Mỹ.\r\n\r\nDòng máy tính xách tay EliteBook của HP từ lâu đã là một sự lựa chọn tốt đối với đối tượng doanh nhân. Đây là dòng sản phẩm có sự kết hợp mạnh mẽ giữa độ bền, sức mạnh và tính linh hoạt. Với kích thước 12,5 inch, chiếc EliteBook 2570p tiếp tục truyền thống này: hiệu suất mạnh mẽ, thiết kế siêu bền đáp ứng tốt các bài kiểm tra theo chuẩn quân sự MILSPEC của Mỹ. Máy còn đi kèm gói phần mềm bảo mật HP ProtectTools, tích hợp nhiều cổng kết nối, có ổ quang. EliteBook 2570p được bán với giá 829 USD. Với rất nhiều ưu điểm như vậy nhưng liệu đây có đúng là sự lựa chọn phù hợp?', 2),
(17, 'Samsung Galaxy J3 Pro 16GB 2 Sim (Vàng) ', 2407000, 'http://vn-live-02.slatic.net/p/2/samsung-galaxy-j3-pro-16gb-2-sim-vang-hang-nhap-khau-5659-8078942-03fccae9143d102c003b3d0a715b4d04-webp-product.jpg', 'Samsung Galaxy J3 Pro chính thức: Bản nâng cấp nhẹ của J3\r\nSamsung vừa chính thức công bố chiếc điện thoại Samsung Galaxy J3 Pro với máy ảnh được đánh giá tốt hơn, dung lượng bộ nhớ cao hơn (so với phiên bản Galaxy J3 2016) và chạy hệ điều hành Android phiên bản Lollipop.\r\n\r\n Samsung Galaxy J3 Pro chính thức ra mắt: máy ảnh tốt hơn, bộ nhớ lớn hơn, chạy Lollipop\r\n\r\nGần đây, một chiếc điện thoại bí ẩn của Samsung đã xuất hiện trên website của FCC với lời đồn đó là phiên bản Galaxy J3 2017. Và hiện tại, chiếc smartphone này đã chính thức được giới thiệu trên website của Samsung với tên gọi Galaxy J3 Pro.\r\n\r\nTheo PhoneArena, đây dường như là một phiên bản nâng cấp của Galaxy J3 (2016) vừa được ra mắt vào tháng Giêng năm nay. Galaxy J3 Pro mang đến nhiều cải tiến đáng giá so với phiên bản gốc Galaxy J3 (2016) như máy ảnh tốt hơn, bộ nhớ lưu trữ lớn hơn.', 1),
(18, 'Laptop Lenovo 80RK0041VN 14 inch (Đen)', 6900000, 'http://vn-live-03.slatic.net/p/2/laptop-lenovo-80rk0041vn-14-inch-den-hang-phan-phoi-chinh-thuc-0392-1475703-13261974a90f1d17eb6ad2f972460a4e-webp-product.jpg', 'Thiết kế chắc chắn\r\nLaptop Lenovo IdeaPad 100 80RK0041VN được thiết kế chắc chắn, mạnh mẽ với bề ngoài vuông vắn cùng màu đen lịch lãm, lớp vỏ chống bám vân tay, mồ hôi. Góc cạnh bo tròn giúp cầm thoải mái, trọng lượng nhẹ dễ dàng di chuyển.\r\n\r\n\r\n\r\nMàn hình 14.1 inch\r\nMàn hình 14.1 inch, độ phân giải 1366 x 768 pixels, chuẩn HD có khả năng hiển thị hình ảnh đẹp và sắc nét, màu sắc tươi tắn, sống động, sử dụng công nghệ chống lóa giúp nhìn tốt trong mọi điều kiện sáng.', 2),
(19, 'Apple iPhone 7 128GB (Vàng hồng) ', 17478000, 'http://vn-live-03.slatic.net/p/2/apple-iphone-7-128gb-vang-hong-hang-phan-phoi-chinh-thuc-2756-6501772-9ff90d5569bf8d48213f3f655b6022e6-webp-product.jpg', 'Đúng như những gì đã kỳ vọng, chiếc iPhone thế hệ thứ 7 của Apple chính thức ra mắt trong tháng 9 này và liên tục làm cho giới công nghệ hào hứng, cũng như các diễn đàn công nghệ nóng lên từng ngày. Ở thế hệ thứ 7 của iPhone, Apple đã nâng cấp và cải tiến bộ đôi iPhone 7 một cách mạnh mẽ từ cấu hình chip A10 mạnh hơn 40% so với chip A9, tích hợp khả năng chống nước, Camera kép (iPhone 7 Plus) theo công nghệ thấu kính 6 thành phần, Loa stereo, cổng tai nghe 3.5 được thay thế bằng cổng digital Lightning cho đến thiết kế với màu đen bóng (Jet Black) chủ lực.\r\n\r\nCác điểm khác biệt chính ở thiết kế bao gồm:\r\n\r\nDải ăng ten mỏng hơn và gọn gàng hơn ở mặt sau\r\nLoại bỏ jack cắm tai nghe 3.5mm Analog\r\nChống nước\r\nCụm camera với thiết kế mới hơn ở bản iPhone 7 Plus\r\nFlash 4 đèn\r\nXuất hiện phiên bản màu đen (Black) + đen bóng (Jet Black). iPhone 7 sẽ có 4 phiên bản màu đen, xám, bạc, vàng và vàng hồng. Bản Đen mới (Jet Black) sẽ chỉ có 128GB và 256GB.\r\nLogo Apple được làm từ thép\r\n\r\nChức năng chống nước, chống bụi IP67', 1),
(20, 'Xiaomi Redmi Note 4X 32GB (Đen Bóng)', 3331000, 'http://vn-live-02.slatic.net/p/2/xiaomi-redmi-note-4x-32gb-den-bong-nam-khanh-hang-nhap-khau-7141-7800684-ca755395545763053d092c3dfaf578f0-webp-product.jpg', 'Xiaomi Redmi 4X- Thiết kế và chất lượng hoàn thiện\r\n\r\nVề cơ bản Xiaomi Redmi 4X không có quá nhiều sự khác biệt so với những thành viên của series Redmi 4, vẫn là ngôn ngữ thiết kế truyền thống với kim loại nguyên khối cao cấp với các đường cắt kim cương tinh tế chạy dọc thân máy kết hợp với màn hình được làm cong 2.5D mang lại trải nghiệm màn hình bất tận.\r\n\r\nNhư vậy về chất lượng thiết kế, người dùng hoàn toàn có thể hài lòng bởi điều này đã được khẳng định trên các thiết bị Xiaomi trước. Tuy có phần nhạt nhẽo nhàm chán nhưng rõ ràng chúng ta không thể yêu cầu quá cao cho một thiết bị giá rẻ. Điểm mới lạ của sản phẩm này nằm ở tùy chọn màu sắc khi Xiaomi Redmi 4X được bổ sung thêm màu đen nhám đang cực kì được ưa chuộng  và chắc chắn đây sẽ là xu hướng mới trong năm 2017 này.', 1),
(21, 'Samsung Galaxy J7 Prime 32GB', 4799000, 'http://vn-live-01.slatic.net/p/2/samsung-galaxy-j7-prime-32gb-trang-vang-hang-nhap-khau-3812-6492664-7fd2792c2c05e7808ca7953f6dc45731-webp-product.jpg', 'Samsung Galaxy J7 Prime ra mắt với mục đích đánh mạnh vào phân khúc smartphone tầm trung hiện nay. Sở hữu màn hình lớn 5.5 inch Full HD, vi xử lý 8 nhân xung nhịp 1.6 GHz với 3 GB RAM chạy trên nền Android 6.0.1 cùng bộ đôi camera 13 MP/8 MP chất lượng, tất cả chỉ trong một mức giá dễ chịu của phân khúc.', 1),
(22, 'Laptop MSI GE62VR 6RF-052XVN - i7-6700HQ', 33990000, 'http://vn-live-01.slatic.net/p/2/laptop-msi-ge62vr-6rf-052xvn-i7-6700hq-156inches-fhd-hangphan-phoi-chinh-thuc-8091-4566033-4e8193d0c244c54d52a62504384317a1-webp-product.jpg', 'Bộ vi xử lý	Intel Core i7\r\nCPU Speed	2-3GHz\r\nKích thước màn hình	15.6\r\nGraphics Card	Intel và Nvidia\r\nHard Drive Capacity	1TB\r\nMẫu mã	MSI GE62VR 6RF\r\nProcessor Type	Quad-core\r\nKích thước sản phẩm (D x R x C cm)	32 x 22 x 3\r\nTrọng lượng (KG)	2.4\r\nSản xuất tại	Đài Loan, Trung Quốc\r\nBộ nhớ hệ thống (MB)	16GB & Trở lên\r\nThời gian bảo hành	2 năm\r\nLoại hình bảo hành	Bằng Phiếu bảo hành và Hóa đơn', 2),
(23, 'Laptop Xiaomi Mi Notebook Air 13.3 inch (Bạc) ', 18900000, 'http://vn-live-03.slatic.net/p/2/laptop-xiaomi-mi-notebook-air-133-inch-bac-hang-phan-phoichinh-thuc-1821-6412274-89cb6b8e8da0db9acc4299e49a6b0af3-webp-product.jpg', 'Laptop Xiaomi Mi Book 13.3 là một trong hai laptop đầu tiên do Xiaomi sản xuất. Sản phẩm đáp ứng những yêu cầu khắt khe nhất về tính thẫm mỹ lẫn hiệu năng. Phiên bản 13.3 inch được trang bị CPU Intel Core i5-6200U (3M Cache, up to 2.70 GHz), Card đồ họa NVIDIA GeForce 940MX, 1G GDDR5 mạnh mẽ cùng ổ cứng trong sử dụng công nghệ SSD có dung lượng lên tới 256GB PCIe × 4 NVMe SSD (có thể mở rộng thêm một thanh SSD), Xiaomi Mi Book Air 13.3 sử dụng bộ nhớ Ram 8GB DDR4 2133MHz. Với cấu hình mạnh mẽ nhưng Xiaomi Mi Book Air phiên bản 13.3 inch vẫn có được kích thước nhỏ gọn 309.6mm x 210.9mm x 14.8mm, Trọng lượng 1.28kg. Máy phù hợp cho hầu hết các mục đích từ văn phòng tới chơi Game, sản phẩm được cài sẵn hệ điều hành Window 10 mới nhất hiện nay.', 2),
(24, 'Laptop Asus GL552VX-DM070D i7-6700HQ 15.6 inch (Đen)', 3490000, 'http://vn-live-01.slatic.net/p/2/laptop-asus-gl552vx-dm070d-i7-6700hq-156-inch-den-hang-phanphoi-chinh-thuc-3629-6896072-7dccb936ed0fdcc07b915d58c32a4dbf-webp-product.jpg', 'ASUS GL552VX-DM070D thiết kế mạnh mẽ, khỏe khoắn với màu sắc sang trọng,mang lại đẳng cấp và ấn tượng riêng cho bạn. Nước sơn chống bám bụi và mồ hôi hiệu quả, dễ dàng cho việc mang máy đi khắp nơi.\r\n \r\n\r\n \r\nMàn hình 15.6inch\r\n \r\nMáy tính được trang bị màn hình kích thước 15.6 inch với độ phân giải Full HD 1920x1080 pixels mang đến hình ảnh được hiện lên cực kì rõ nét, sống động tới không ngờ, đáp ứng mọi nhu cầu sử dụng.', 2),
(25, 'Laptop Microsoft Surface Pro 4 Denver Broncods Type Cover', 3490000, 'http://vn-live-02.slatic.net/p/2/laptop-microsoft-surface-pro-4-denver-broncods-type-cover-7913-4817065-9956236955e0ac2e6d725709a0b4fe2b-webp-product.jpg', 'Kích thước màn hình	14.0\r\nHard Drive Capacity	Not Specified\r\nMẫu mã	SKD-024\r\nProcessor Type	Not Specified\r\nThời gian bảo hành	12 tháng\r\nLoại hình bảo hành	Bằng Tem bảo hành', 2),
(26, 'Laptop Acer Aspire E5-575-35L8 NX.GLBSV.007 15.6inch (Đen)', 9999000, 'http://vn-live-01.slatic.net/p/2/laptop-acer-aspire-e5-575-35l8-nxglbsv007-156inch-den-tang1balo-laptop-acer-hang-phan-phoi-chinh-thuc-2804-1670584-6c0b8679793fbc33360bb73c5b1c5538-webp-product.jpg', 'CPU Intel Core i3-7100U 2.4GHz - 3M\r\nDDRAM 8GB DDR4/2400MHz (2slots)\r\nHDD 500GB SATA3 5400rpm\r\nDVD-RW,  Pin: 4Cell\r\nMàn hình 15.6" FHD LED\r\nVGA Intel HD Graphics 620\r\nXuất xứ: Chính hãng ACER\r\nBảo hành: Chính hãng 12 tháng theo hoá đơn mua hàng', 2),
(27, 'Samsung Galaxy J5 Prime 16GB RAM 2GB (Vàng)', 4690000, 'http://vn-live-03.slatic.net/p/2/samsung-galaxy-j5-prime-16gb-ram-2gb-vang-hangphanphoichinhthuc-3372-0825192-4eb5f4ec7d0b19b6ffa24783921e319b-product.jpg', 'Camera Back	1 to 5MP\r\nCamera trước	5-6 MP\r\nMàu	Vàng\r\nCổng kết nối	MicroSD, 3.5mm, MicroUSB\r\nTablet Connection	Smart Connector\r\nCPU Speed	1-2Ghz\r\nĐộ phân giải màn hình (pixels)	720 x 1280\r\nKích thước màn hình	5.0\r\nLoại màn hình	TFT\r\nExpandable Memory	Yes\r\nĐộ phân giải camera (MP)	13.0\r\nMẫu mã	J5 Prime\r\nNetwork Connections	2G - GPRS\r\nSố lượng nhân	4\r\nHệ điều hành	Android\r\nOperating System Version	Marshmallow\r\nPhone Features	Fingerprint Sensor\r\nKích thước sản phẩm (D x R x C cm)	15 x 7 x 0.8\r\nTrọng lượng (KG)	0.3\r\nSản xuất tại	Hàn Quốc\r\nRAM memory	3GB\r\nScreen Type	IPS LCD\r\nSim Slots	Dual\r\nBộ nhớ trong (GB)	16\r\nThời gian bảo hành	12 tháng\r\nLoại hình bảo hành	Bằng Phiếu bảo hành và Hóa đơn\r\nWireless Connectivity	Cellular (3G/4G)', 1),
(28, 'Samsung Galaxy A7 2017 32GB (Vàng)', 9503000, 'http://vn-live-02.slatic.net/p/2/samsung-galaxy-a7-2017-32gb-vang-hang-phan-phoi-chinh-thuc-2009-9225454-96d90af9d57859399e2cfaffafdfaa9b-webp-product.jpg', 'Vẻ đẹp là sự đơn giản\r\n\r\nSamsung Galaxy A5 và A7 (2017) sở hữu thiết kế vô cùng đơn giản, mang đến một vẻ đẹp thanh lịch và hiện đại. Toàn bộ thân máy là một khối liền mạch của kim loại và kính cong 3D, camera hoàn toàn phẳng.\r\n\r\nChống nước và chống bụi\r\n\r\nSamsung Galaxy A5 và A7 (2017) được trang bị khả năng chống nước và chống bụi chuẩn IP68, cho phép bạn có thể ngâm nước liên tục ở độ sâu 1,5m trong vòng 30 phút. Bạn sẽ tránh được mọi mối nguy cơ bất ngờ từ nước và có thể sáng tạo những bức ảnh dưới nước đầy nghệ thuật.\r\n\r\nIP 68\r\n\r\nChịu được độ sâu 1,5 mét nước đến 30 phút\r\n\r\nCamera đỉnh cao cả trước và sau\r\n\r\nSở hữu camera cả trước và sau cùng độ phân giải 16MP cùng khẩu độ rộng f/1.9, cho phép thu được nhiều ánh sáng hơn, đồng nghĩa với việc chụp đêm xuất sắc hơn. Những bức hình từ camera trước của bạn sẽ thực sự chất lượng.', 1),
(29, 'Samsung Galaxy J3 8GB (Vàng)', 2816000, 'http://vn-live-03.slatic.net/p/2/samsung-galaxy-j3-8gb-vang-hang-phan-phoi-chinh-thuc-4676-3759081-75999e0c623e448adb90c4b6dcd7ad8a-webp-product.jpg', 'Smartphone J Series hoàn toàn mới \r\nGalaxy J3 là sản phẩm tiếp theo trong dòng smartphone J Series của Samsung. Nhìn chung đây là một chiếc smartphone phổ thông thiết kế đẹp, có cấu hình tốt, thời lượng pin khá dài với viên pin 2600mAh, được trang bị tính năng siêu tiết kiệm pin Ultra Saving tiên tiến. Với những tiêu chí lựa chọn smartphone như: giá trung bình, hoạt động ổn định, pin bền, camera chụp ảnh tốt thì Samsung Galaxy J3 là một đáp án hoàn hảo, với mọi chuẩn mực đều đáp ứng đầy đủ.', 1),
(30, '\r\nApple iPhone 7 128GB (Đen bóng)', 16545000, 'http://vn-live-02.slatic.net/p/2/apple-iphone-7-128gb-den-bong-hang-nhap-khau-1037-4007672-28712cf443a48ecd909bc2159438b8c3-webp-product.jpg', 'Tổng thể iPhone 7 không khác gì so với iPhone 6s hay iPhone 6 nhưng với viền ăng ten mới và hạn chế một số điểm cắt như lỗ cắm tai nghe hay phần khoét chỗ nút tăng giảm âm lượng làm cho nó nhìn mượt mà và đẹp hơn so với iPhone 6/6s. Phần camera nhìn to hơn, lồi hơi nhưng không có cảm giác cấn tay như hai đời trước. Tai nghe mới không khác thiết kế cũ, chỉ khác đầu cắm Lightning nhìn to hơn và thô hơn. Đầu đổi từ Lightning ra lỗi tai nghe tiêu chuẩn cũng không đẹp do hai đầu quá lớn so với cáp ở giữa.\r\n\r\nHộp máy được đóng seal kiểu mới, các chữ iPhone và logo màu hồng ánh kim...​', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
