-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2023 at 12:16 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `i8mart`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` bigint(50) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `product_id` int(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `title`, `slug`, `product_id`, `updated_at`, `created_at`) VALUES
(3, 'Điện thoại', 'dien-thoai', 0, '2023-05-16 08:45:18', '2023-05-16 08:45:18'),
(5, 'Laptop', 'laptop', 0, '2023-05-22 18:55:45', '2023-05-16 08:48:22'),
(6, 'Iphone', 'iphone', 3, '2023-05-16 08:49:03', '2023-05-16 08:49:03'),
(7, 'Samsung', 'samsung', 3, '2023-05-16 08:49:24', '2023-05-16 08:49:24'),
(13, 'Dell', 'dell', 5, '2023-05-16 20:54:33', '2023-05-16 20:54:33'),
(15, 'Đồng Hồ', 'dong-ho', 0, '2023-05-21 19:35:52', '2023-05-21 19:35:52'),
(17, 'MacBook', 'macbook', 5, '2023-05-21 22:48:20', '2023-05-21 22:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_01_0729d20_create_products_table', 1),
(6, '2023_04_28_091e142_create_pages_table', 1),
(7, '2023_05_02_105015_add_column_to_table_product', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(50) UNSIGNED NOT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `note` varchar(300) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `info_product` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `fullname` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `payment_method`, `email`, `note`, `info_product`, `fullname`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'direct-payment', '123123@gmail.com', '123', '[{\"title\":\"\\u0110i\\u1ec7n tho\\u1ea1i iPhone 13 Pro\",\"quantity\":2,\"price\":29155500,\"total_price\":\"119,818,000\",\"slug\":\"dien-thoai-iphone-13-pro\",\"image\":\"uploads\\/1684256210_iphone-13-pro-sierra-blue-600x600.jpg\"},{\"title\":\"\\u0110\\u1ed3ng h\\u1ed3 CITIZEN 40\",\"quantity\":1,\"price\":8972000,\"total_price\":\"119,818,000\",\"slug\":\"dong-ho-citizen-40\",\"image\":\"uploads\\/1684723119_dong-ho-1.jpg\"},{\"title\":\"\\u0110\\u1ed3ng h\\u1ed3 ROLEX\",\"quantity\":1,\"price\":18635000,\"total_price\":\"119,818,000\",\"slug\":\"dong-ho-rolex\",\"image\":\"uploads\\/1684723649_dong-ho-9.jpg\"},{\"title\":\"Laptop Apple MacBook Air M1 2020\",\"quantity\":1,\"price\":33900000,\"total_price\":\"119,818,000\",\"slug\":\"laptop-apple-macbook-air-m1-2020\",\"image\":\"uploads\\/1684734729_1668653033-space-1-org-1-copy.jpg\"}]', '213', 'pending', '2023-05-24 03:00:07', '2023-05-24 03:00:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `status`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Giới thiệu', '<div class=\"section-head clearfix\">\r\n<p dir=\"rtl\"><img title=\"gioi-thieu-khi-di-phong-van\" src=\"https://blog.topcv.vn/wp-content/uploads/2020/07/gioi-thieu-khi-di-phong-van-696x290.jpg\" alt=\"cach-gioi-thieu-ban-than-khi-di-phong-van\" /></p>\r\n<p><strong>Ismart</strong>&nbsp;l&agrave; một hệ sinh th&aacute;i thương mại tất cả trong một, gồm c&aacute;c c&ocirc;ng ty th&agrave;nh vi&ecirc;n như:</p>\r\n<p>-&nbsp;<strong>C&ocirc;ng ty TNHH TI KI (\"Ismart\")</strong>&nbsp;l&agrave; đơn vị thiết lập, tổ chức s&agrave;n thương mại điện tử www.ismart.vn để c&aacute;c Nh&agrave; b&aacute;n h&agrave;ng thể tiến h&agrave;nh một phần hoặc to&agrave;n bộ quy tr&igrave;nh mua b&aacute;n h&agrave;ng h&oacute;a, dịch vụ tr&ecirc;n s&agrave;n thương mại điện tử.</p>\r\n<p>-&nbsp;<strong>C&ocirc;ng ty TNHH Ismart Smart Logistics (\"TNSL\")</strong>&nbsp;l&agrave; đơn vị cung cấp c&aacute;c dịch vụ logistics đầu-cuối, dịch vụ vận chuyển, dịch vụ bưu ch&iacute;nh cho S&agrave;n thương mại điện tử www.ismart.vn - C&ocirc;ng ty TNHH MTV Thương mại Ismart (\"IsmartTrading\") l&agrave; đơn vị b&aacute;n h&agrave;ng h&oacute;a, dịch vụ tr&ecirc;n s&agrave;n thương mại điện tử</p>\r\n<p>- Đơn vị b&aacute;n lẻ Ismart Trading v&agrave; S&agrave;n Giao dịch cung cấp 10 triệu sản phẩm từ 26 ng&agrave;nh h&agrave;ng phục vụ h&agrave;ng triệu kh&aacute;ch h&agrave;ng tr&ecirc;n to&agrave;n quốc.</p>\r\n<p>Với phương ch&acirc;m hoạt động &ldquo;Tất cả v&igrave; Kh&aacute;ch H&agrave;ng&rdquo;, Ismartlu&ocirc;n kh&ocirc;ng ngừng nỗ lực n&acirc;ng cao chất lượng dịch vụ v&agrave; sản phẩm, từ đ&oacute; mang đến trải nghiệm mua sắm trọn vẹn cho Kh&aacute;ch H&agrave;ng Việt Nam với dịch vụ giao h&agrave;ng nhanh trong 2 tiếng v&agrave; ng&agrave;y h&ocirc;m sau Ismart lần đầu ti&ecirc;n tại Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng cam kết cung cấp h&agrave;ng ch&iacute;nh h&atilde;ng với ch&iacute;nh s&aacute;ch ho&agrave;n tiền 111% nếu ph&aacute;t hiện h&agrave;ng giả, h&agrave;ng nh&aacute;i.</p>\r\n<p>Th&agrave;nh lập từ th&aacute;ng 3/2010, Ismart.vn hiện đang l&agrave; trang thương mại điện tử lọt top 2 tại Việt Nam v&agrave; top 6 tại khu vực Đ&ocirc;ng Nam &Aacute;.</p>\r\n<p>Ismart lọt Top 1 nơi l&agrave;m việc tốt nhất Việt Nam trong ng&agrave;nh Internet/E-commerce 2018 (Anphabe b&igrave;nh chọn), Top 50 nơi l&agrave;m việc tốt nhất ch&acirc;u &Aacute; 2019 (HR Asia b&igrave;nh chọn).</p>\r\n</div>', 'Chờ duyệt', 'gioi-thieu', 1, '2023-05-20 21:43:15', '2023-05-23 21:34:46'),
(2, 'Liên hệ', '<div class=\"section-head clearfix\">&nbsp;</div>\r\n<div class=\"section-detail\">\r\n<div class=\"detail\">\r\n<ol>\r\n<li>Th&ocirc;ng tin li&ecirc;n hệ:</li>\r\n</ol>\r\n<ul>\r\n<li>Địa chỉ: 123 Đường ABC, Quận XYZ, Th&agrave;nh phố HCM.</li>\r\n<li>Số điện thoại: (08) 1234 5678.</li>\r\n<li>Email:&nbsp;<a href=\"mailto:info@ismart.com.vn\" target=\"_new\">info@ismart.com.vn</a>.</li>\r\n<li>Thời gian l&agrave;m việc: Từ 8:00 s&aacute;ng đến 9:00 tối từ Thứ Hai đến Chủ Nhật.</li>\r\n</ul>\r\n<ol start=\"2\">\r\n<li>Form li&ecirc;n hệ:</li>\r\n</ol>\r\n<ul>\r\n<li>Trang web cung cấp một Form li&ecirc;n hệ để kh&aacute;ch h&agrave;ng c&oacute; thể gửi th&ocirc;ng tin li&ecirc;n hệ trực tiếp tới cửa h&agrave;ng iSmart.</li>\r\n<li>Form li&ecirc;n hệ bao gồm c&aacute;c th&ocirc;ng tin bắt buộc như Họ t&ecirc;n, Địa chỉ Email v&agrave; Nội dung tin nhắn.</li>\r\n</ul>\r\n<ol start=\"3\">\r\n<li>Bản đồ v&agrave; địa chỉ:</li>\r\n</ol>\r\n<ul>\r\n<li>Cửa h&agrave;ng iSmart cung cấp một bản đồ để kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng t&igrave;m địa chỉ của cửa h&agrave;ng.</li>\r\n<li>Trang web cũng cung cấp một địa chỉ chi tiết của cửa h&agrave;ng để kh&aacute;ch h&agrave;ng c&oacute; thể đến mua h&agrave;ng trực tiếp.</li>\r\n</ul>\r\n<ol start=\"4\">\r\n<li>Mạng x&atilde; hội:</li>\r\n</ol>\r\n<ul>\r\n<li>Cửa h&agrave;ng iSmart c&oacute; mặt tr&ecirc;n c&aacute;c mạng x&atilde; hội phổ biến như Facebook, Instagram, Twitter v&agrave; LinkedIn.</li>\r\n<li>Kh&aacute;ch h&agrave;ng c&oacute; thể kết nối với cửa h&agrave;ng iSmart qua c&aacute;c trang mạng x&atilde; hội n&agrave;y để cập nhật c&aacute;c sản phẩm mới nhất, khuyến m&atilde;i đặc biệt v&agrave; tin tức c&ocirc;ng nghệ.</li>\r\n</ul>\r\n<ol start=\"5\">\r\n<li>Trợ gi&uacute;p trực tuyến:</li>\r\n</ol>\r\n<ul>\r\n<li>Cửa h&agrave;ng iSmart cung cấp chức năng Trợ gi&uacute;p trực tuyến để gi&uacute;p đỡ kh&aacute;ch h&agrave;ng trong việc mua h&agrave;ng, thanh to&aacute;n v&agrave; vận chuyển.</li>\r\n<li>Kh&aacute;ch h&agrave;ng c&oacute; thể tr&ograve; chuyện trực tiếp với nh&acirc;n vi&ecirc;n hỗ trợ của cửa h&agrave;ng iSmart để được giải đ&aacute;p c&aacute;c thắc mắc nhanh ch&oacute;ng v&agrave; hiệu quả.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"ddict_btn\" style=\"top: 20px; left: 91.9219px;\"><img src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png\" /></div>', 'Chờ duyệt', 'lien-he', 1, '2023-05-20 21:44:02', '2023-05-23 21:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(16, 'Add Post', 'post.add', NULL, '2023-05-14 21:40:29', '2023-05-14 21:40:29'),
(17, 'Edit Post', 'post.edit', NULL, '2023-05-14 22:22:07', '2023-05-14 22:22:07'),
(18, 'xong dep', 'page.add', NULL, '2023-05-15 06:30:53', '2023-05-15 06:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(50) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `img` varchar(500) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `detail` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(500) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_id` bigint(50) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `cat_post_id` bigint(50) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `img`, `detail`, `slug`, `description`, `user_id`, `status`, `cat_post_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Nga và Ukraine nói gì sau khi Wagner tuyên bố kiểm soát hoàn toàn Bakhmut?', 'uploads/1684639345_Nga và Ukraine nói gì sau khi lực lượng Wagner tuyên bố kiểm soát hoàn toàn Bakhmut.jpg', '<div class=\"row article-summary\">\r\n<div class=\"col\">\r\n<div>VOV.VN - Bộ Quốc ph&ograve;ng Nga x&aacute;c nhận th&agrave;nh phố Bakhmut chiến lược ở Donbass đ&atilde; được kiểm so&aacute;t ho&agrave;n to&agrave;n trong khi ph&iacute;a Ukraine cho rằng những tuy&ecirc;n bố n&agrave;y được đưa ra &ldquo;qu&aacute; sớm&rdquo;.</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col\">&nbsp;</div>\r\n</div>\r\n<div class=\"row article-content\">\r\n<div class=\"col\">\r\n<div class=\"text-long\">\r\n<p>Qu&acirc;n đội Nga đ&atilde; kiểm so&aacute;t ho&agrave;n to&agrave;n th&agrave;nh phố Bakhmut chiến lược ở Donbass sau nhiều th&aacute;ng giao tranh &aacute;c liệt, Bộ Quốc ph&ograve;ng Nga x&aacute;c nhận s&aacute;ng 21/5.</p>\r\n<p>Chiến dịch trong th&agrave;nh phố đ&atilde; được thực hiện bởi c&aacute;c hoạt động tấn c&ocirc;ng của lực lượng Wagner c&ugrave;ng với sự hỗ trợ từ tr&ecirc;n kh&ocirc;ng v&agrave; ph&aacute;o binh từ qu&acirc;n thường trực Nga, Bộ Quốc ph&ograve;ng Nga th&ocirc;ng b&aacute;o.</p>\r\n<figure class=\"gallery-embed embedded-entity image process-filter-image align-center\" role=\"group\">\r\n<div title=\"Lực lượng Wagner ở Bakhmut. Ảnh: Sputnik\" data-alt=\"Lực lượng Wagner ở Bakhmut. Ảnh: Sputnik\" data-embed-button=\"media_browser\" data-entity-embed-display=\"view_mode:media.embedded\" data-entity-embed-display-settings=\"Lực lượng Wagner ở Bakhmut. Ảnh: Sputnik\" data-entity-type=\"media\" data-entity-uuid=\"b0cc49ee-282f-4f28-8e3b-c4c5b88a897c\" data-langcode=\"vi\" data-large-size=\"540x304\" data-large-src=\"https://media.vov.vn/sites/default/files/styles/large/public/2023-05/Nga+v%C3%A0+Ukraine+n%C3%B3i+g%C3%AC+sau+khi+l%E1%BB%B1c+l%C6%B0%E1%BB%A3ng+Wagner+tuy%C3%AAn+b%E1%BB%91+ki%E1%BB%83m+so%C3%A1t+ho%C3%A0n+to%C3%A0n+Bakhmut.jpg\" data-medium-size=\"540x304\" data-medium-src=\"https://media.vov.vn/sites/default/files/styles/medium/public/2023-05/Nga+v%C3%A0+Ukraine+n%C3%B3i+g%C3%AC+sau+khi+l%E1%BB%B1c+l%C6%B0%E1%BB%A3ng+Wagner+tuy%C3%AAn+b%E1%BB%91+ki%E1%BB%83m+so%C3%A1t+ho%C3%A0n+to%C3%A0n+Bakhmut.jpg\" data-title=\"Lực lượng Wagner ở Bakhmut. Ảnh: Sputnik\">\r\n<article>\r\n<div><picture><source type=\"image/jpeg\" media=\"all and (min-width: 1200px)\" data-srcset=\"https://media.vov.vn/sites/default/files/styles/large/public/2023-05/Nga%20v%C3%A0%20Ukraine%20n%C3%B3i%20g%C3%AC%20sau%20khi%20l%E1%BB%B1c%20l%C6%B0%E1%BB%A3ng%20Wagner%20tuy%C3%AAn%20b%E1%BB%91%20ki%E1%BB%83m%20so%C3%A1t%20ho%C3%A0n%20to%C3%A0n%20Bakhmut.jpg 1x\" /><source type=\"image/jpeg\" media=\"all and (min-width: 992px)\" data-srcset=\"https://media.vov.vn/sites/default/files/styles/large/public/2023-05/Nga%20v%C3%A0%20Ukraine%20n%C3%B3i%20g%C3%AC%20sau%20khi%20l%E1%BB%B1c%20l%C6%B0%E1%BB%A3ng%20Wagner%20tuy%C3%AAn%20b%E1%BB%91%20ki%E1%BB%83m%20so%C3%A1t%20ho%C3%A0n%20to%C3%A0n%20Bakhmut.jpg 1x\" /><source type=\"image/jpeg\" media=\"all and (min-width: 768px)\" data-srcset=\"https://media.vov.vn/sites/default/files/styles/medium/public/2023-05/Nga%20v%C3%A0%20Ukraine%20n%C3%B3i%20g%C3%AC%20sau%20khi%20l%E1%BB%B1c%20l%C6%B0%E1%BB%A3ng%20Wagner%20tuy%C3%AAn%20b%E1%BB%91%20ki%E1%BB%83m%20so%C3%A1t%20ho%C3%A0n%20to%C3%A0n%20Bakhmut.jpg 1x\" /><source type=\"image/jpeg\" media=\"all and (min-width: 576px)\" data-srcset=\"https://media.vov.vn/sites/default/files/styles/small/public/2023-05/Nga%20v%C3%A0%20Ukraine%20n%C3%B3i%20g%C3%AC%20sau%20khi%20l%E1%BB%B1c%20l%C6%B0%E1%BB%A3ng%20Wagner%20tuy%C3%AAn%20b%E1%BB%91%20ki%E1%BB%83m%20so%C3%A1t%20ho%C3%A0n%20to%C3%A0n%20Bakhmut.jpg 1x\" /><source type=\"image/jpeg\" media=\"all and (min-width: 0)\" data-srcset=\"https://media.vov.vn/sites/default/files/styles/small/public/2023-05/Nga%20v%C3%A0%20Ukraine%20n%C3%B3i%20g%C3%AC%20sau%20khi%20l%E1%BB%B1c%20l%C6%B0%E1%BB%A3ng%20Wagner%20tuy%C3%AAn%20b%E1%BB%91%20ki%E1%BB%83m%20so%C3%A1t%20ho%C3%A0n%20to%C3%A0n%20Bakhmut.jpg 1x\" /><img title=\"nga v&agrave; ukraine n&oacute;i g&igrave; sau khi wagner tuy&ecirc;n bố kiểm so&aacute;t ho&agrave;n to&agrave;n bakhmut h&igrave;nh ảnh 1\" src=\"https://media.vov.vn/sites/default/files/styles/large/public/2023-05/Nga%20v%C3%A0%20Ukraine%20n%C3%B3i%20g%C3%AC%20sau%20khi%20l%E1%BB%B1c%20l%C6%B0%E1%BB%A3ng%20Wagner%20tuy%C3%AAn%20b%E1%BB%91%20ki%E1%BB%83m%20so%C3%A1t%20ho%C3%A0n%20to%C3%A0n%20Bakhmut.jpg\" alt=\"nga va ukraine noi gi sau khi wagner tuyen bo kiem soat hoan toan bakhmut hinh anh 1\" /></picture></div>\r\n</article>\r\n</div>\r\n<figcaption>Lực lượng Wagner ở Bakhmut. Ảnh: Sputnik</figcaption>\r\n</figure>\r\n<p class=\" ads-detail-center\">Tuy&ecirc;n bố n&agrave;y được đưa ra chỉ v&agrave;i giờ sau khi l&atilde;nh đạo c&ocirc;ng ty qu&acirc;n sự tư nh&acirc;n Wagner Evgeny Prigozhin th&ocirc;ng b&aacute;o tr&ecirc;n truyền th&ocirc;ng rằng lực lượng của &ocirc;ng đ&atilde; kiểm so&aacute;t ho&agrave;n to&agrave;n Bakhmut. Tổng thống Putin cũng đ&atilde; ch&uacute;c mừng c&aacute;c th&agrave;nh vi&ecirc;n của Wagner v&agrave; qu&acirc;n thường trực Nga v&igrave; nỗ lực gi&agrave;nh quyền kiểm so&aacute;t th&agrave;nh phố n&agrave;y.</p>\r\n<div>\r\n<div id=\"block-ads-76\" class=\"block-ads block-ads76 process\" data-position=\"76\" data-display=\"0\" data-interval=\"1\" data-width=\"800\" data-height=\"0\" data-large=\"true\" data-small=\"true\">&nbsp;</div>\r\n</div>\r\n<p>Ukraine phủ nhận việc th&agrave;nh phố n&agrave;y ho&agrave;n to&agrave;n rơi v&agrave;o tay Nga. Thứ trưởng Bộ Quốc ph&ograve;ng Ukraine Anna Malyar cho rằng, những tuy&ecirc;n bố về việc kiểm so&aacute;t Bakhmut được đưa ra \"qu&aacute; sớm\". Trong một b&agrave;i viết tr&ecirc;n Telegram chưa đầy 1 tiếng sau tuy&ecirc;n bố của l&atilde;nh đạo Wagner, Thứ trưởng Quốc ph&ograve;ng Ukraine thừa nhận t&igrave;nh h&igrave;nh Bakhmut \"rất căng\" nhưng qu&acirc;n đội Ukraine vẫn \"cố thủ\" tại một quận ở r&igrave;a ph&iacute;a T&acirc;y Bakhmut.</p>\r\n<p>\"Hiện nay, qu&acirc;n đội của ch&uacute;ng t&ocirc;i đang kiểm so&aacute;t một số cơ sở hạ tầng v&agrave; khu c&ocirc;ng nghiệp cũng như một khu vực tư nh&acirc;n\", b&agrave; Anna Malyar n&oacute;i</p>\r\n<div id=\"ats-apm-32-wrapper\" class=\"insert_ads insert_ads-34\">\r\n<div>\r\n<div id=\"sas_44269\" class=\"ats-slot\">&nbsp;</div>\r\n</div>\r\n</div>\r\n<p>&Ocirc;ng Prigozhin cho biết sẽ chuyển giao quyền kiểm so&aacute;t Bakhmut cho qu&acirc;n đội Nga v&agrave;o ng&agrave;y 25/5.</p>\r\n<p>Trong khi Nga tiếp tục tiến c&ocirc;ng theo c&aacute;c con đường v&agrave;o th&agrave;nh phố th&igrave; trong 2 tuần qua, Ukraine tuy&ecirc;n bố đ&atilde; nỗ lực gi&agrave;nh lại một số khu vực nhỏ do Nga kiểm so&aacute;t ở ph&iacute;a T&acirc;y Bắc v&agrave; T&acirc;y Nam th&agrave;nh phố.</p>\r\n<p>Bakhmut đ&atilde; trở th&agrave;nh nơi giao tranh &aacute;c liệt trong nhiều th&aacute;ng qua khi qu&acirc;n đội Nga gần như bao v&acirc;y th&agrave;nh phố v&agrave; đẩy qu&acirc;n đội Ukraine khỏi c&aacute;c v&ugrave;ng ngoại &ocirc; ph&iacute;a T&acirc;y./.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ddict_btn\" style=\"top: 10px; left: 1558px;\"><img src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png\" /></div>', 'nga-va-ukraine-noi-gi-sau-khi-wagner-tuyen-bo-kiem-soat-hoan-toan-bakhmut', '<div class=\"row article-summary\">\r\n<div class=\"col\">\r\n<div>VOV.VN - Bộ Quốc ph&ograve;ng Nga x&aacute;c nhận th&agrave;nh phố Bakhmut chiến lược ở Donbass đ&atilde; được kiểm so&aacute;t ho&agrave;n to&agrave;n trong khi ph&iacute;a Ukraine cho rằng những tuy&ecirc;n bố n&agrave;y được đưa ra &ldquo;qu&aacute; sớm&rdquo;.</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col\">&nbsp;</div>\r\n</div>\r\n<div class=\"row article-content\">\r\n<div class=\"col\">\r\n<div class=\"text-long\">\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ddict_div\" style=\"top: 80.375px; max-width: 150px; left: 290.945px;\"><img class=\"ddict_audio\" src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/img/audio.png\" />\r\n<p class=\"ddict_sentence\">phố</p>\r\n</div>', 1, 'Chờ duyệt', 4, '2023-05-20 20:22:25', '2023-05-20 21:05:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_cats`
--

CREATE TABLE `post_cats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `parent_id` int(50) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `post_cats`
--

INSERT INTO `post_cats` (`id`, `title`, `slug`, `parent_id`, `updated_at`, `created_at`) VALUES
(4, 'Tin tức', 'tin-tuc', 0, '2023-05-20 20:15:34', '2023-05-20 20:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `describe` varchar(5055) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(255) NOT NULL,
  `img_describe` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_old` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `outstanding` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(50) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `describe`, `detail`, `price`, `img_describe`, `price_old`, `slug`, `outstanding`, `img`, `number_img`, `category_id`, `user_id`, `created_at`, `status`, `updated_at`, `deleted_at`) VALUES
(2, 'Điện thoại iPhone 13 Pro', '<p class=\"lileft\">M&agrave;n h&igrave;nh:&nbsp;<span class=\"comma\">OLED</span><span class=\"comma\">6.1\"</span><span class=\"\">Super Retina XDR</span></p>\r\n<p class=\"lileft\">Hệ điều h&agrave;nh:&nbsp;<span class=\"\">iOS 15</span></p>\r\n<p class=\"lileft\">Camera sau:&nbsp;<span class=\"\">3 camera 12 MP</span></p>\r\n<p class=\"lileft\">Camera trước:&nbsp;<span class=\"\">12 MP</span></p>\r\n<p class=\"lileft\">Chip:&nbsp;<span class=\"\">Apple A15 Bionic</span></p>\r\n<p class=\"lileft\">RAM:&nbsp;<span class=\"\">6 GB</span></p>', '<h3>Mỗi lần ra mắt phiên bản mới là mỗi lần iPhone chiếm sóng trên khắp các mặt trận và lần này cái tên khiến vô số người \"sục sôi\" là iPhone 13 Pro, chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng. </h3>\r\n<h3>Thiết kế đặc trưng với màu sắc thời thượng</h3>\r\n<p>iPhone 13 Pro không có nhiều sự thay đổi về thiết kế, khi máy vẫn sở hữu kiểu dáng tương tự như iPhone 12 Pro với các cạnh viền vuông vắn và hai mặt kính cường lực cao cấp. Sở hữu 4 phiên bản màu gồm xanh dương, bạc, vàng đồng và xám cho bạn tùy chọn theo sở thích của mình. </p>\r\n<p><img class=\" ls-is-cached lazyloaded\" title=\"Sở hữu 4 phiên bản màu sắc trẻ trung - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-1.jpg\" alt=\"Sở hữu 4 phiên bản màu sắc trẻ trung - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-1.jpg\" /></p>\r\n<p>Máy đạt tiêu chuẩn kháng nước và bụi IP68 có khả năng chống lại một số hạt bụi, và được bảo vệ khi rơi xuống nước ở độ sâu đến 6 mét trong 30 phút theo chuẩn IEC 60529, thoải mái nhắn tin khi lỡ ra ngoài gặp mưa, chụp ảnh tự tin khi đi hồ bơi, bãi biển,...</p>\r\n<p><img class=\" ls-is-cached lazyloaded\" title=\"Khả năng kháng bụi, nước - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-2.jpg\" alt=\"Khả năng kháng bụi, nước - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-2.jpg\" /></p>\r\n<h3>Nâng cấp màn hình với tần số quét 120 Hz</h3>\r\n<p>Chiếc iPhone 13 Pro vẫn được trang bị màn hình kích thước 6.1 inch, với phần tai thỏ được làm nhỏ hơn giúp hiển thị thêm nhiều thông tin cũng như tăng cường cảm giác trải nghiệm. Bề mặt có lớp phủ oleophobic chống bám vân tay, giữ cho màn hình luôn được sạch mới. </p>\r\n<p><img class=\" ls-is-cached lazyloaded\" title=\"Trang bị màn hình 6.1 inch - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-man-hinh.jpg\" alt=\"Trang bị màn hình 6.1 inch - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-man-hinh.jpg\" /></p>\r\n<p>iPhone 13 Pro đã được nâng cấp lên tần số quét 120 Hz, với ProMotion có thể làm mới từ 10 đến 120 khung hình/giây. Với tần số quét cao, mọi thao tác chuyển cảnh khi lướt ngón tay trên màn hình trở nên mượt mà hơn đồng thời hiệu ứng thị giác khi chúng ta dùng điện thoại chơi game hoặc xem video cũng cực kỳ mãn nhãn.</p>\r\n<p><img class=\" lazyloaded\" title=\"Chuyển động mượt mà nhờ tần số 120 Hz - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-5.jpg\" alt=\"Chuyển động mượt mà nhờ tần số 120 Hz - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-5.jpg\" /></p>\r\n<p>Tốc độ làm tươi tự động tăng lên để hiển thị hiệu suất đồ họa, tự động giảm xuống khi không sử dụng để tiết kiệm năng lượng và tốc độ làm mới cũng được tự tinh chỉnh linh động để phù hợp hơn tốc độ lướt của ngón tay bạn. </p>\r\n<p><img class=\" lazyloaded\" title=\"Tốc độ làm tươi được tự động hóa - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-4.jpg\" alt=\"Tốc độ làm tươi được tự động hóa - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-4.jpg\" /></p>\r\n<p>Sử dụng tấm nền OLED có số điểm ảnh lên đến 1170 x 2532 Pixels, độ sáng điển hình 1000 nits, khi hiển thị video HDR 1200 nits, tăng lên 25% khi đặt dưới ánh mặt trời, sắc đen hiển thị sâu, sắc sáng tươi tắn, khung hình sinh động như thực. </p>\r\n<p><img class=\" lazyloaded\" title=\"Độ sáng đạt 1200 nits - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-6.jpg\" alt=\"Độ sáng đạt 1200 nits - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-6.jpg\" /></p>\r\n<h3>Quay chụp đỉnh cao với camera Pro</h3>\r\n<p>iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.</p>\r\n<p><img class=\" lazyloaded\" title=\"Bộ ba ống kính chuyên nghiệp - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg\" alt=\"Bộ ba ống kính chuyên nghiệp - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-7.jpg\" /></p>\r\n<p>Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. </p>\r\n<p><img class=\" lazyloaded\" title=\"Camera Ultra Wide lấy nét cực ấn tượng - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg\" alt=\"Camera Ultra Wide lấy nét cực ấn tượng - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-8.jpg\" /></p>\r\n<p>Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. </p>\r\n<p><img class=\" lazyloaded\" title=\"Chế độ đêm Night Mode - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-9.jpg\" alt=\"Chế độ đêm Night Mode - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-9.jpg\" /></p>\r\n<p>Hệ thống camera zoom quang học 6x, riêng camera telephoto có thể zoom quang 3x rất tuyệt khi chụp ảnh và quay video ở xa. Kết hợp nhiều tùy chọn hiệu ứng bokeh và các hiệu ứng ánh sáng chất lượng để bạn tạo nên những bức ảnh lung linh như nhiếp ảnh gia chuyên nghiệp. </p>\r\n<p><img class=\" lazyloaded\" title=\"Ảnh chụp trên camera - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg\" alt=\"Ảnh chụp trên camera - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-10.jpg\" /></p>\r\n<p>Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.</p>\r\n<p><img class=\" lazyloaded\" title=\"Chế độ điện ảnh độc đáo - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg\" alt=\"Chế độ điện ảnh độc đáo - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-11.jpg\" /></p>\r\n<p>Có chế độ chụp phong cảnh Photographic Styles dễ dàng điều chỉnh độ ấm, tông màu phù hợp với ý tưởng chụp của bạn, tuy vậy khác với các bộ lọc thông thường, với chế độ này các chi tiết như bầu trời, màu da sẽ được giữ lại độ chân thật, tự nhiên nhất có thể. </p>\r\n<p><img class=\" lazyloaded\" title=\"Chế độ chụp phong cảnh Photographic Styles - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-12.jpg\" alt=\"Chế độ chụp phong cảnh Photographic Styles - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-12.jpg\" /></p>\r\n<p>Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...</p>\r\n<p><img class=\" lazyloaded\" title=\"Camera TrueDepth - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg\" alt=\"Camera TrueDepth - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-13.jpg\" /></p>\r\n<p>Hơn nữa, camera TrueDepth và chip A15 Bionic hỗ trợ Face ID để xác minh khuôn mặt, giúp mở máy nhanh và an toàn hơn. </p>\r\n<p>Cả camera trước và sau đều quay được video HDR hỗ trợ Dolby Vision đạt chuẩn chất lượng lên đến 4K với tốc độ khung hình 60 fps, quay video ProRes lên đến 1080p ở tốc độ 30 fps, cùng nhiều chế độ quay khác giúp bạn có nhiều sự thay đổi khác nhau khi quay.</p>\r\n<p><img class=\" lazyloaded\" title=\"Hỗ trợ quay video đạt chất lượng 4K - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-14.jpg\" alt=\"Hỗ trợ quay video đạt chất lượng 4K - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-14.jpg\" /></p>\r\n<h3>Hiệu năng đột phá với Apple A15 Bionic</h3>\r\n<p>iPhone 13 Pro được trang bị bộ vi xử lý Apple A15 Bionic, sản xuất trên tiến trình 5 nm cải tiến, theo Apple công bố thì đây là chipset nhanh nhất trong thế giới smartphone tại thời điểm 09/2021.</p>\r\n<p><img class=\" lazyloaded\" title=\"Vi xử lý Apple A15 Bionic - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg\" alt=\"Vi xử lý Apple A15 Bionic - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-15.jpg\" /></p>\r\n<p>Tích hợp chip đồ họa GPU 5 lõi hiệu suất tăng lên 50%, CPU đáp ứng đa dạng tác vụ, nâng cao tuổi thọ pin. Đặc biệt, công nghệ trí tuệ nhân tạo Neural Engine tăng tốc các tác vụ máy học, thực hiện được đến 15.8 nghìn tỷ hoạt động mỗi giây, cho quá trình sử dụng thiết bị mượt mà, ổn định.</p>\r\n<p><img class=\" lazyloaded\" title=\"Đồ họa mượt mà - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-16.jpg\" alt=\"Đồ họa mượt mà - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-16.jpg\" /></p>\r\n<p>Máy sở hữu con RAM 6 GB, bộ nhớ trong 128 GB, vừa đủ với nhu cầu sử dụng của một người dùng cơ bản không có nhu cầu quay video quá nhiều, máy cũng có thêm phiên bản bộ nhớ trong lên đến iPhone 13 Pro 1 TB, bạn có thể cân nhắc nếu có nhu cầu lưu trữ cao.</p>\r\n<p><img class=\" lazyloaded\" title=\"Dung lượng bộ nhớ - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-17.jpg\" alt=\"Dung lượng bộ nhớ - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-17.jpg\" /></p>\r\n<p>Ngoài ra, máy còn được hỗ trợ mạng di động 5G chất lượng cao, có khả năng phản hồi tức thì, việc tải xem, xem phim 4K,... sẽ vô cùng nhanh chóng, đưa trải nghiệm internet của người dùng lên tầm cao mới.</p>\r\n<p><img class=\" lazyloaded\" title=\"Hỗ trợ kết nối 5G - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-2021-pro-01.jpg\" alt=\"Hỗ trợ kết nối 5G - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-2021-pro-01.jpg\" /></p>\r\n<p>Thiết bị được cài đặt nền tảng iOS 15 cho bạn vừa giao tiếp qua FaceTime vừa chia sẻ bài hát, tài liệu với mọi người tiện lợi, dễ dàng tương tác với văn bản trong hình ảnh để gửi email, nhận chỉ đường, thực hiện cuộc gọi,... </p>\r\n<p><img class=\" lazyloaded\" title=\"Nền tảng IOS 15 - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-18.jpg\" alt=\"Nền tảng IOS 15 - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-18.jpg\" /></p>\r\n<h3>Nâng cấp thời lượng pin</h3>\r\n<p>iPhone 13 Pro sẽ có thời lượng pin sử dụng tốt hơn 1.5 tiếng khi so với iPhone 12 Pro, máy có thể phát video liên tục trong 22 tiếng, nghe nhạc trong 75 tiếng và hỗ trợ sạc nhanh 20 W qua cáp.</p>\r\n<p><img class=\" lazyloaded\" title=\"Tối ưu hóa năng lượng - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-19.jpg\" alt=\"Tối ưu hóa năng lượng - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-19.jpg\" /></p>\r\n<p>Lưu ý: Củ sạc 20 W sẽ không đi kèm trong hộp khi mua máy.</p>\r\n<p>Ngoài ra còn hỗ trợ sạc không dây chuẩn Qi 7.5 W, sạc không dây MagSafe 15 W bạn có thể lựa chọn phương pháp sạc phù hợp và tiện lợi nhất trong quá trình sử dụng.</p>\r\n<p><img class=\" lazyloaded\" title=\"Sạc không dây với MagSafe - iPhone 13 Pro 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-20.jpg\" alt=\"Sạc không dây với MagSafe - iPhone 13 Pro 128GB\" data-src=\"https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-20.jpg\" /></p>\r\n<p>Dung lượng pin trên iPhone luôn thấp hơn khi so với các dòng máy Android nhưng việc trang bị chipset mới cùng sự tối ưu hoá của hệ điều hành sẽ đảm bảo thời lượng sử dụng không hề thua kém trên sản phẩm Android, thậm chí còn có thể vượt trội hơn. </p>\r\n<p>iPhone 13 Pro 128GB với thiết kế cứng cáp, sang trọng cùng khả năng nhiếp ảnh ấn tượng, sẽ là một sản phẩm phục vụ tốt các nhu cầu của bạn cũng như là một món đồ thời trang hiện đại.</p>\r\n<div class=\"ddict_div\" style=\"top: 134.969px; max-width: 150px; left: 384.883px;\"><img class=\"ddict_audio\" src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/img/audio.png\" />\r\n<p class=\"ddict_sentence\">máy</p>\r\n</div>', 29155500, NULL, NULL, 'dien-thoai-iphone-13-pro', 'on', 'uploads/1684256210_iphone-13-pro-sierra-blue-600x600.jpg', NULL, 6, 1, '2023-05-16 09:31:01', 'stocking', '2023-05-23 21:36:41', NULL),
(3, 'Điện thoại Samsung Galaxy S22 Ultra 5G 128GB', '<p class=\"lileft\">M&agrave;n h&igrave;nh:&nbsp;<span class=\"comma\">Dynamic AMOLED 2X</span><span class=\"comma\">6.8\"</span><span class=\"\">Quad HD+ (2K+)</span></p>\r\n<p class=\"lileft\">Hệ điều h&agrave;nh:&nbsp;<span class=\"\">Android 12</span></p>\r\n<p class=\"lileft\">Camera sau:&nbsp;<span class=\"\">Ch&iacute;nh 108 MP &amp; Phụ 12 MP, 10 MP, 10 MP</span></p>\r\n<p class=\"lileft\">Camera trước:&nbsp;<span class=\"\">40 MP</span></p>\r\n<p class=\"lileft\">Chip:&nbsp;<span class=\"\">Snapdragon 8 Gen 1 8 nh&acirc;n</span></p>\r\n<p class=\"lileft\">RAM:&nbsp;<span class=\"\">8 GB</span></p>\r\n<p class=\"lileft\">Bộ nhớ trong:&nbsp;<span class=\"\">128 GB</span></p>\r\n<p class=\"lileft\">SIM:&nbsp;<span class=\"comma\">2 Nano SIM hoặc 1 Nano SIM + 1 eSIM</span><span class=\"\">Hỗ trợ 5G</span></p>\r\n<p class=\"lileft\">Pin, Sạc:&nbsp;<span class=\"comma\">5000 mAh</span><span class=\"\">45 W</span></p>', '<p class=\"lileft\">M&agrave;n h&igrave;nh:&nbsp;<span class=\"comma\">Dynamic AMOLED 2X</span><span class=\"comma\">6.8\"</span><span class=\"\">Quad HD+ (2K+)</span></p>\r\n<p class=\"lileft\">Hệ điều h&agrave;nh:&nbsp;<span class=\"\">Android 12</span></p>\r\n<p class=\"lileft\">Camera sau:&nbsp;<span class=\"\">Ch&iacute;nh 108 MP &amp; Phụ 12 MP, 10 MP, 10 MP</span></p>\r\n<p class=\"lileft\">Camera trước:&nbsp;<span class=\"\">40 MP</span></p>\r\n<p class=\"lileft\">Chip:&nbsp;<span class=\"\">Snapdragon 8 Gen 1 8 nh&acirc;n</span></p>\r\n<p class=\"lileft\">RAM:&nbsp;<span class=\"\">8 GB</span></p>\r\n<p class=\"lileft\">Bộ nhớ trong:&nbsp;<span class=\"\">128 GB</span></p>\r\n<p class=\"lileft\">SIM:&nbsp;<span class=\"comma\">2 Nano SIM hoặc 1 Nano SIM + 1 eSIM</span><span class=\"\">Hỗ trợ 5G</span></p>\r\n<p class=\"lileft\">Pin, Sạc:&nbsp;<span class=\"comma\">5000 mAh</span><span class=\"\">45 W</span></p>', 2, NULL, '1', 'dien-thoai-samsung-galaxy-s22-ultra-5g-128gb', NULL, 'uploads/1684255253_Galaxy-S22-Ultra-Burgundy-600x600.jpg', NULL, 7, 1, '2023-05-16 09:40:53', 'stocking', '2023-05-21 19:06:47', '2023-05-21 19:06:47'),
(4, 'Laptop Dell Vostro 3510', '<p>CPU: i51135G72.4GHz RAM: 8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz Ổ cứng: 512 GB SSD NVMe PCIe (C&oacute; thể th&aacute;o ra, lắp thanh kh&aacute;c tối đa 2 TB (2280) / 1 TB (2230))Hỗ trợ khe cắm HDD SATA (n&acirc;ng cấp tối đa 2 TB) M&agrave;n h&igrave;nh: 15.6\"Full HD (1920 x 1080) Card m&agrave;n h&igrave;nh: Card rờiMX350 2GB Cổng kết nối: HDMILAN (RJ45)USB 2.0Jack tai nghe 3.5 mm2 x USB 3.2 / 1 x USB 3.2 v&agrave; 1 x USB Type-C (Tuỳ thuộc v&agrave;o l&ocirc; h&agrave;ng) Hệ điều h&agrave;nh: Windows 11 Home SL + Office Home &amp; Student vĩnh viễn Thiết kế: Vỏ nhựa K&iacute;ch thước, khối lượng: D&agrave;i 358.5 mm - Rộng 235.5 mm - D&agrave;y 18.9 mm - Nặng 1.69 kg Thời điểm ra mắt: 2021</p>', '<h3><a title=\"Dell Vostro 3510 i5 (P112F002BBL) đang b&aacute;n tại dienmayxanh.com\" href=\"https://www.thegioididong.com/laptop/dell-vostro-3510-i5-p112f002bbl\" target=\"_blank\" rel=\"noopener\">Laptop Dell Vostro 3510 i5 (P112F002BBL)</a>&nbsp;sở hữu cấu h&igrave;nh mạnh mẽ, đa nhiệm mượt m&agrave; tr&ecirc;n sức mạnh của bộ vi xử l&yacute; Intel thế hệ 11, c&ugrave;ng một thiết kế đơn giản m&agrave; sang đẹp, sẽ l&agrave; lựa chọn đắt gi&aacute; đ&aacute;p ứng nhu cầu học tập, l&agrave;m việc hay giải tr&iacute; của bạn.</h3>\r\n<h3>Hiệu năng mạnh mẽ, ổn định</h3>\r\n<p>Được trang bị d&ograve;ng chip&nbsp;<strong>Intel Core i5&nbsp;Tiger Lake 1135G7</strong>&nbsp;mạnh mẽ, hoạt động tr&ecirc;n xung nhịp cơ bản&nbsp;<strong>2.4 GHz</strong>&nbsp;v&agrave; &eacute;p xung l&ecirc;n đến&nbsp;<strong>4.2 GHz</strong>&nbsp;ở chế độ Turbo Boost, Dell Vostro 3510 dễ d&agrave;ng giải quyết mượt m&agrave; c&aacute;c t&aacute;c vụ như soạn thảo hợp đồng tr&ecirc;n Word, nhập liệu v&agrave; thống k&ecirc; qua Excel, tạo bảng thuyết tr&igrave;nh c&ugrave;ng PowerPoint,... hay thiết kế đồ hoạ cơ bản tr&ecirc;n c&aacute;c ứng dụng nh&agrave; Adobe cũng hiệu quả kh&ocirc;ng k&eacute;m.</p>\r\n<p>Sự hỗ trợ của bộ nhớ&nbsp;<strong>RAM 8 GB</strong>&nbsp;chuẩn<strong>&nbsp;DDR4 2 khe</strong>&nbsp;(1 khe&nbsp;<strong>8 GB</strong>&nbsp;+ 1 khe rời) với tốc độ Bus RAM l&ecirc;n đến<strong>&nbsp;3200 MHz</strong>&nbsp;cho qu&aacute; tr&igrave;nh đa nhiệm tr&ecirc;n&nbsp;<a title=\"Xem th&ecirc;m c&aacute;c mẫu Laptop hiện đang kinh doanh tại dienmayxanh.com\" href=\"https://www.dienmayxanh.com/laptop\" target=\"_blank\" rel=\"noopener\">laptop</a>&nbsp;c&agrave;ng trơn tru, ổn định hơn, kh&ocirc;ng gặp t&igrave;nh trạng giật lag m&aacute;y, đơ m&agrave;n h&igrave;nh. M&aacute;y cho ph&eacute;p n&acirc;ng cấp RAM l&ecirc;n đến&nbsp;<strong>16 GB</strong>&nbsp;để tăng sức mạnh cấu h&igrave;nh cho những t&aacute;c vụ nặng.</p>\r\n<p>B&ecirc;n cạnh đ&oacute;, sức mạnh đồ họa từ card đồ họa rời&nbsp;<strong>NVIDIA GeForce MX350 2 GB&nbsp;</strong>cải tiến khả năng xử l&yacute; đồ họa thiết kế sản phẩm poster, banner,... ấn tượng cũng hiệu render video ngắn hiệu quả, từ đ&oacute; gi&uacute;p tăng trải nghiệm của người d&ugrave;ng, bạn cũng dễ d&agrave;ng thử c&aacute;c tựa game nhẹ nh&agrave;ng thịnh h&agrave;nh một c&aacute;ch mượt m&agrave;.</p>\r\n<p><a title=\"Xem th&ecirc;m một số sản phẩm laptop c&oacute; ổ cứng SSD 512 Gb đang kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop?g=ssd-512-gb\" target=\"_blank\" rel=\"noopener\">Laptop SSD 512 GB</a><strong>&nbsp;NVMe PCIe</strong>&nbsp;(C&oacute; thể th&aacute;o ra, lắp thanh kh&aacute;c tối đa&nbsp;<strong>2 TB&nbsp;(2280) / 1 TB (2230)</strong>) cho ph&eacute;p lưu trữ kh&aacute; thoải m&aacute;i dữ liệu c&aacute; nh&acirc;n cho c&ocirc;ng việc, giải tr&iacute;, hỗ trợ khởi động m&aacute;y nhanh ch&oacute;ng, truy xuất dữ liệu ổn định. Khi cần mở rộng kh&ocirc;ng gian lưu trữ, bạn cũng c&oacute; thể d&ugrave;ng&nbsp;<strong>khe cắm HDD SATA&nbsp;</strong>(n&acirc;ng cấp tối đa&nbsp;<strong>2 TB</strong>).</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-5-1.jpg\"><img title=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - SSD\" src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-5-1.jpg\" alt=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - SSD\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-5-1.jpg\" /></a></p>\r\n<h3>Thiết kế thanh lịch, sang đẹp</h3>\r\n<p><a title=\"Một số laptop Dell Vostro đang kinh doanh tại thegioididong.com\" href=\"https://www.thegioididong.com/laptop-dell-vostro\" target=\"_blank\" rel=\"noopener\">Laptop Dell Vostro</a>&nbsp;c&oacute; lớp vỏ ngo&agrave;i bằng nhựa m&agrave;u đen hiện đại, tổng thể thiết kế to&aacute;t l&ecirc;n sự chắc chắn, sang trọng m&agrave; rất thanh lịch, c&aacute;c chi tiết tinh tế, đẹp mắt. M&aacute;y c&oacute; khối lượng&nbsp;<strong>1.69 kg</strong>, độ d&agrave;y&nbsp;<strong>18.9 mm</strong>&nbsp;dễ d&agrave;ng để mang theo trong h&agrave;nh trang thường nhật cho học tập, l&agrave;m việc.</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-2-1.jpg\"><img title=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-2-1.jpg\" alt=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - Thiết kế\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-2-1.jpg\" /></a></p>\r\n<p><a title=\"Xem th&ecirc;m một số sản phẩm laptop đang kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop\" target=\"_blank\" rel=\"noopener\">Laptop</a>&nbsp;c&oacute; b&agrave;n ph&iacute;m&nbsp;<strong>Fullsize&nbsp;</strong>với khoảng c&aacute;ch ph&iacute;m rộng, rất thoải m&aacute;i cho việc soạn thảo văn bản nhanh, ph&iacute;m nhấn &ecirc;m v&agrave; nhạy khi thao t&aacute;c.</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-6-1.jpg\"><img title=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - B&agrave;n ph&iacute;m\" src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-6-1.jpg\" alt=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - B&agrave;n ph&iacute;m\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-6-1.jpg\" /></a></p>\r\n<p><strong>Cảm biến v&acirc;n tay&nbsp;</strong>t&iacute;ch hợp hỗ trợ truy cập m&agrave;n h&igrave;nh nhanh chỉ với 1 chạm, khả năng bảo mật tốt tr&ecirc;n thiết bị c&aacute; nh&acirc;n của bạn.</p>\r\n<p><a title=\"Xem th&ecirc;m một số sản phẩm laptop Dell đang kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop-dell\" target=\"_blank\" rel=\"noopener\">Laptop Dell</a>&nbsp;c&oacute; đầy đủ c&aacute;c cổng kết nối th&ocirc;ng dụng gồm 2 cổng USB 3.2 hoặc 1 cổng USB 3.2 v&agrave; 1 cổng USB Type-C (Tuỳ theo l&ocirc; h&agrave;ng), cổng HDMI, jack tai nghe 3.5 mm, LAN (RJ45), USB 2.0 v&agrave; khe đọc thẻ SD, kết nối thuận tiện với nhiều thiết bị ngoại vi để phục vụ c&ocirc;ng việc. B&ecirc;n cạnh đ&oacute; c&ograve;n c&oacute; kết nối kh&ocirc;ng d&acirc;y&nbsp;<strong>Bluetooth v&agrave; Wi-Fi&nbsp;802.11 a/b/g/n/ac&nbsp;</strong>độ nhạy cao, đảm bảo hiệu suất sử dụng m&aacute;y của bạn.</p>\r\n<h3>M&agrave;n h&igrave;nh sắc n&eacute;t với g&oacute;c nh&igrave;n rộng, &acirc;m thanh giải tr&iacute; sống động</h3>\r\n<p><a title=\"Xem th&ecirc;m một số sản phẩm laptop c&oacute; m&agrave;n h&igrave;nh 15.6 inch đang kinh doanh tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop-tren-15-inch\" target=\"_blank\" rel=\"noopener\">Laptop m&agrave;n h&igrave;nh 15.6 inch</a>&nbsp;kết hợp với c&ocirc;ng nghệ g&oacute;c nh&igrave;n rộng&nbsp;<a title=\"T&igrave;m hiểu th&ecirc;m về Wide Viewing Angle l&agrave; g&igrave;? Ưu nhược điểm.\" href=\"https://www.thegioididong.com/hoi-dap/wide-viewing-angle-la-gi-uu-nhuoc-diem-1302188\" target=\"_blank\" rel=\"noopener\">Wide Viewing Angle (WVA)</a>&nbsp;mang đến trải nghiệm xem đ&atilde; mắt hơn tr&ecirc;n m&agrave;n h&igrave;nh, chất lượng h&igrave;nh ảnh sắc n&eacute;t chuẩn&nbsp;<strong>Full HD&nbsp;(1920 x 1080)</strong>, m&agrave;u sắc tương phản tốt, chi tiết ch&acirc;n thật.</p>\r\n<p>C&ocirc;ng nghệ chống ch&oacute;i&nbsp;<a title=\"T&igrave;m hiểu về m&agrave;n h&igrave;nh chống ch&oacute;i Anti Glare\" href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-man-hinh-chong-choi-anti-glare-1182688\" target=\"_blank\" rel=\"noopener\">Anti Glare</a>, bạn dễ d&agrave;ng sử dụng laptop ngo&agrave;i trời m&agrave; kh&ocirc;ng bị l&oacute;a mờ m&agrave;n h&igrave;nh do &aacute;nh s&aacute;ng ch&oacute;i, l&agrave;m việc thuận lợi hơn, giải tr&iacute; th&iacute;ch th&uacute; hơn, bảo vệ tốt hơn cho thị gi&aacute;c. C&ugrave;ng c&ocirc;ng nghệ<strong>&nbsp;LED Backlight&nbsp;</strong>cho m&agrave;n h&igrave;nh mỏng hơn, toả nhiệt &iacute;t hơn v&agrave; tiết kiệm điện năng cho bạn.</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-7.jpg\"><img title=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - M&agrave;n h&igrave;nh\" src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-7.jpg\" alt=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - M&agrave;n h&igrave;nh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-7.jpg\" /></a></p>\r\n<p>Kết hợp c&ugrave;ng c&ocirc;ng nghệ&nbsp;<strong>Realtek High Definition Audio</strong>&nbsp;khuếch đại &acirc;m thanh&nbsp;tốt khi chơi game, xem phim, nghe nhạc,&hellip; chất &acirc;m to r&otilde;, đủ để đ&aacute;p ứng nhu cầu giải tr&iacute; của bạn trong những giờ rảnh rỗi.</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-8.jpg\"><img title=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - &Acirc;m thanh\" src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-8.jpg\" alt=\"Dell Vostro 3510 i5 1135G7 (P112F002BBL) - &Acirc;m thanh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-8.jpg\" /></a></p>\r\n<p>Laptop Dell Vostro 3510 i5 (P112F002BBL) sẽ kh&ocirc;ng chỉ đ&aacute;p ứng tốt cho nhu cầu sử dụng cơ bản m&agrave; c&ograve;n xử l&yacute; hiệu quả c&aacute;c t&aacute;c vụ đ&ograve;i hỏi hiệu năng cao hơn như đồ họa, một đầu tư xứng đ&aacute;ng cho nhu cầu của bạn.</p>', 16890000, NULL, '1', 'laptop-dell-vostro-3510', NULL, 'uploads/1684296021_vi-vn-dell-vostro-3510-i5-p112f002bbl-1.jpg', NULL, 13, 1, '2023-05-16 21:00:21', 'stocking', '2023-05-22 18:47:51', '2023-05-22 18:47:51'),
(6, '123', '<p>123</p>', '<p>123</p>', 123, NULL, '123', '123', 'on', 'uploads/1684565755_photo-1656821991453-c9b39bd205a4.jpg', NULL, 3, 1, '2023-05-19 23:55:55', 'stocking', '2023-05-21 19:00:53', '2023-05-21 19:00:53'),
(8, 'Samsung Galaxy A24', '<p>Năm nay SanSung cũng đ&atilde; n&acirc;ng cấp độ ph&acirc;n giải camera trước n&ecirc;n 12 MP thay v&igrave; 7 MP như thế hệ trước đ&oacute;. Camera trước cũng c&oacute; một t&iacute;nh năng th&ocirc;ng minh, khi bạn xoay ngang điện thoại n&oacute; sẽ tự k&iacute;ch hoạt chế độ selfie g&oacute;c rộng để bạn c&oacute; thể chụp với nhiều người hơn.</p>', '<p>Còn về nguyên lý thiết kế phần màn hình thì Galaxy S23+ cũng không có quá nhiều điều khác biệt, vẫn sẽ là màn hình phẳng với các viền siêu mỏng bao bọc xung quanh, cùng với đó là hình notch dạng đục lỗ chứa camera được làm nhỏ để tối ưu diện tích hiển thị.</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-080423-111402.jpg\"><img title=\"Viền màn hình mỏng - Samsung Galaxy S23+ 5G 256GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-080423-111402.jpg\" alt=\"Viền màn hình mỏng - Samsung Galaxy S23+ 5G 256GB\" /></a></p>\r\n<h3>Bứt phá mọi giới hạn với chip Snapdragon 8 Gen 2</h3>\r\n<p>Vào mỗi dịp ra mắt, hãng <a title=\"Tham khảo điện thoại Samsung đang kinh doanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-samsung\" target=\"_blank\" rel=\"noopener\">điện thoại Samsung</a> sẽ trang bị những con chip mạnh mẽ nhất được ra mắt cùng thời gian đó, và tới thời điểm hiện tại thì vi xử lý Snapdragon 8 Gen 2 là cái tên đã xuất hiện trên Galaxy S23+ với hiệu năng mang lại là vô cùng ấn tượng.</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-080423-111409.jpg\"><img title=\"Trang bị Snapdragon 8 Gen 2 - Samsung Galaxy S23+ 5G 256GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-080423-111409.jpg\" alt=\"Trang bị Snapdragon 8 Gen 2 - Samsung Galaxy S23+ 5G 256GB\" /></a></p>\r\n<p>Theo thông số của chip được cung cấp bởi hãng thì Snapdragon 8 Gen 2 có thể hoạt động với hiệu suất tối đa đạt được là 3.36 GHz, đây là con số rất lớn trên những mẫu <a title=\"Tham khảo điện thoại Android đang kinh doanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd?g=android\" target=\"_blank\" rel=\"noopener\">điện thoại Android</a> khi khá ít thiết bị đạt được ngưỡng hiệu năng trên.</p>\r\n<p>Ngoài ra thì mình cũng đã kiểm chứng sức mạnh của máy thêm một lần nữa, thao tác này được thực hiện thông qua hai phần mềm đo hiệu năng thường dùng và kết quả có được như sau: 1449 (đơn nhân), 4565 (đa nhân) trên Benchmark và 15211 trên PCMark.</p>', 22000000, NULL, NULL, 'samsung-galaxy-a24', 'on', 'uploads/1684721135_dien-thoai-13-1.jpg', NULL, 7, 1, '2023-05-21 19:05:35', 'stocking', '2023-05-24 02:27:13', NULL),
(9, 'Samsung Galaxy S23', '<p>Samsung Galaxy S23+ 5G 256GB l&agrave; chiếc điện thoại thuộc d&ograve;ng cao cấp nhất của Samsung được giới thiệu v&agrave;o th&aacute;ng 02/2023. M&aacute;y sở hữu một v&agrave;i điểm ấn tượng như camera c&oacute; khả năng quay video 8K, c&ugrave;ng với đ&oacute; l&agrave; con chip Snapdragon 8 Gen 2 mạnh mẽ h&agrave;ng đầu giới điện thoại Android.</p>', '<h3><a title=\"Tham khảo mẫu điện thoại Samsung Galaxy S23 Plus 5G 256GB đang kinh doanh tại Thế Giới Di Động \" href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-s23-plus\" target=\"_blank\" rel=\"noopener\">Samsung Galaxy S23+ 5G 256GB</a> là chiếc điện thoại thuộc dòng cao cấp nhất của Samsung được giới thiệu vào tháng 02/2023. Máy sở hữu một vài điểm ấn tượng như camera có khả năng quay video 8K, cùng với đó là con chip Snapdragon 8 Gen 2 mạnh mẽ hàng đầu giới điện thoại Android.</h3>\r\n<h3>Vẻ ngoài đẳng cấp xứng danh flagship</h3>\r\n<p>Ấn tượng đầu tiên của mình khi trên tay chiếc Galaxy S23+ là cái nhìn vuông vắn sang trọng, tổng thể máy được hoàn thiện từ các loại chất liệu cao cấp giúp mang đến trải nghiệm cầm nắm đầm tay hơn. </p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-080423-111218.jpg\"><img title=\"Thiết kế vuông vắn - Samsung Galaxy S23+ 5G 256GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-080423-111218.jpg\" alt=\"Thiết kế vuông vắn - Samsung Galaxy S23+ 5G 256GB\" /></a></p>\r\n<p>Hơn thế, bộ khung nhôm và mặt lưng kính cường lực cũng mang đến cho máy khả năng kháng xước tốt hay hạn chế được rủi ro nứt, vỡ mỗi khi máy có gặp va chạm ngoài ý muốn. </p>\r\n<p>Về kiểu hoàn thiện thì khung máy được làm theo kiểu nhẵn bóng giúp mang đến cái nhìn bắt mắt và sang trọng hơn, cùng với đó là mặt lưng làm nhám nhằm giảm thiểu hiện tượng bám dấu vân tay và mồ hôi mỗi khi sử dụng, ngoài ra các vết xước nhẹ cũng được giảm thiểu đối với mặt lưng của chiếc máy này.</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-080423-111223.jpg\"><img title=\"Khung viền nhôm chắc chắn - Samsung Galaxy S23+ 5G 256GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/290829/samsung-galaxy-s23-plus-080423-111223.jpg\" alt=\"Khung viền nhôm chắc chắn - Samsung Galaxy S23+ 5G 256GB\" /></a></p>\r\n<p>Thoạt nhìn thì ở phiên bản Galaxy S23+ có lẽ sẽ không có quá nhiều sự đổi mới so với thế hệ tiền nhiệm, tuy nhiên điểm mà ta có thể dễ dàng nhận thấy và phân biệt được hai mẫu máy giữa đời trước và đời sau là nằm ở phần cụm camera.</p>\r\n<p>Sẽ không còn đặt chung cụm nữa, mà thay vào đó camera trên Galaxy S23+ đều được bố trí theo cách riêng lẻ, vừa mang đến điểm nhấn mới lạ xong cũng đem lại điểm nhận diện đặc trưng cho dòng máy này.</p>', 22000000, NULL, NULL, 'samsung-galaxy-s23', 'on', 'uploads/1684722734_dien-thoai-14-1.jpg', NULL, 7, 1, '2023-05-21 19:32:14', 'stocking', '2023-05-24 02:06:01', NULL),
(10, 'OPPO Find N2', '<p>OPPO Find N2 Flip, chiếc điện thoại gập đầu ti&ecirc;n của OPPO được giới thiệu ch&iacute;nh thức v&agrave;o th&aacute;ng 03/2023. Với cấu h&igrave;nh mạnh mẽ bao gồm con chip Dimensity 9000+ v&agrave; bộ camera nổi trội, đ&acirc;y được xem l&agrave; một trong những mẫu điện thoại đ&aacute;ng ch&uacute; &yacute; ở thời điểm hiện tại khi sở hữu bộ cấu h&igrave;nh tốt trong tầm gi&aacute;.</p>', '<p>&nbsp;Sở hữu hiệu năng mạnh mẽ của&nbsp;<strong>CPU Intel Core i5&nbsp;11400H</strong>, đi k&egrave;m card m&agrave;n h&igrave;nh rời&nbsp;<strong>RTX 3050 4 GB&nbsp;</strong>cung cấp khả năng chiến game mượt m&agrave;, c&aacute;c t&aacute;c vụ hằng ng&agrave;y như: Word, Excel, PowerPoint,... hay thiết kế đồ hoạ Premiere, After Effect, Photoshop,... sẽ kh&ocirc;ng l&agrave;m kh&oacute; được chiếc&nbsp;<a title=\"Xem th&ecirc;m laptop đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/laptop\" target=\"_blank\" rel=\"noopener\">laptop</a>&nbsp;n&agrave;y.</p>\r\n<p>&bull;&nbsp;<a title=\"Xem th&ecirc;m laptop Acer Nitro đang b&aacute;n tại thegioididong.com\" href=\"https://www.thegioididong.com/laptop-acer-nitro\" target=\"_blank\" rel=\"noopener\">Laptop Acer Nitro</a>&nbsp;c&oacute;&nbsp;<strong>RAM 8 GB&nbsp;</strong>gi&uacute;p đa nhiệm mượt m&agrave;, hạn chế t&igrave;nh trạng giật lag xảy ra.&nbsp;<strong>SSD 512 GB&nbsp;</strong>được trang bị tr&ecirc;n m&aacute;y mang lại kh&ocirc;ng gian lưu trữ đủ d&ugrave;ng, n&acirc;ng cao tốc độ truy xuất dữ liệu cũng như khởi động ứng dụng cực nhanh.</p>\r\n<h3><a title=\"Tham khảo điện thoại OPPO Find N2 Flip tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd/oppo-find-n2-flip\" target=\"_blank\" rel=\"noopener\">OPPO Find N2 Flip</a>, chiếc điện thoại gập đầu ti&ecirc;n của OPPO được giới thiệu ch&iacute;nh thức v&agrave;o th&aacute;ng 03/2023. Với cấu h&igrave;nh mạnh mẽ bao gồm con chip Dimensity 9000+ v&agrave; bộ camera nổi trội, đ&acirc;y được xem l&agrave; một trong những mẫu điện thoại đ&aacute;ng ch&uacute; &yacute; ở thời điểm hiện tại khi sở hữu bộ cấu h&igrave;nh tốt trong tầm gi&aacute;.</h3>\r\n<h3>Sử dụng ng&ocirc;n ngữ thiết kế gập hiện đại</h3>\r\n<p>Về thiết kế của m&aacute;y, Find N2 Flip sẽ được l&agrave;m theo cơ chế gập ấn tượng với tỷ lệ khung h&igrave;nh rộng v&agrave; viền mỏng. Ngo&agrave;i ra,&nbsp;<a title=\"Tham khảo điện thoại đang kinh doanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener\">điện thoại</a>&nbsp;c&ograve;n được trang bị một m&agrave;n h&igrave;nh phụ nhỏ ở mặt sau gi&uacute;p người d&ugrave;ng tiện lợi trong việc chụp ảnh selfie hoặc kiểm tra th&ocirc;ng b&aacute;o.&nbsp;</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/42/299034/oppo-find-n2-flip-150223-051048.jpg\"><img title=\"Thiết kế đẹp mắt - OPPO Find N2 Flip\" src=\"https://cdn.tgdd.vn/Products/Images/42/299034/oppo-find-n2-flip-150223-051048.jpg\" alt=\"Thiết kế đẹp mắt - OPPO Find N2 Flip\" /></a></p>\r\n<p>Với cơ chế gấp gọn tiện lợi n&ecirc;n người d&ugrave;ng c&oacute; thể biến chiếc m&aacute;y của m&igrave;nh trở n&ecirc;n nhỏ nhắn hơn, ph&ugrave; hợp để bạn c&oacute; thể dễ d&agrave;ng mang theo hay bỏ t&uacute;i một c&aacute;ch gọn g&agrave;ng.</p>\r\n<h3>N&acirc;ng cấp với m&agrave;n h&igrave;nh chất lượng</h3>\r\n<p>Ở mặt trước,&nbsp;OPPO Find N2 Flip được trang bị tấm nền m&agrave;n h&igrave;nh AMOLED với ưu điểm t&aacute;i hiện h&igrave;nh ảnh c&oacute; chiều s&acirc;u, m&agrave;u sắc sinh động đầy rực rỡ. Độ ph&acirc;n giải Full HD+ tr&ecirc;n khung h&igrave;nh c&oacute; k&iacute;ch thước 6.8 inch cũng sẽ mang đến kh&ocirc;ng gian hiển thị rộng lớn, độ chi tiết tăng cường để mọi nội dung đều trở n&ecirc;n sắc n&eacute;t.</p>\r\n<p>OPPO đ&atilde; tạo ấn tượng với Find N2 Flip khi trang bị m&agrave;n h&igrave;nh phụ lớn ph&iacute;a sau, cho ph&eacute;p người d&ugrave;ng xem th&ocirc;ng b&aacute;o v&agrave; thao t&aacute;c trả lời dễ d&agrave;ng. Ngo&agrave;i ra, m&agrave;n h&igrave;nh phụ c&ograve;n gi&uacute;p bạn xem trước h&igrave;nh ảnh khi chụp ảnh selfie bằng camera sau một c&aacute;ch tiện lợi, tạo trải nghiệm sử dụng th&uacute; vị cho người d&ugrave;ng.</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/42/299034/oppo-find-n2-flip-150223-051057.jpg\"><img title=\"N&acirc;ng cấp với m&agrave;n h&igrave;nh phụ - OPPO Find N2 Flip\" src=\"https://cdn.tgdd.vn/Products/Images/42/299034/oppo-find-n2-flip-150223-051057.jpg\" alt=\"N&acirc;ng cấp với m&agrave;n h&igrave;nh phụ - OPPO Find N2 Flip\" /></a></p>\r\n<h3>Hiệu năng mạnh mẽ c&acirc;n tốt mọi t&aacute;c vụ</h3>\r\n<p>Về hiệu năng của Find N2 Flip, m&aacute;y được trang bị con chip Mediatek Dimensity 9000+ với mức xung nhịp tối đa đạt được l&agrave; 3.20 GHz, nhờ đ&oacute; m&agrave; chiếc&nbsp;<a title=\"Tham khảo điện thoại đang kinh doanh tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dtdd-oppo\" target=\"_blank\" rel=\"noopener\">điện thoại OPPO</a>&nbsp;n&agrave;y c&oacute; thể trở n&ecirc;n ph&ugrave; hợp hơn để người d&ugrave;ng chơi được c&aacute;c tựa game đồ họa cao mượt m&agrave; hơn, thực hiện c&aacute;c t&aacute;c vụ xử l&yacute; chỉnh sửa video/h&igrave;nh ảnh với thời gian xuất cực kỳ nhanh ch&oacute;ng.</p>\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/42/299034/oppo-find-n2-flip-150223-051103.jpg\"><img title=\"Hiệu năng mạnh mẽ - OPPO Find N2 Flip\" src=\"https://cdn.tgdd.vn/Products/Images/42/299034/oppo-find-n2-flip-150223-051103.jpg\" alt=\"Hiệu năng mạnh mẽ - OPPO Find N2 Flip\" /></a></p>\r\n<h3>Thỏa sức đam m&ecirc; nhiếp ảnh chất lượng cao</h3>\r\n<p>Nổi bật ở phần mặt sau của chiếc&nbsp;điện thoại&nbsp;n&agrave;y sẽ l&agrave; 2 ống k&iacute;nh với độ ph&acirc;n giải tối đa tr&ecirc;n camera ch&iacute;nh l&ecirc;n đến 50 MP, k&egrave;m theo đ&oacute; l&agrave; camera g&oacute;c si&ecirc;u rộng 8 MP để bạn c&oacute; thể chụp được những bức ảnh c&oacute; độ bao qu&aacute;t lớn, ph&ugrave; hợp cho những t&aacute;c vụ chụp ảnh nh&oacute;m hay muốn ghi h&igrave;nh ở những khung cảnh bao la h&ugrave;ng vĩ.</p>', 18990000, NULL, NULL, 'oppo-find-n2', 'on', 'uploads/1684722889_dien-thoai-11.jpg', NULL, 7, 1, '2023-05-21 19:34:49', 'stocking', '2023-05-21 19:34:49', NULL),
(11, 'Đồng hồ CITIZEN 40', '<p>Đơn giản v&agrave; thanh lịch Xu hướng thiết kế ch&iacute;nh của đồng hồ Citizen l&agrave; đơn giản v&agrave; thanh lịch. Citizen lu&ocirc;n ch&uacute; trọng đến việc đổi mới v&agrave; tạo sự phong ph&uacute; cho c&aacute;c mẫu thiết kế. C&aacute;c chi tiết cũng được Citizen đầu tư kỹ lưỡng trong kh&acirc;u chế t&aacute;c.</p>', '<p>• <a href=\"https://www.thegioididong.com/dong-ho-deo-tay-citizen\">Đồng hồ Citizen</a> đến từ xứ sở hoa anh đào - Nhật Bản. Mỗi dòng đồng hồ Citizen đều có kiểu thiết kế độc đáo, nhà sản xuất luôn cập nhật các xu hướng hiện đại nhưng vẫn duy trì được nét đặc trưng riêng của mỗi dòng sản phẩm từ trước đến nay. Mẫu đồng hồ này phù hợp với những ai thích sự thanh lịch và sang trọng.</p>\r\n<p>• Đường kính mặt của mẫu <a href=\"https://www.thegioididong.com/dong-ho-deo-tay/citizen-nh8391-51e-nam\">đồng hồ CITIZEN 40 mm Nam NH8391-51E</a> này là <strong>40 mm</strong>, độ rộng dây là <strong>20 mm</strong>.</p>\r\n<p>• Khung viền và dây đeo <a href=\"https://www.thegioididong.com/dong-ho-deo-tay\">đồng hồ</a> làm từ thép không gỉ 316L cứng cáp, bền bỉ và có khả năng chống chịu mọi thời tiết, chống oxi hoá.</p>\r\n<p>• Khả năng chống nước của mẫu <a href=\"https://www.thegioididong.com/dong-ho-deo-tay-nam\">đồng hồ nam</a> này là <strong>5</strong><strong> ATM</strong>, người dùng hoàn toàn có thể sử dụng khi đi tắm, đi mưa. Không nên sử dụng khi đi bơi, lặn.</p>\r\n<p>• Lịch ngày và lịch thứ được tích hợp ngay trên mặt đồng hồ khiến người dùng nắm bắt thời gian một cách thuận tiện. Kim dạ quang giúp người dùng theo dõi thời gian trong bóng tối dễ dàng hơn.</p>', 8972000, NULL, NULL, 'dong-ho-citizen-40', 'on', 'uploads/1684723119_dong-ho-1.jpg', NULL, 15, 1, '2023-05-21 19:38:39', 'stocking', '2023-05-24 02:03:37', NULL),
(12, 'Đồng hồ CITIZEN 70', '<p>Đơn giản v&agrave; thanh lịch Xu hướng thiết kế ch&iacute;nh của đồng hồ Citizen l&agrave; đơn giản v&agrave; thanh lịch. Citizen lu&ocirc;n ch&uacute; trọng đến việc đổi mới v&agrave; tạo sự phong ph&uacute; cho c&aacute;c mẫu thiết kế. C&aacute;c chi tiết cũng được Citizen đầu tư kỹ lưỡng trong kh&acirc;u chế t&aacute;c</p>', '<p> <a href=\"https://www.thegioididong.com/dong-ho-deo-tay-citizen\">Đồng hồ Citizen</a> đến từ xứ sở hoa anh đào - Nhật Bản. Mỗi dòng đồng hồ Citizen đều có kiểu thiết kế độc đáo, nhà sản xuất luôn cập nhật các xu hướng hiện đại nhưng vẫn duy trì được nét đặc trưng riêng của mỗi dòng sản phẩm từ trước đến nay. Mẫu đồng hồ này phù hợp với những ai thích sự thanh lịch và sang trọng.</p>\r\n<p>• Đường kính mặt của mẫu <a href=\"https://www.thegioididong.com/dong-ho-deo-tay/citizen-nh8391-51x-nam\">đồng hồ CITIZEN 40 mm Nam NH8391-51X</a> này là <strong>40 mm</strong>, độ rộng dây là <strong>20 mm</strong>.</p>\r\n<p>• Khung viền và dây đeo <a href=\"https://www.thegioididong.com/dong-ho-deo-tay\">đồng hồ</a> làm từ thép không gỉ 316L cứng cáp, bền bỉ và có khả năng chống chịu mọi thời tiết, chống oxi hoá.</p>\r\n<p>• Khả năng chống nước của mẫu <a href=\"https://www.thegioididong.com/dong-ho-deo-tay-nam\">đồng hồ nam</a> này là <strong>5</strong><strong> ATM</strong>, người dùng hoàn toàn có thể sử dụng khi đi tắm, đi mưa. Không nên sử dụng khi đi bơi, lặn.</p>\r\n<p>• Lịch ngày và lịch thứ được tích hợp ngay trên mặt đồng hồ khiến người dùng nắm bắt thời gian một cách thuận tiện. Kim dạ quang giúp người dùng theo dõi thời gian trong bóng tối dễ dàng hơn.</p>', 6990000, NULL, NULL, 'dong-ho-citizen-70', 'on', 'uploads/1684723599_dong-ho-7.jpg', NULL, 15, 1, '2023-05-21 19:46:39', 'stocking', '2023-05-24 02:04:59', NULL),
(13, 'Đồng hồ ROLEX', '<p>Citizen Đơn giản v&agrave; thanh lịch Xu hướng thiết kế ch&iacute;nh của đồng hồ Citizen l&agrave; đơn giản v&agrave; thanh lịch. Citizen lu&ocirc;n ch&uacute; trọng đến việc đổi mới v&agrave; tạo sự phong ph&uacute; cho c&aacute;c mẫu thiết kế. C&aacute;c chi tiết cũng được Citizen đầu tư kỹ lưỡng trong kh&acirc;u chế t&aacute;c.</p>', '<p> Mang thương hiệu <a title=\"Đồng hồ Citizen chính hãng, giá rẻ, bán tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dong-ho-deo-tay-citizen\" target=\"_blank\" rel=\"noopener\">đồng hồ Citizen</a>, thương hiệu nổi tiếng đến từ Nhật Bản</p>\r\n<p>- Thuộc BST <a title=\"Xem thêm bộ sưu tập Citizen C7\" href=\"https://www.thegioididong.com/dong-ho-deo-tay-citizen-c7\" target=\"_blank\" rel=\"noopener\" type=\"Xem thêm bộ sưu tập Citizen C7\">Citizen C7</a> mới, là bản nâng cấp về thiết kế của bản Crystal Seven ra mắt năm 1965</p>\r\n<p>- <a title=\"Đồng hồ cơ tự động chính hãng giá rẻ bán tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dong-ho-deo-tay-co-tu-dong\">Đồng hồ cơ tự động</a> bền bỉ, không cần dùng pin giúp vảo vệ môi trường tốt hơn</p>\r\n<p>- Với đường kính mặt 40 mm, và dây đeo rộng 20 mm dành cho bạn nam có cổ tay với chu vi từ 18 - 19 cm</p>\r\n<p>- Có khung viền được làm từ thép không gỉ bền bỉ, bảo vệ tốt lõi đồng hồ, dây đeo bằng da mang đến cảm giác êm tay khi đeo</p>\r\n<p>- Người dùng yên tâm đeo <a title=\"Đồng hồ chính hãng, giá rẻ, bán tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dong-ho-deo-tay\" target=\"_blank\" rel=\"noopener\" type=\"xem thêm đồng hồ nam\">đồng hồ</a> khi tắm rửa, đi mưa, rửa tay nhờ hệ số chống nước 5 ATM, không nên đeo đồng hồ khi đi bơi hay lặn</p>\r\n<p>- Chiếc <a title=\"Đồng hồ nam chính hãng, giá rẻ, bán tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dong-ho-deo-tay-nam\" target=\"_blank\" rel=\"noopener\" type=\"xem thêm đồng hồ nam\">đồng hồ nam</a> còn có lịch thứ và lịch ngày cho người dùng dễ dàng theo dõi khi cần</p>', 18635000, NULL, NULL, 'dong-ho-rolex', 'on', 'uploads/1684723649_dong-ho-9.jpg', NULL, 15, 1, '2023-05-21 19:47:29', 'stocking', '2023-05-24 02:02:43', NULL);
INSERT INTO `products` (`id`, `title`, `describe`, `detail`, `price`, `img_describe`, `price_old`, `slug`, `outstanding`, `img`, `number_img`, `category_id`, `user_id`, `created_at`, `status`, `updated_at`, `deleted_at`) VALUES
(14, 'Apple MacBook Air M1 2020', 'Chip 1.1GHz dual-core 10th-generation Intel Core i3 processor Turbo Boost up to 3.2GHz\r\nCard Intel Iris Plus Graphics\r\nMàn Hình: Retina display 2560×1600 with True Tone\r\nRam 8GB 3733MHz LPDDR4X memory\r\nỔ cứng 256GB SSD storage\r\nBàn phím cắt kéo Magic Keyboard\r\nTouch ID\r\nTrọng lượng: 1,29kg', '<h3>Laptop Apple MacBook Air M1 2020 thuộc dòng laptop cao cấp sang trọng có cấu hình mạnh mẽ, chinh phục được các tính năng văn phòng lẫn đồ hoạ mà bạn mong muốn, thời lượng pin dài, thiết kế mỏng nhẹ sẽ đáp ứng tốt các nhu cầu làm việc của bạn.</h3>\r\n<h3>Chip Apple M1 tốc độ xử lý nhanh gấp 3.5 lần thế hệ trước</h3>\r\n<p>Chiếc MacBook này được trang bị con chip Apple M1 được sản xuất độc quyền bởi Nhà Táo trên tính trình <strong>5 nm</strong>, <strong>8 lõi</strong> bao gồm <strong>4 lõi</strong> tiết kiệm điện và <strong>4 lõi</strong> hiệu suất cao, mang đến một hiệu năng kinh ngạc, xử lý mọi tác vụ văn phòng một cách mượt mà như Word, Excel, Powerpoint,... thực hiện tốt các nhiệm vụ chỉnh sửa hình ảnh, kết xuất 2D trên các phần mềm Photoshop, AI,... máy còn hỗ trợ tiết kiệm được điện năng cao.</p>\r\n<p><strong>Đi cùng CPU là </strong>Card đồ họa tích hợp <strong>7 nhân GPU</strong> có hiệu năng vượt trội sau nhiều bài thử nghiệm hiệu năng đồ họa của benchmark, bạn có thể sử dụng nhiều phần mềm đồ họa chuyên nghiệp, thoả sức sáng tạo nội dung, render video ổn định với chất lượng hình ảnh cao.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/231244/apple-macbook-air-2020-mgn63saa-010920-090916.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple Macbook Air M1 (MGN73SA/A) - CPU\" src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-010920-090916.jpg\" alt=\"Apple Macbook Air M1 (MGN73SA/A) - CPU\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-010920-090916.jpg\" /></a></p>\r\n<p>Máy được trang bị RAM 8 GB cho khả năng đa nhiệm cao, bạn có thể mở cùng lúc nhiều cửa sổ hoặc ứng dụng để phục vụ cho công việc, giải trí của mình ví dụ như vừa mở Chrome tra cứu thông tin vừa mở Word để làm việc cực kỳ tiện lợi mà không cần lo lắng là máy sẽ bị đơ.</p>\r\n<p>MacBook sở hữu ổ cứng SSD 256 GB cho tốc độ xử lý nhanh chóng, thao tác cuộn trong Safari cực mượt, đánh thức máy đang trong chế độ ngủ chỉ mất vài giây và đem đến không gian lưu trữ rộng rãi bạn cứ thoải mái lưu lại những bộ phim hay mà không lo nó sẽ chiếm chỗ của các tệp tài liệu công việc.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/231244/Slider/apple-macbook-air-2020-mgn63saa-130121-0959360.jpg\"><img class=\" ls-is-cached lazyloaded\" src=\"https://cdn.tgdd.vn/Products/Images/44/231244/Slider/apple-macbook-air-2020-mgn63saa-130121-0959360.jpg\" alt=\"aptop Apple MacBook Air M1 2020 (MGN63SA/A)  - SSD\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/231244/Slider/apple-macbook-air-2020-mgn63saa-130121-0959360.jpg\" /></a></p>\r\n<p>Bên cạnh sử dụng con chip mới Apple còn ra mắt phiên bản hệ điều hành macOS Big Sur với giao diện hoàn hảo hơn, các chuyển động cuộn, phóng to và chuyển tiếp màn hình mượt mà. Ngoài đổi mới giao diện <strong>macOS Big Sur</strong> còn mang đến khả năng phản hồi nhanh chóng và kho ứng dụng khổng lồ.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/231244/apple-macbook-air-2020-mgn63saa-102320-082331.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple Macbook Air M1 (MGN73SA/A) - Hệ điều hành\" src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-102320-082331.jpg\" alt=\"Apple Macbook Air M1 (MGN73SA/A) - Hệ điều hành\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-102320-082331.jpg\" /></a></p>\r\n<h3>Thiết kế sang trọng, tinh tế</h3>\r\n<p>MacBook Air 2020 không những thừa hưởng thiết kế mỏng nhẹ, hiện đại của các thế hệ trước mà còn học hỏi thêm phong cách hiện đại của các dòng Macbook Pro. Trọng lượng máy chỉ vỏn vẹn <strong>1.29 kg</strong> và mỏng của thân máy là <strong>16.1 mm</strong> có tính cơ động cao, dễ đem theo xử lý công việc.</p>\r\n<p>Vỏ máy được thiết kế nguyên khối từ nguyên liệu nhôm tái chế 100% vừa góp phần bảo vệ môi trường vừa cho độ bền cao, chịu va đập tốt bảo vệ các linh kiện bên trong an toàn nếu có xảy ra va chạm mạnh.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/231244/apple-macbook-air-2020-mgn63saa-011120-091138.jpg\"><img class=\" lazyloaded\" title=\"Apple Macbook Air M1 (MGN73SA/A) - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-011120-091138.jpg\" alt=\"Apple Macbook Air M1 (MGN73SA/A) - Thiết kế\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-011120-091138.jpg\" /></a></p>\r\n<p><strong>Magic Keyboard</strong> có hành trình phím <strong>1 mm</strong> mang lại trải nghiệm gõ nhạy, thoải mái và yên tĩnh, bàn phím còn được trang bị thêm đèn nền vừa tạo cảm giác sang trọng vừa hỗ trợ bạn gõ phím chính xác hơn trong môi trường thiếu sáng.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/231244/apple-macbook-air-2020-mgn63saa-011220-091223.jpg\"><img class=\" lazyloaded\" title=\"Apple Macbook Air M1 (MGN73SA/A) - Bàn phím\" src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-011220-091223.jpg\" alt=\"Apple Macbook Air M1 (MGN73SA/A) - Bàn phím\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-011220-091223.jpg\" /></a></p>\r\n<p>Laptop được trang bị 2 cổng kết nối <strong>Thunderbolt 3 </strong>với tốc độ truyền tải lên đến <strong>40 Gb/s</strong> cho tốc độ truyền tải nhanh gấp 2 lần so với thế hệ Thunderbolt 2 trước đây. Bên cạnh Thunderbolt 3 máy còn được trang bị thêm kết nối không dây là <strong>Wi-Fi 6 </strong>cho tốc độ truyền tải dữ liệu nhanh chóng lên đến <strong>10.000 Mbps</strong> cao hơn Wi-Fi 5 chỉ có <strong>7.000 Mbps</strong> và <strong>Bluetooth v5.0 </strong>có tốc độ tối đa là <strong>50 Mbps</strong> cho bạn trải nghiệm mượt mà hơn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/231244/apple-macbook-air-2020-mgn63saa-011320-091301.jpg\"><img class=\" lazyloaded\" title=\"Apple Macbook Air M1 (MGN73SA/A) - Kết nối\" src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-011320-091301.jpg\" alt=\"Apple Macbook Air M1 (MGN73SA/A) - Kết nối\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-011320-091301.jpg\" /></a></p>\r\n<p>Apple trang bị cho chiếc Macbook M1 này <strong>bảo mật </strong><strong>vân tay </strong>giúp bạn mở khóa nhanh chóng chỉ với một cái chạm nhẹ. Bên cạnh đó, vân tay của bạn sẽ được tích hợp vào việc xác nhận thông tin khi mua sắm online hay truy cập vào các tài liệu có bảo mật mà không cần phải nhập mật khẩu cực kỳ tiện lợi.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/231244/apple-macbook-air-2020-mgn63saa-102420-082427.jpg\"><img class=\" lazyloaded\" title=\"Apple Macbook Air M1 (MGN73SA/A) - ID\" src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-102420-082427.jpg\" alt=\"Apple Macbook Air M1 (MGN73SA/A) - ID\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-102420-082427.jpg\" /></a></p>\r\n<h3>Màu sắc chân thực, hình ảnh sắc nét </h3>\r\n<p>Laptop sở hữu màn hình Retina<strong> </strong>13.3 inch<strong> </strong>cao cấp cho hình ảnh sắc nét màu sắc tự nhiên. Kết hợp cùng công nghệ True Tone<strong> </strong>giúp điều chỉnh cân bằng sắc trắng cũng như độ sáng để màu sắc hình ảnh hiển thị chính xác nhất.</p>\r\n<p>Ngoài ra, góc nhìn của máy cũng được mở rộng hơn nhờ có công nghệ <strong>IPS</strong> đem lại trải nghiệm nhìn đã mắt, dù bạn nhìn màn hình bằng góc nghiêng.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/231244/apple-macbook-air-2020-mgn63saa-011420-091439.jpg\"><img class=\" lazyloaded\" title=\"Apple Macbook Air M1 (MGN73SA/A) - Màn hình\" src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-011420-091439.jpg\" alt=\"Apple Macbook Air M1 (MGN73SA/A) - Màn hình\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-011420-091439.jpg\" /></a></p>\r\n<p>MacBook Air M1 được trang bị camera <strong>FaceTime HD</strong> giúp bạn gọi video cho người thân, bạn bè với chất lượng hiển thị cao. Tích hợp dãy <strong>3 micro</strong> giúp truyền tải giọng nói của bạn chính xác hơn. </p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/231244/apple-macbook-air-2020-mgn63saa-102420-082456.jpg\"><img class=\" lazyloaded\" title=\"Apple Macbook Air M1 (MGN73SA/A) - Camera \" src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-102420-082456.jpg\" alt=\"Apple Macbook Air M1 (MGN73SA/A) - Camera \" data-src=\"https://cdn.tgdd.vn/Products/Images/44/231244/apple-macbook-air-2020-mgn63saa-102420-082456.jpg\" /></a></p>\r\n<p>Laptop Apple MacBook Air M1 2020 với hiệu năng mạnh mẽ đáp ứng tốt mọi công việc, thiết kế cực mỏng sẽ là sự lựa chọn tuyệt vời dành cho bạn.</p>', 26800000, NULL, NULL, 'apple-macbook-air-m1-2020', NULL, 'uploads/1684734524_1668652373-grey-1-org-copy.jpg', NULL, 17, 1, '2023-05-21 22:48:44', 'stocking', '2023-05-22 19:19:32', NULL),
(15, 'Laptop Apple MacBook Air M2', '<p class=\"lileft\">CPU:&nbsp;<span class=\"comma\">Apple M2</span><span class=\"\">100GB/s</span></p>\r\n<p class=\"lileft\">RAM:&nbsp;<span class=\"\">8 GB</span></p>\r\n<p class=\"lileft\">Ổ cứng:&nbsp;<span class=\"\">256 GB SSD</span></p>\r\n<p class=\"lileft\">M&agrave;n h&igrave;nh:&nbsp;<span class=\"comma\">13.6\"</span><span class=\"\">Liquid Retina (2560 x 1664)</span></p>\r\n<p class=\"lileft\">Card m&agrave;n h&igrave;nh:&nbsp;<span class=\"comma\">Card t&iacute;ch hợp</span><span class=\"\">8 nh&acirc;n GPU</span></p>\r\n<p class=\"lileft\">Cổng kết nối:&nbsp;<span class=\"comma\">2 x Thunderbolt 3</span><span class=\"comma\">Jack tai nghe 3.5 mm</span><span class=\"\">MagSafe 3</span></p>\r\n<p class=\"lileft\">Đặc biệt:&nbsp;<span class=\"\">C&oacute; đ&egrave;n b&agrave;n ph&iacute;m</span></p>\r\n<p class=\"lileft\">Hệ điều h&agrave;nh:&nbsp;<span class=\"\">Mac OS</span></p>\r\n<p class=\"lileft\">Thiết kế:&nbsp;<span class=\"\">Vỏ kim loại</span></p>\r\n<p class=\"lileft\">K&iacute;ch thước, khối lượng:&nbsp;<span class=\"\">D&agrave;i 304.1 mm - Rộng 215 mm - D&agrave;y 11.3 mm - Nặng 1.24 kg</span></p>', '<h3>Lột x&aacute;c ngoạn mục với thiết kế thời thượng, sang trọng&nbsp;</h3>\r\n<p>Sự đẳng cấp đến từ ngoại h&igrave;nh của nh&agrave; Apple l&agrave; điều kh&ocirc;ng thể phủ nhận v&agrave; kh&oacute; c&oacute; d&ograve;ng sản phẩm c&ugrave;ng ph&acirc;n kh&uacute;c n&agrave;o c&oacute; thể qua mặt được. Vẫn l&agrave; lớp vỏ&nbsp;<strong>kim loại nguy&ecirc;n khối</strong>&nbsp;cứng c&aacute;p c&ugrave;ng c&aacute;c cạnh g&oacute;c vu&ocirc;ng vức, sang trọng nhưng chiếc&nbsp;MacBook Air&nbsp;2022 năm nay đ&atilde; tho&aacute;t ra khỏi ng&ocirc;n ngữ thiết kế nhẹ nh&agrave;ng vốn c&oacute; từ rất l&acirc;u v&agrave; kho&aacute;c l&ecirc;n diện mạo mới tương tự như &ldquo;đ&agrave;n anh&rdquo; MacBook Pro.</p>\r\n<p>Bề d&agrave;y&nbsp;<strong>11.3 mm</strong>&nbsp;c&ugrave;ng c&acirc;n nặng ấn tượng&nbsp;<strong>1.24 kg</strong>&nbsp;sẽ l&agrave; một điểm cộng ho&agrave;n hảo cho khả năng di động của m&aacute;y, lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh c&ugrave;ng sinh vi&ecirc;n, d&acirc;n văn ph&ograve;ng đến trường học, c&ocirc;ng ty hay kh&aacute;m ph&aacute; c&aacute;c cuộc phi&ecirc;u lưu c&ugrave;ng người d&ugrave;ng s&aacute;ng tạo v&agrave; đặc biệt l&agrave; những chuyến c&ocirc;ng t&aacute;c xa của doanh nh&acirc;n.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-2-2.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-2-2.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - Thiết kế\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-2-2.jpg\" /></a></p>\r\n<p>Một sự thay đổi r&otilde; rệt tr&ecirc;n chiếc b&agrave;n ph&iacute;m&nbsp;<strong>Magic Key</strong>&nbsp;của d&ograve;ng&nbsp;laptop Apple&nbsp;M2 năm nay ch&iacute;nh l&agrave; k&iacute;ch thước của h&agrave;ng ph&iacute;m chức năng F được gia tăng bằng với c&aacute;c d&ograve;ng ph&iacute;m kh&aacute;c, cho thao t&aacute;c sử dụng chuẩn x&aacute;c, kh&ocirc;ng bị nhầm lẫn. Trải nghiệm g&otilde; ph&iacute;m nhẹ nh&agrave;ng, &ecirc;m tay kết hợp c&ugrave;ng&nbsp;<strong>đ&egrave;n nền</strong>&nbsp;hỗ trợ người d&ugrave;ng l&agrave;m việc dễ d&agrave;ng trong m&ocirc;i trường thiếu s&aacute;ng.&nbsp;</p>\r\n<p>T&iacute;nh năng&nbsp;<strong>cảm biến v&acirc;n tay</strong>&nbsp;t&iacute;ch hợp n&uacute;t nguồn mang đến khả năng mở kh&oacute;a m&aacute;y v&agrave; truy cập c&aacute;c ứng dụng kh&aacute;c một c&aacute;ch nhanh ch&oacute;ng, kh&ocirc;ng cần tốn nhiều thời gian hay phải nhớ mật khẩu như c&aacute;c kiểu bảo mật truyền thống.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-ab-8.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - Cảm biến v&acirc;n tay\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-ab-8.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - Cảm biến v&acirc;n tay\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-ab-8.jpg\" /></a></p>\r\n<p>C&aacute;c cổng giao tiếp hữu dụng như Jack tai nghe 3.5 mm, 2 cổng Thunderbolt 3 hỗ trợ truyền xuất dữ liệu với tốc độ l&ecirc;n đến&nbsp;<strong>40 Gbps</strong>&nbsp;c&ugrave;ng sạc nam ch&acirc;m&nbsp;<strong>MagSafe 3</strong>&nbsp;với thiết kế nhỏ nhắn, cho khả năng sạc pin nhanh ch&oacute;ng m&agrave; kh&ocirc;ng cần sử dụng đến c&aacute;c d&acirc;y c&aacute;p d&agrave;i rườm r&agrave;, đồng thời c&ograve;n t&ocirc;n th&ecirc;m vẻ đẹp tối giản của m&aacute;y.&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-9.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - Cổng kết nối\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-9.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - Cổng kết nối\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-9.jpg\" /></a></p>\r\n<h3>Ph&aacute; vỡ mọi giới hạn nhờ sức mạnh đến từ con Apple M2</h3>\r\n<p>Sự xuất hiện của&nbsp;chip Apple M2&nbsp;tuy c&oacute; mặt cấu tạo tương đồng với chip M1 nhưng hiệu suất hoạt động hứa hẹn cao hơn&nbsp;<strong>18%</strong>&nbsp;v&agrave; nhanh hơn&nbsp;<strong>1.9 lần</strong>&nbsp;so với chip của c&aacute;c d&ograve;ng laptop 10 l&otilde;i kh&aacute;c, đ&iacute;ch thực l&agrave; nguồn sức mạnh tiềm năng cho mọi t&aacute;c vụ từ học tập, l&agrave;m việc đến đồ họa, kỹ thuật chuy&ecirc;n s&acirc;u.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-ab-2.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - Chip Apple M2\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-ab-2.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - Chip Apple M2\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-ab-2.jpg\" /></a></p>\r\n<p>Theo c&ocirc;ng bố của h&atilde;ng, card đồ họa&nbsp;<strong>GPU 8 nh&acirc;n</strong>&nbsp;cho khả năng hoạt động mạnh mẽ hơn&nbsp;<strong>35%</strong>&nbsp;so với d&ograve;ng chip M1, xử l&yacute; l&ecirc;n đến&nbsp;<strong>15.8 ngh&igrave;n tỷ</strong>&nbsp;t&aacute;c vụ trong&nbsp;<strong>1 gi&acirc;y</strong>&nbsp;n&ecirc;n c&aacute;c c&ocirc;ng việc li&ecirc;n quan đến h&igrave;nh ảnh, đồ họa, video,... đều được giải quyết rất mượt m&agrave;.</p>\r\n<p>Laptop RAM 8 GB&nbsp;cho ph&eacute;p người d&ugrave;ng sử dụng c&ugrave;ng l&uacute;c nhiều cửa sổ ứng dụng kh&aacute;c nhau với độ đa nhiệm mượt m&agrave; đ&aacute;ng kể, vừa l&agrave;m việc tr&ecirc;n Photoshop vừa nghe nhạc vẫn rất trơn tru. Đi k&egrave;m theo đ&oacute; l&agrave; ổ cứng&nbsp;<strong>SSD 256 GB</strong>&nbsp;mang đến khả năng lưu trữ vừa đủ c&aacute;c t&agrave;i liệu, ứng dụng học tập đồng thời tăng tốc độ đọc ghi cho m&aacute;y.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-3-2.jpg\"><img class=\" lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - Cấu h&igrave;nh\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-3-2.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - Cấu h&igrave;nh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-3-2.jpg\" /></a></p>\r\n<p>Đặc biệt hơn hết, sức mạnh đến từ con chip Apple M2 cho ph&eacute;p bạn ph&aacute;t v&agrave; chỉnh sửa nhiều luồng video&nbsp;<strong>4K</strong>,&nbsp;<strong>8K ProRes 12</strong>&nbsp;ấn tượng, chưa bao giờ l&agrave;m c&aacute;c t&iacute;n đồ nh&agrave; T&aacute;o thất vọng với khả năng đ&aacute;p ứng ho&agrave;n hảo c&aacute;c t&aacute;c vụ li&ecirc;n quan đến đồ họa - kỹ thuật.</p>\r\n<h3>Trải nghiệm h&igrave;nh ảnh, &acirc;m thanh tr&ecirc;n cả tuyệt vời&nbsp;</h3>\r\n<p>Độ ph&acirc;n giải&nbsp;<strong>Liquid Retina (2560 x 1664)</strong>&nbsp;c&ugrave;ng chiếc m&agrave;n h&igrave;nh&nbsp;<strong>13.6 inch</strong>&nbsp;viền mỏng đắm ch&igrave;m bạn v&agrave;o kh&ocirc;ng gian giải tr&iacute; sống động tr&ecirc;n từng khung h&igrave;nh, l&yacute; tưởng h&oacute;a mọi nội dung hiển thị từ học tập, l&agrave;m việc cơ bản đến xem phim, thiết kế,... Độ s&aacute;ng&nbsp;<strong>500 nits</strong>&nbsp;hiển thị m&agrave;u sắc rực rỡ ngay cả khi sử dụng&nbsp;laptop&nbsp;trong m&ocirc;i trường &aacute;nh s&aacute;ng mạnh.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-5-1.jpg\"><img class=\" lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - M&agrave;n h&igrave;nh\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-5-1.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - M&agrave;n h&igrave;nh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-5-1.jpg\" /></a></p>\r\n<p>Sự kết hợp giữa&nbsp;<strong>dải m&agrave;u rộng P3</strong>&nbsp;c&ugrave;ng&nbsp;<strong>1 tỷ m&agrave;u</strong>&nbsp;tạo n&ecirc;n một bức tranh ho&agrave;n mỹ cho mọi trải nghiệm h&igrave;nh ảnh của người d&ugrave;ng với m&agrave;u sắc sinh động v&agrave; chuẩn x&aacute;c tr&ecirc;n từng vật thể nhỏ nhất. C&ocirc;ng nghệ&nbsp;<strong>True Tone</strong>&nbsp;cho khả năng tự động điều chỉnh mức độ &aacute;nh s&aacute;ng ph&ugrave; hợp với m&ocirc;i trường, gi&uacute;p h&igrave;nh ảnh được tự nhi&ecirc;n hơn v&agrave; giảm thiểu hiện tượng mỏi mắt.&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-6-1.jpg\"><img class=\" lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - Độ t&aacute;i tạo m&agrave;u\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-6-1.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - Độ t&aacute;i tạo m&agrave;u\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-6-1.jpg\" /></a></p>\r\n<p>Hệ thống &acirc;m thanh của chiếc&nbsp;MacBook M2&nbsp;l&agrave; sự cộng hưởng giữa&nbsp;<strong>4 Loa</strong>,&nbsp;<strong>Dolby Atmos</strong>&nbsp;v&agrave; c&ocirc;ng nghệ&nbsp;<strong>Spatial Audio</strong>&nbsp;cho chất lượng &acirc;m đa chiều sống động, mang đến trải nghiệm xem phim, nghe nhạc đ&aacute;nh bật mọi đối thủ kh&aacute;c.&nbsp;</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-7-1.jpg\"><img class=\" lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - &Acirc;m thanh\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-7-1.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - &Acirc;m thanh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-7-1.jpg\" /></a></p>\r\n<p><strong>Camera Facetime HD 1080p</strong>&nbsp;gi&uacute;p qu&aacute; tr&igrave;nh học tập, l&agrave;m việc trực tuyến hay gọi video diễn ra su&ocirc;n sẻ với chất lượng h&igrave;nh ảnh r&otilde; n&eacute;t hơn, hạn chế tối đa t&igrave;nh trạng nh&ograve;e hay mờ h&igrave;nh.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-8.jpg\"><img class=\" lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - Webcam\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-8.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - Webcam\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-8.jpg\" /></a></p>\r\n<h3>Apple silicon v&agrave; macOS mang đến khả năng bảo mật n&acirc;ng cao</h3>\r\n<p><strong>Apple silicon</strong>&nbsp;l&agrave; vi xử l&yacute; được thiết kế ri&ecirc;ng tr&ecirc;n tất cả c&aacute;c sản phẩm của Apple dưới một kiến tr&uacute;c chung, tối ưu to&agrave;n bộ phần mềm tr&ecirc;n hệ sinh th&aacute;i Apple để sử dụng dễ d&agrave;ng đồng thời kh&acirc;u kiểm so&aacute;t được quản l&yacute; chặt chẽ hơn mang đến khả năng bảo mật cực tốt. T&iacute;nh năng bảo mật v&acirc;n tay tr&ecirc;n m&aacute;y gi&uacute;p vừa mở m&aacute;y nhanh ch&oacute;ng vừa tăng cường độ an to&agrave;n cho dữ liệu c&aacute; nh&acirc;n của bạn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-12.jpg\"><img class=\" lazyloaded\" title=\"MacBook Air M2 2022 8-core GPU - Apple Silicon\" src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-12.jpg\" alt=\"MacBook Air M2 2022 8-core GPU - Apple Silicon\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-12.jpg\" /></a></p>\r\n<p>Hệ điều h&agrave;nh&nbsp;<strong>macOS</strong>&nbsp;độc quyền của nh&agrave; Apple cung cấp tr&igrave;nh quản l&yacute; ch&iacute;nh&nbsp;<strong>System Preferences</strong>&nbsp;với nhiều c&ocirc;ng cụ hiện đại được t&iacute;ch hợp, tăng cường độ bảo mật cho ph&eacute;p người d&ugrave;ng dễ d&agrave;ng thiết lập, kiểm so&aacute;t v&agrave; tự quản l&yacute; m&aacute;y t&iacute;nh của m&igrave;nh tốt hơn.&nbsp; &nbsp;&nbsp;</p>', 29155500, NULL, NULL, 'laptop-apple-macbook-air-m2', 'on', 'uploads/1684734649_1668652814-apple-macbook-air-m2-2022-xam-200x200.jpg', NULL, 17, 1, '2023-05-21 22:50:49', 'stocking', '2023-05-21 22:50:49', NULL),
(16, 'Laptop Apple MacBook Air M1 2020', '<p class=\"lileft\">CPU:&nbsp;<span class=\"\">Apple M1</span></p>\r\n<p class=\"lileft\">RAM:&nbsp;<span class=\"\">16 GB</span></p>\r\n<p class=\"lileft\">Ổ cứng:&nbsp;<span class=\"\">256 GB SSD</span></p>\r\n<p class=\"lileft\">M&agrave;n h&igrave;nh:&nbsp;<span class=\"comma\">13.3\"</span><span class=\"\">Retina (2560 x 1600)</span></p>\r\n<p class=\"lileft\">Card m&agrave;n h&igrave;nh:&nbsp;<span class=\"comma\">Card t&iacute;ch hợp</span><span class=\"\">7 nh&acirc;n GPU</span></p>\r\n<p class=\"lileft\">Cổng kết nối:&nbsp;<span class=\"comma\">2 x Thunderbolt 3 (USB-C)</span><span class=\"\">Jack tai nghe 3.5 mm</span></p>\r\n<p class=\"lileft\">Đặc biệt:&nbsp;<span class=\"\">C&oacute; đ&egrave;n b&agrave;n ph&iacute;m</span></p>\r\n<p class=\"lileft\">Hệ điều h&agrave;nh:&nbsp;<span class=\"\">Mac OS</span></p>\r\n<p class=\"lileft\">Thiết kế:&nbsp;<span class=\"\">Vỏ kim loại nguy&ecirc;n khối</span></p>\r\n<p class=\"lileft\">K&iacute;ch thước, trọng lượng:&nbsp;<span class=\"\">D&agrave;i 304.1 mm - Rộng 212.4 mm - D&agrave;y 4.1 mm đến 16.1 mm - Nặng 1.29 kg</span></p>\r\n<p class=\"lileft\">Thời điểm ra mắt:&nbsp;<span class=\"\">2020</span></p>', '<h3>Laptop Apple MacBook Air M1 2020 có thiết kế đẹp, sang trọng với CPU M1 độc quyền từ Apple cho hiệu năng đồ họa cao, màn hình Retina hiển thị siêu nét cùng với hệ thống bảo mật tối ưu.</h3>\r\n<h3>Hiệu năng ấn tượng đến từ chip M1</h3>\r\n<p>Chip M1 được Apple thiết kế dành riêng cho MacBook mang đến hiệu năng vượt trội. Thực hiện tốt các tác vụ văn phòng trên các phần mềm như Word, Excel, Powerpoint,... Thiết kế đồ hoạ cũng chuyên nghiệp không kém, cho phép bạn chỉnh sửa hình ảnh với dung lượng lớn, kết xuất 2D mượt mà trên các phần mềm Photoshop, AI, Figma,...</p>\r\n<p>Card đồ họa <strong>GPU 7 nhân</strong> đem lại hiệu suất cao đáng kinh ngạc, đồ họa cao hơn gấp 5 lần, thảo sức sáng tạo nội dung, kết xuất 3D ổn định, render video, phát trực tiếp với chất lượng cao với chất ảnh sắc nét cùng độ phân giải lên đến 4K.</p>\r\n<p>Bộ nhớ <strong>RAM 16 GB</strong> cho phép bạn sử dụng đa nhiệm, bạn có thể thao tác nhiều ứng dụng cùng một lúc thoải mái với những tác vụ như lướt web, soạn thảo văn bản, xem video hay thiết kế hình ảnh bằng Photoshop, Adobe IIIustrator,...</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/239552/apple-macbook-air-m1-2020-z124000de-4-1-1.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Cấu hình\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-4-1-1.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Cấu hình\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-4-1-1.jpg\" /></a></p>\r\n<p><strong>Ổ cứng SSD 256 GB</strong> giúp máy có tốc độ đọc ghi nhanh chóng đồng thời mang lại không gian bộ nhớ đủ lớn phục vụ cho nhu cầu lưu trữ của bạn như tài liệu trong học tập, dữ liệu trong công việc, các bộ phim hoặc bản nhạc trong giải trí. Đồng thời, tiết kiệm được thời gian khởi động máy hoặc mở các ứng dụng nặng, cải thiện được thời gian mở nhanh chóng hơn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/239552/apple-macbook-air-m1-2020-z124000de-5-1.jpg\"><img class=\" ls-is-cached lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - SSD\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-5-1.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - SSD\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-5-1.jpg\" /></a></p>\r\n<h3>Màn hình Retina hiển thị sắc nét, màu sắc chính xác</h3>\r\n<p><strong>Màn hình 13.3 inch Retina</strong> cho hình ảnh chi tiết, sắc nét với độ phân giải <strong>2560 × 1600</strong>, màn hình mới này có gam màu rộng P3 và độ phủ màu <strong>125% sRGB</strong> cho những màu sắc chân thật và chính xác nhất. Cùng với đó là độ sáng lên đến <strong>400 nits</strong> đem đến khung hình rực rỡ, tươi sáng, hiển thị tốt kể cả khi sử dụng ở nơi có cường độ ánh sáng cao.</p>\r\n<p>Công nghệ <strong>True Tone Technology</strong> tự điều chỉnh điểm trắng, ánh sáng và màu sắc của màn hình theo nhiệt độ, ánh sáng của môi trường để có trải nghiệm hình ảnh tự nhiên hơn. </p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/239552/apple-macbook-air-m1-2020-z124000de-7.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Hình ảnh\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-7.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Hình ảnh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-7.jpg\" /></a></p>\r\n<p>Hệ thống<strong> loa kép</strong> cho âm thanh to rõ, sống động để bạn có trải nghiệm nghe nhạc, xem phim và gọi điện trực tuyến thoải mái với âm thanh chất lượng cao. Tạo cho bạn cảm giác đắm chìm trong những chương trình giải trí hấp dẫn.</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/239552/apple-macbook-air-m1-2020-z124000de-8.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Âm thanh\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-8.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Âm thanh\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-8.jpg\" /></a></p>\r\n<p><strong>FaceTime Camera </strong>cho hình ảnh rõ nét kết hợp với <strong>3 microphone</strong> thuận tiện cho nhu cầu họp hoặc học online hay hội đàm trực tuyến, giải quyết hiệu quả công việc từ xa qua các phần mền Zoom, Google Meet,...</p>\r\n<h3>Vẻ ngoài sang trọng, đẳng cấp</h3>\r\n<p>MacBook Air được bao bọc bởi lớp vỏ kim loại nguyên khối từ nguyên liệu tái chế giúp thân máy trông cứng cáp và sang trọng, nhưng vẫn mang đến sự gọn nhẹ để thoả mãn được nhu cầu di chuyển linh hoạt của người dùng cùng độ dày mỏng <strong>16.1 mm </strong>và trọng lượng chỉ <strong>1.29 kg</strong> thoả sức mang máy đi khắp mọi nơi mà không lo ngại như đi học, đi công tác, đi học,...</p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/239552/apple-macbook-air-m1-2020-z124000de-2-1.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-2-1.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Thiết kế\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-2-1.jpg\" /></a></p>\r\n<p>Apple sử dụng bàn phím <strong>Magic Key</strong> gõ phím êm ái, yên tĩnh và ít tiếng ồn. Ngoài ra bàn phím còn trang bị đèn nền giúp dễ dàng thao tác, soạn thảo văn bản trong điều kiện thiếu sáng.</p>\r\n<p><strong>Chip bảo mật T2</strong> mã hóa dữ liệu ổ cứng cùng giúp mọi thông tin trên MacBook M1 đều được bảo mật. Mở khóa bằng <strong>cảm biến vân tay</strong> giúp người dùng mở khóa xác thực hoặc đăng nhập tài khoản nhanh chóng, đảm bảo thông tin cá nhân và dữ liệu trong công việc luôn được bảo mật cao. </p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/239552/apple-macbook-air-m1-2020-z124000de-6.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Vân tay\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-6.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Vân tay\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de-6.jpg\" /></a></p>\r\n<p>Laptop trang bị 2 cổng <strong>Thunderbolt 3 (USB-C)</strong> có băng thông kết nối lên tới 40 Gbps cho phép xuất ra màn hình với chất lượng hình ảnh cao, đồng thời hỗ trợ khả năng truyền tải dữ liệu, cải thiện được thời gian sạc nhanh hơn.</p>\r\n<p>Khả năng kết nối không dây trên dòng Macbook Air này luôn được đảm bảo tốt nhờ chuẩn <a title=\"Wi-Fi 6 AX201 là gì\" href=\"https://www.thegioididong.com/hoi-dap/wi-fi-chuan-80211ax-la-gi-tim-hieu-ve-wi-fi-the-he-thu-6-1187524\" target=\"_blank\" rel=\"noopener\">Wi-Fi 6 AX201</a> cùng<strong> Bluetooth 5.0</strong>. Từ đó, nâng cao hiệu suất công việc, nâng cấp đường truyền luôn được ổn định, tránh xảy ra lỗi khi thao tác. </p>\r\n<p><a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/239552/apple-macbook-air-m1-2020-z124000de9.jpg\"><img class=\" lazyloaded\" title=\"Apple MacBook Air M1 2020 (Z124000DE) - Cổng kết nối\" src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de9.jpg\" alt=\"Apple MacBook Air M1 2020 (Z124000DE) - Cổng kết nối\" data-src=\"https://cdn.tgdd.vn/Products/Images/44/239552/apple-macbook-air-m1-2020-z124000de9.jpg\" /></a></p>\r\n<p>Laptop Apple MacBook Air M1 2020 (Z124000DE) là chiếc <a title=\"Xem thêm một số mẫu laptop Mỏng nhẹ đang được bán tại Thegioididong.com\" href=\"https://www.thegioididong.com/laptop?g=mong-nhe-thoi-trang\" target=\"_blank\" rel=\"noopener\">laptop mỏng nhẹ</a> nhưng có cấu hình mạnh mẽ, nhiều tính năng hiện đại đáng để sở hữu trong phân khúc, thích hợp cho các tác vụ văn phòng thường ngày và thiết kế đồ hoạ.</p>', 33900000, NULL, NULL, 'laptop-apple-macbook-air-m1-2020', 'on', 'uploads/1684734729_1668653033-space-1-org-1-copy.jpg', NULL, 17, 1, '2023-05-21 22:52:09', 'stocking', '2023-05-23 20:02:53', NULL),
(17, 'Đồng hồ Roberto', 'Chip 1.1GHz dual-core 10th-generation Intel Core i3 processor Turbo Boost up to 3.2GHz\r\nCard Intel Iris Plus Graphics\r\nMàn Hình: Retina display 2560×1600 with True Tone\r\nRam 8GB 3733MHz LPDDR4X memory\r\nỔ cứng 256GB SSD storage\r\nBàn phím cắt kéo Magic Keyboard\r\nTouch ID\r\nTrọng lượng: 1,29kg', '<p>• Các <a title=\"Xem thêm các mẫu đồng hồ Roberto Cavalli tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dong-ho-deo-tay-roberto-cavalli\" target=\"_blank\" rel=\"noopener\">đồng hồ Roberto Cavalli</a> đến từ Ý được xem như là là sự kết hợp hoàn hảo giữa nghệ thuật và kỹ thuật, các mẫu mã của hãng được sản xuất với chất lượng tốt cùng các và các chi tiết tinh tế. Từ khi thành lập đến nay, thương hiệu đã luôn tạo ra những bộ sưu tập thời trang tiên tiến và đầy phong cách phù hợp với những ai yêu thích sự sang trọng và đẳng cấp.</p>\r\n<p>• Mẫu <a title=\"Đồng hồ Roberto Cavalli 42 mm Nam RC5G049L0035 \" href=\"https://www.thegioididong.com/dong-ho-deo-tay/roberto-cavalli-rc5g049l0035-nam\" target=\"_blank\" rel=\"noopener\">đồng hồ Roberto Cavalli 42 mm Nam RC5G049L0035</a> được phái mạnh yêu thích với thiết kế rất nam tính, mạnh mẽ. Mặt đồng hồ giúp ta gợi nhớ đến bảng điều khiển của các xe đua bao gồm 6 kim và mặt phụ hình tròn, hỗ trợ bạn đo thời gian chính xác trong các hoạt động thể thao cùng họa tiết mũi tên được khắc ẩn trên phần mặt như những khát vọng tiến lên và những định hướng cho sự phát triển cho chủ nhân.</p>\r\n<p>• Thiết kế có kích thước mặt <strong>42 mm </strong>phù hợp với các chàng trai có cổ tay trung bình. Chất liệu mặt kính là kính khoáng, có sự bền bỉ cùng khả năng chống va đập tốt. Hơn hết nhờ khả năng dễ đánh bóng bề mặt kính khi bị trầy xước nhẹ, chiếc đồng hồ nam này sẽ thích hợp đeo mọi lúc mọi nơi.</p>\r\n<p>• Dây đeo của <a title=\"Xem thêm các mẫu đồng hồ nam tại Thế Giới Di Động\" href=\"https://www.thegioididong.com/dong-ho-deo-tay-nam\" target=\"_blank\" rel=\"noopener\">đồng hồ nam</a> được làm bằng da tổng hợp mang tone màu đen cá tính và lịch lãm. Chất liệu này sẽ là lựa chọn lý tưởng cho bạn nam thiết kế ôm tay, dễ dàng điều chỉnh kích thước linh hoạt. Ngoài ra, khung viền đồng hồ được làm từ thép không gỉ, vừa giúp nâng tầm sang trọng của mẫu mã lại vừa bền bỉ, hạn chế ăn mòn trước tác động từ môi trường.<img src=\"/phpmaster/project/ismart.com/admin/public/uploads/images/dong-ho-2.jpg\" alt=\"\" /></p>\r\n<p>• Mẫu đồng hồ có độ chống nước cao, lên đến <strong>20 ATM</strong>. Với thông số này, người dùng có thể thoải mái đeo khi bơi, lặn hay những hoạt động thể thao khám phá dưới biển. <strong>Lưu ý</strong>: không vặn bấm các nút trong quá trình bơi hoặc lặn.</p>\r\n<p>• Sản phẩm này không chỉ là một thiết kế mạnh mẽ mà còn được tích hợp tính năng bấm giờ thể thao cùng nhiều tiện ích khác như lịch ngày và <a href=\"https://www.thegioididong.com/dong-ho-deo-tay\">đồng hồ</a> 24 giờ giúp bạn có thể dễ dàng theo dõi thời gian một cách chính xác và thuận tiện. </p>', 22680000, NULL, NULL, 'dong-ho-roberto', 'on', 'uploads/1684735114_dong-ho-10.jpg', NULL, 15, 1, '2023-05-21 22:58:34', 'stocking', '2023-05-22 19:18:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '2023-05-14 04:04:46', '2023-05-14 04:04:46'),
(2, 'quảng lý thêm sửa xóa', '213', '2023-05-14 04:10:27', '2023-05-14 04:10:27'),
(3, '123', '123', '2023-05-14 04:16:04', '2023-05-14 04:16:04'),
(4, '231', '3', '2023-05-14 04:20:58', '2023-05-14 04:20:58'),
(5, 'Quản lý tin tức', 'thêm sửa xóa tin tức', '2023-05-14 04:54:32', '2023-05-14 04:54:32'),
(7, 'Quản lý tin tức123123', '213', '2023-05-15 06:38:16', '2023-05-15 06:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `created_at`) VALUES
(7, 7, 16, NULL),
(8, 7, 17, NULL),
(9, 7, 18, NULL),
(12, 1, 16, NULL),
(13, 1, 17, NULL),
(14, 1, 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `images` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `name`, `slug`, `images`, `created_at`, `updated_at`) VALUES
(7, 'Slide1', 'slide1', 'uploads/1684896631_638159582862671927_F-C1_1200x300.jpg', '2023-05-23 19:50:31', '2023-05-23 19:50:31'),
(8, 'slide2', 'slide2', 'uploads/1684897171_638172389462045489_F-C1_1200x300.jpg', '2023-05-23 19:59:31', '2023-05-23 19:59:31'),
(9, 'slide3', 'slide3', 'uploads/1684897224_slider-02.png', '2023-05-23 20:00:24', '2023-05-23 20:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `thumbnail_products`
--

CREATE TABLE `thumbnail_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_img` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `thumbnail_product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `thumbnail_products`
--

INSERT INTO `thumbnail_products` (`id`, `title_img`, `thumbnail_product_id`, `created_at`, `updated_at`) VALUES
(1, 'uploads/1684908860_icon-to-top.png', 17, '2023-05-23 23:14:20', '2023-05-23 23:14:20'),
(2, 'uploads/1684908860_img-detail.jpg', 17, '2023-05-23 23:14:20', '2023-05-23 23:14:20'),
(3, 'uploads/1684918177_dong-ho-8-1 (1).jpg', 17, '2023-05-24 01:49:37', '2023-05-24 01:49:37'),
(4, 'uploads/1684918177_dong-ho-8-1.jpg', 17, '2023-05-24 01:49:37', '2023-05-24 01:49:37'),
(5, 'uploads/1684918177_dong-ho-9.jpg', 17, '2023-05-24 01:49:37', '2023-05-24 01:49:37'),
(6, 'uploads/1684918177_dong-ho-10.jpg', 17, '2023-05-24 01:49:37', '2023-05-24 01:49:37'),
(11, 'uploads/1684918963_dong-ho-3-1.jpg', 13, '2023-05-24 02:02:43', '2023-05-24 02:02:43'),
(12, 'uploads/1684918963_dong-ho-7 (1).jpg', 13, '2023-05-24 02:02:43', '2023-05-24 02:02:43'),
(13, 'uploads/1684918963_dong-ho-7.jpg', 13, '2023-05-24 02:02:43', '2023-05-24 02:02:43'),
(14, 'uploads/1684918963_dong-ho-8-1.jpg', 13, '2023-05-24 02:02:43', '2023-05-24 02:02:43'),
(15, 'uploads/1684919017_dong-ho-3-1.jpg', 11, '2023-05-24 02:03:37', '2023-05-24 02:03:37'),
(16, 'uploads/1684919017_dong-ho-7 (1).jpg', 11, '2023-05-24 02:03:37', '2023-05-24 02:03:37'),
(17, 'uploads/1684919017_dong-ho-7.jpg', 11, '2023-05-24 02:03:37', '2023-05-24 02:03:37'),
(18, 'uploads/1684919017_dong-ho-10.jpg', 11, '2023-05-24 02:03:37', '2023-05-24 02:03:37'),
(19, 'uploads/1684919099_dong-ho-1.jpg', 12, '2023-05-24 02:04:59', '2023-05-24 02:04:59'),
(20, 'uploads/1684919099_dong-ho-7 (1).jpg', 12, '2023-05-24 02:04:59', '2023-05-24 02:04:59'),
(21, 'uploads/1684919099_dong-ho-7.jpg', 12, '2023-05-24 02:04:59', '2023-05-24 02:04:59'),
(22, 'uploads/1684919099_dong-ho-8-1 (1).jpg', 12, '2023-05-24 02:04:59', '2023-05-24 02:04:59'),
(23, 'uploads/1684919161_dien-thoai-13-1.jpg', 9, '2023-05-24 02:06:01', '2023-05-24 02:06:01'),
(24, 'uploads/1684919161_dien-thoai-14-1.jpg', 9, '2023-05-24 02:06:01', '2023-05-24 02:06:01'),
(25, 'uploads/1684919161_dien-thoai-15.jpg', 9, '2023-05-24 02:06:01', '2023-05-24 02:06:01'),
(26, 'uploads/1684920433_dien-thoai-1-1.jpg', 8, '2023-05-24 02:27:13', '2023-05-24 02:27:13'),
(27, 'uploads/1684920433_dien-thoai-2-1.jpg', 8, '2023-05-24 02:27:13', '2023-05-24 02:27:13'),
(28, 'uploads/1684920433_dien-thoai-3.jpg', 8, '2023-05-24 02:27:13', '2023-05-24 02:27:13'),
(29, 'uploads/1684920457_dien-thoai-1.jpg', 2, '2023-05-24 02:27:37', '2023-05-24 02:27:37'),
(30, 'uploads/1684920457_dien-thoai-2-1.jpg', 2, '2023-05-24 02:27:37', '2023-05-24 02:27:37'),
(31, 'uploads/1684920457_dien-thoai-3.jpg', 2, '2023-05-24 02:27:37', '2023-05-24 02:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '123', '123123@gmail.com', NULL, NULL, '$2y$10$T97V93Ol3kG/cBFIkycu8O60XEBHLzfaSUymASF764BvUPwfZZUyi', NULL, '2023-05-13 03:34:05', '2023-05-13 03:34:05'),
(5, 'Quản lý tin tức', 'd', 'active', NULL, '$2y$10$dFBNXb9V/KwbXgN/zy.4BeVl/tp.n3HIEYPIreTk0eLm7VGP4vixq', NULL, '2023-05-15 10:23:40', '2023-05-15 10:23:40'),
(10, '1', 'huuthangb2k50@1gmail.com2', 'active', NULL, '$2y$10$5LmeO.CWJIeen4pQnT73Furn1HpNkLrxsmQvJZoXril62XAz3cCpC', NULL, '2023-05-16 04:02:04', '2023-05-16 04:02:04'),
(11, '12312â', '11232', 'active', NULL, '$2y$10$jwhvJrYSbqVT87r.I/HnE.RqMIEZbP8IkydOs55Vuj0dhfoCbTfAG', NULL, '2023-05-16 08:05:40', '2023-05-16 08:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `role_id` bigint(50) UNSIGNED NOT NULL,
  `user_id` bigint(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role_id`, `user_id`, `created_at`) VALUES
(1, 7, 1, NULL),
(4, 7, 5, NULL),
(18, 1, 10, NULL),
(19, 2, 10, NULL),
(20, 3, 10, NULL),
(21, 2, 11, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `posts_ibfk_2` (`cat_post_id`);

--
-- Indexes for table `post_cats`
--
ALTER TABLE `post_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `role_permissions_ibfk_2` (`role_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thumbnail_products`
--
ALTER TABLE `thumbnail_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thumbnail_product_id` (`thumbnail_product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_cats`
--
ALTER TABLE `post_cats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `thumbnail_products`
--
ALTER TABLE `thumbnail_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`cat_post_id`) REFERENCES `post_cats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categorys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thumbnail_products`
--
ALTER TABLE `thumbnail_products`
  ADD CONSTRAINT `thumbnail_products_ibfk_1` FOREIGN KEY (`thumbnail_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
