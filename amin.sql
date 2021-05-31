-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 10:14 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amin`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_cart`
--

CREATE TABLE `app_cart` (
  `id` int(11) NOT NULL,
  `total` int(10) UNSIGNED NOT NULL CHECK (`total` >= 0),
  `created_at` datetime(6) NOT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_cart`
--

INSERT INTO `app_cart` (`id`, `total`, `created_at`, `customer_id`) VALUES
(1, 800000, '2021-05-11 02:59:46.641418', NULL),
(2, 0, '2021-05-11 03:06:51.014412', 1),
(3, 265000, '2021-05-11 03:09:50.068825', 1),
(4, 70000, '2021-05-16 07:43:26.104987', NULL),
(5, 200000, '2021-05-16 07:52:21.140867', 1),
(6, 260000, '2021-05-16 07:52:43.399766', 1),
(7, 0, '2021-05-17 02:46:53.827927', NULL),
(8, 155000, '2021-05-31 07:58:10.143085', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_cartproduct`
--

CREATE TABLE `app_cartproduct` (
  `id` int(11) NOT NULL,
  `rate` int(10) UNSIGNED NOT NULL CHECK (`rate` >= 0),
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `subtotal` int(10) UNSIGNED NOT NULL CHECK (`subtotal` >= 0),
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_cartproduct`
--

INSERT INTO `app_cartproduct` (`id`, `rate`, `quantity`, `subtotal`, `cart_id`, `product_id`) VALUES
(1, 800000, 1, 800000, 1, 16),
(3, 65000, 1, 65000, 3, 1),
(4, 200000, 1, 200000, 3, 4),
(5, 70000, 1, 70000, 4, 46),
(6, 200000, 1, 200000, 5, 3),
(7, 120000, 1, 120000, 6, 11),
(8, 70000, 2, 140000, 6, 46),
(10, 70000, 1, 70000, 8, 29),
(11, 85000, 1, 85000, 8, 24);

-- --------------------------------------------------------

--
-- Table structure for table `app_category`
--

CREATE TABLE `app_category` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_category`
--

INSERT INTO `app_category` (`id`, `title`, `slug`) VALUES
(1, 'Biểu cảm', 'icon'),
(2, 'Hiệu ứng', 'effect'),
(3, 'Mắt', 'ward'),
(4, 'Bản đồ', 'map'),
(5, 'Trang phục', 'skin');

-- --------------------------------------------------------

--
-- Table structure for table `app_categoryhero`
--

CREATE TABLE `app_categoryhero` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_categoryhero`
--

INSERT INTO `app_categoryhero` (`id`, `title`, `slug`, `description`) VALUES
(1, 'Fighter', 'fighter', 'Vị trí mà những anh hùng có sức chống chịu và sát thương ổn định.'),
(2, 'Melee', 'melee', 'Những anh hùng cận chiến.'),
(3, 'Ranged', 'ranged', 'Những anh hùng đánh xa.'),
(4, 'Carry', 'carry', 'Đây là vị trí carry được ưu tiên nhất trong game. Thường thì đầu game rất yếu những khi farm tiền và kinh nghiệm sẽ trở nên mạnh và là nguồn sát thương của team.'),
(5, 'Support', 'support', 'Vị trí mà các anh hùng có khả năng bảo vệ, hỗ trợ cho các chủ lực trong team.'),
(6, 'Tanks', 'tanks', 'Vị trí của những anh hùng có khả năng chống chịu tốt để tạo khoảng trống an toàn cho đội.'),
(7, 'Assassin', 'assassin', 'Vị trí mà những anh hùng có khả năng sốc sát thượng cực mạnh để kết liễu mục tiêu.'),
(8, 'Mage', 'mage', 'Vị trí mà anh hùng gây đa phần là sát thương phép.'),
(9, 'Disabler', 'disabler', 'Gồm các anh hùng có khả năng khống chế đơn - đa mục tiêu.'),
(10, 'Initiator', 'initiator', 'Vị trí của những anh hùng mở giao tranh.'),
(11, 'Escape', 'escape', 'Gồm các anh hùng có khả năng ra vào giao tranh cực kỳ nhanh chóng.'),
(12, 'Pusher', 'pusher', 'Bao gồm các anh hùng có khả năng phá hủy công trình nhanh chóng.'),
(13, 'Jungle', 'jungle', 'Những anh hùng có khả năng farm rừng từ ngay giai đoạn đầu.');

-- --------------------------------------------------------

--
-- Table structure for table `app_categoryitem`
--

CREATE TABLE `app_categoryitem` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_categoryitem`
--

INSERT INTO `app_categoryitem` (`id`, `title`, `slug`) VALUES
(1, 'Trang bị rừng', 'jungle'),
(2, 'Trang bị tấn công', 'attack'),
(3, 'Trang bị phòng thủ', 'defense'),
(4, 'Trang bị hỗ trợ', 'support'),
(5, 'Trang bị bí ẩn', 'secret'),
(6, 'Trang bị cơ bản', 'basic'),
(7, 'Trang bị tiêu thụ', 'consumables');

-- --------------------------------------------------------

--
-- Table structure for table `app_categorynew`
--

CREATE TABLE `app_categorynew` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_categorynew`
--

INSERT INTO `app_categorynew` (`id`, `title`, `slug`) VALUES
(1, 'Giải đấu', 'esport'),
(2, 'HighLights', 'highlights'),
(3, 'Blog', 'blog'),
(4, 'Cập nhật', 'update');

-- --------------------------------------------------------

--
-- Table structure for table `app_customer`
--

CREATE TABLE `app_customer` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `joined_on` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_customer`
--

INSERT INTO `app_customer` (`id`, `full_name`, `address`, `joined_on`, `user_id`) VALUES
(1, 'Nguyễn Ngọc Kim Cương', 'Hà Nội', '2021-05-11 03:06:39.423987', 3);

-- --------------------------------------------------------

--
-- Table structure for table `app_hero`
--

CREATE TABLE `app_hero` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `aliases` varchar(100) NOT NULL,
  `speech` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `view_count` int(10) UNSIGNED NOT NULL CHECK (`view_count` >= 0),
  `stat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_hero`
--

INSERT INTO `app_hero` (`id`, `title`, `slug`, `image`, `aliases`, `speech`, `description`, `view_count`, `stat_id`) VALUES
(1, 'Kiyoko', 'kiyoko', 'static/img/heroes/kiyoko_tBYh7cX.jpg', 'Lưỡi kiếm pha lê', '\" Lưỡi gương sáng lên trong trẻo như pha lê dưới những cánh hoa anh đào \"', 'Thông qua một quá trình bói toán, những đứa trẻ được chọn để nuôi dưỡng bởi Sisters of the Veil, một mệnh lệnh coi việc ám sát là một phần thiêng liêng của trật tự tự nhiên. Các chị em gái che mặt xác định mục tiêu thông qua thiền định và các câu nói linh nghiệm. Họ không chấp nhận hợp đồng, và dường như không bao giờ theo đuổi mục tiêu vì lý do chính trị hoặc lính đánh thuê. Việc giết người của họ không liên quan đến bất kỳ chương trình nghị sự dễ nhận biết nào, và dường như hoàn toàn ngẫu nhiên: Một nhân vật có quyền lực lớn không có khả năng bị loại bỏ hơn một nông dân hoặc một người đào giếng. Bất cứ hình thức giết người nào có thể có, nó chỉ được biết đến với họ. Họ coi nạn nhân của mình như vật hy sinh, và cái chết dưới tay họ được coi là một vinh dự. Được nuôi dưỡng mà không có danh tính ngoại trừ theo lệnh của họ, bất kỳ Phantom Assassin nào cũng có thể thay thế cho bất kỳ người nào khác; số của họ không được biết. Có lẽ có rất nhiều, có lẽ có ít. Không có gì được biết về những gì nằm dưới Phantom Veil. Ngoại trừ việc người này, thỉnh thoảng, khi không ai ở gần đủ để nghe thấy, được biết là khuấy động mạng che mặt của cô ấy bằng lời thì thầm cấm đoán về tên của chính cô ấy: Mortred.', 0, 1),
(2, 'Waldo', 'waldo', 'static/img/heroes/waldo_bN4B3mi.jpg', 'Lưỡi rìu máu', '\"Không gì có thể ngăn cản lưỡi rìu của ta uống máu nơi chiến trường!\"', 'Thông qua một quá trình bói toán, những đứa trẻ được chọn để nuôi dưỡng bởi Sisters of the Veil, một mệnh lệnh coi việc ám sát là một phần thiêng liêng của trật tự tự nhiên. Các chị em gái che mặt xác định mục tiêu thông qua thiền định và các câu nói linh nghiệm. Họ không chấp nhận hợp đồng, và dường như không bao giờ theo đuổi mục tiêu vì lý do chính trị hoặc lính đánh thuê. Việc giết người của họ không liên quan đến bất kỳ chương trình nghị sự dễ nhận biết nào, và dường như hoàn toàn ngẫu nhiên: Một nhân vật có quyền lực lớn không có khả năng bị loại bỏ hơn một nông dân hoặc một người đào giếng. Bất cứ hình thức giết người nào có thể có, nó chỉ được biết đến với họ. Họ coi nạn nhân của mình như vật hy sinh, và cái chết dưới tay họ được coi là một vinh dự. Được nuôi dưỡng mà không có danh tính ngoại trừ theo lệnh của họ, bất kỳ Phantom Assassin nào cũng có thể thay thế cho bất kỳ người nào khác; số của họ không được biết. Có lẽ có rất nhiều, có lẽ có ít. Không có gì được biết về những gì nằm dưới Phantom Veil. Ngoại trừ việc người này, thỉnh thoảng, khi không ai ở gần đủ để nghe thấy, được biết là khuấy động mạng che mặt của cô ấy bằng lời thì thầm cấm đoán về tên của chính cô ấy: Mortred.', 1, 2),
(3, 'Lucifer', 'lucifer', 'static/img/heroes/Lucifer_bPlOQVs.jpg', 'Tội đồ của sự kiêu ngạo', '\"Một lần nữa ta sẽ đứng dậy và cho bọn chúng thấy ai mới là giống loài thượng đẳng!\"', 'Thông qua một quá trình bói toán, những đứa trẻ được chọn để nuôi dưỡng bởi Sisters of the Veil, một mệnh lệnh coi việc ám sát là một phần thiêng liêng của trật tự tự nhiên. Các chị em gái che mặt xác định mục tiêu thông qua thiền định và các câu nói linh nghiệm. Họ không chấp nhận hợp đồng, và dường như không bao giờ theo đuổi mục tiêu vì lý do chính trị hoặc lính đánh thuê. Việc giết người của họ không liên quan đến bất kỳ chương trình nghị sự dễ nhận biết nào, và dường như hoàn toàn ngẫu nhiên: Một nhân vật có quyền lực lớn không có khả năng bị loại bỏ hơn một nông dân hoặc một người đào giếng. Bất cứ hình thức giết người nào có thể có, nó chỉ được biết đến với họ. Họ coi nạn nhân của mình như vật hy sinh, và cái chết dưới tay họ được coi là một vinh dự. Được nuôi dưỡng mà không có danh tính ngoại trừ theo lệnh của họ, bất kỳ Phantom Assassin nào cũng có thể thay thế cho bất kỳ người nào khác; số của họ không được biết. Có lẽ có rất nhiều, có lẽ có ít. Không có gì được biết về những gì nằm dưới Phantom Veil. Ngoại trừ việc người này, thỉnh thoảng, khi không ai ở gần đủ để nghe thấy, được biết là khuấy động mạng che mặt của cô ấy bằng lời thì thầm cấm đoán về tên của chính cô ấy: Mortred.', 4, 3),
(4, 'Alvar - Erica', 'alvar-erica', 'static/img/heroes/Alvar-Erica_t0UViAI.jpeg', 'Tình yêu bất diệt', '\"Nếu chúa không thể đưa hai ta đến với nhau, thì ta quà là tay sai của quỷ để có thể mãi mãi bên nhau!\"', 'Thông qua một quá trình bói toán, những đứa trẻ được chọn để nuôi dưỡng bởi Sisters of the Veil, một mệnh lệnh coi việc ám sát là một phần thiêng liêng của trật tự tự nhiên. Các chị em gái che mặt xác định mục tiêu thông qua thiền định và các câu nói linh nghiệm. Họ không chấp nhận hợp đồng, và dường như không bao giờ theo đuổi mục tiêu vì lý do chính trị hoặc lính đánh thuê. Việc giết người của họ không liên quan đến bất kỳ chương trình nghị sự dễ nhận biết nào, và dường như hoàn toàn ngẫu nhiên: Một nhân vật có quyền lực lớn không có khả năng bị loại bỏ hơn một nông dân hoặc một người đào giếng. Bất cứ hình thức giết người nào có thể có, nó chỉ được biết đến với họ. Họ coi nạn nhân của mình như vật hy sinh, và cái chết dưới tay họ được coi là một vinh dự. Được nuôi dưỡng mà không có danh tính ngoại trừ theo lệnh của họ, bất kỳ Phantom Assassin nào cũng có thể thay thế cho bất kỳ người nào khác; số của họ không được biết. Có lẽ có rất nhiều, có lẽ có ít. Không có gì được biết về những gì nằm dưới Phantom Veil. Ngoại trừ việc người này, thỉnh thoảng, khi không ai ở gần đủ để nghe thấy, được biết là khuấy động mạng che mặt của cô ấy bằng lời thì thầm cấm đoán về tên của chính cô ấy: Mortred.', 1, 5),
(5, 'Death', 'death', 'static/img/heroes/Death_Lt200pU.jpg', 'Tử thần', '\"Không một ai sau khi chết có thể thoát được khỏi bàn tay ta!\"', 'Thông qua một quá trình bói toán, những đứa trẻ được chọn để nuôi dưỡng bởi Sisters of the Veil, một mệnh lệnh coi việc ám sát là một phần thiêng liêng của trật tự tự nhiên. Các chị em gái che mặt xác định mục tiêu thông qua thiền định và các câu nói linh nghiệm. Họ không chấp nhận hợp đồng, và dường như không bao giờ theo đuổi mục tiêu vì lý do chính trị hoặc lính đánh thuê. Việc giết người của họ không liên quan đến bất kỳ chương trình nghị sự dễ nhận biết nào, và dường như hoàn toàn ngẫu nhiên: Một nhân vật có quyền lực lớn không có khả năng bị loại bỏ hơn một nông dân hoặc một người đào giếng. Bất cứ hình thức giết người nào có thể có, nó chỉ được biết đến với họ. Họ coi nạn nhân của mình như vật hy sinh, và cái chết dưới tay họ được coi là một vinh dự. Được nuôi dưỡng mà không có danh tính ngoại trừ theo lệnh của họ, bất kỳ Phantom Assassin nào cũng có thể thay thế cho bất kỳ người nào khác; số của họ không được biết. Có lẽ có rất nhiều, có lẽ có ít. Không có gì được biết về những gì nằm dưới Phantom Veil. Ngoại trừ việc người này, thỉnh thoảng, khi không ai ở gần đủ để nghe thấy, được biết là khuấy động mạng che mặt của cô ấy bằng lời thì thầm cấm đoán về tên của chính cô ấy: Mortred.', 0, 4),
(6, 'Baphomet', 'baphomet', 'static/img/heroes/baphomet_Fp9sd7J.jpeg', 'Ác quỷ đầu dê', '\"Máu, xương và thịt mọi thứ thật tuyệt vời !\"', 'Thông qua một quá trình bói toán, những đứa trẻ được chọn để nuôi dưỡng bởi Sisters of the Veil, một mệnh lệnh coi việc ám sát là một phần thiêng liêng của trật tự tự nhiên. Các chị em gái che mặt xác định mục tiêu thông qua thiền định và các câu nói linh nghiệm. Họ không chấp nhận hợp đồng, và dường như không bao giờ theo đuổi mục tiêu vì lý do chính trị hoặc lính đánh thuê. Việc giết người của họ không liên quan đến bất kỳ chương trình nghị sự dễ nhận biết nào, và dường như hoàn toàn ngẫu nhiên: Một nhân vật có quyền lực lớn không có khả năng bị loại bỏ hơn một nông dân hoặc một người đào giếng. Bất cứ hình thức giết người nào có thể có, nó chỉ được biết đến với họ. Họ coi nạn nhân của mình như vật hy sinh, và cái chết dưới tay họ được coi là một vinh dự. Được nuôi dưỡng mà không có danh tính ngoại trừ theo lệnh của họ, bất kỳ Phantom Assassin nào cũng có thể thay thế cho bất kỳ người nào khác; số của họ không được biết. Có lẽ có rất nhiều, có lẽ có ít. Không có gì được biết về những gì nằm dưới Phantom Veil. Ngoại trừ việc người này, thỉnh thoảng, khi không ai ở gần đủ để nghe thấy, được biết là khuấy động mạng che mặt của cô ấy bằng lời thì thầm cấm đoán về tên của chính cô ấy: Mortred.', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `app_hero_categoryhero`
--

CREATE TABLE `app_hero_categoryhero` (
  `id` int(11) NOT NULL,
  `hero_id` int(11) NOT NULL,
  `categoryhero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_hero_categoryhero`
--

INSERT INTO `app_hero_categoryhero` (`id`, `hero_id`, `categoryhero_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4),
(4, 1, 7),
(5, 1, 11),
(6, 2, 1),
(7, 2, 2),
(8, 2, 6),
(9, 3, 3),
(10, 3, 8),
(11, 3, 9),
(12, 3, 10),
(13, 3, 11),
(14, 4, 1),
(15, 4, 2),
(16, 4, 3),
(17, 4, 8),
(18, 4, 9),
(19, 4, 10),
(20, 4, 11),
(21, 5, 2),
(22, 5, 5),
(23, 5, 7),
(24, 5, 8),
(25, 5, 9),
(26, 6, 1),
(27, 6, 2),
(28, 6, 6),
(29, 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `app_hero_skill`
--

CREATE TABLE `app_hero_skill` (
  `id` int(11) NOT NULL,
  `hero_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_hero_skill`
--

INSERT INTO `app_hero_skill` (`id`, `hero_id`, `skill_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(6, 2, 5),
(7, 2, 6),
(8, 2, 7),
(5, 2, 8),
(9, 3, 22),
(10, 3, 23),
(11, 3, 24),
(12, 3, 25),
(13, 3, 26),
(14, 3, 27),
(15, 4, 9),
(16, 4, 10),
(17, 4, 11),
(18, 4, 12),
(19, 4, 13),
(20, 4, 14),
(21, 4, 15),
(22, 4, 16),
(23, 4, 17),
(24, 4, 18),
(25, 4, 19),
(26, 4, 20),
(27, 4, 21),
(28, 5, 28),
(29, 5, 29),
(30, 5, 30),
(31, 5, 31),
(32, 6, 32),
(33, 6, 33),
(34, 6, 34),
(35, 6, 35);

-- --------------------------------------------------------

--
-- Table structure for table `app_item`
--

CREATE TABLE `app_item` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` int(10) UNSIGNED NOT NULL CHECK (`price` >= 0),
  `cooldown` varchar(50) NOT NULL,
  `view_count` int(10) UNSIGNED NOT NULL CHECK (`view_count` >= 0),
  `categoryitem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_item`
--

INSERT INTO `app_item` (`id`, `title`, `slug`, `image`, `description`, `price`, `cooldown`, `view_count`, `categoryitem_id`) VALUES
(1, 'Bình máu', 'potions', 'static/img/items/potions_hOtGaQl.jpeg', 'Sử dụng lên bản thân hoặc đồng minh sẽ hồi phục 10HP/giây trong vòng 15 giây.', 50, '0', 2, 7),
(2, 'Bình năng lượng', 'clarity', 'static/img/items/clarity_GR45CKv.jpeg', 'Sử dụng lên bản thân hoặc đồng minh sẽ hồi phục 6MP/giây trong vòng 30 giây.', 50, '0', 0, 7),
(3, 'Mắt soi sáng', 'eyes-shine', 'static/img/items/eyes-shine_ITQxtP9.png', 'Cắm một con mắt vô hình ở một vị trí chỉ định sẽ cho tầm nhìn trong bán bính 1000 đơn vị và tồn tại  trong vòng 5 phút.', 75, '60', 1, 7),
(4, 'Mắt quét', 'eyes-scanner', 'static/img/items/eyes-scanner_L91dNrT.png', 'Cắm một con mắt vô hình ở một vị trí chỉ định sẽ cho tầm nhìn chuẩn trong bán bính 500 đơn vị và tồn tại trong vòng 5 phút.', 75, '60', 0, 7),
(5, 'Huyết thạch', 'blood-stone', 'static/img/items/boold-stone_JyvcWkh.png', 'Hồi phục 100HP ngay lập tức.', 75, '6', 0, 7),
(6, 'Giọt nước mắt nữ thần', 'goddess-tears', 'static/img/items/goddesss-tears_ZkDAp1f.png', 'Hồi phục 100MP ngay lập tức.', 70, '0', 0, 7),
(7, 'Lọ pha lê', 'crystal-jar', 'static/img/items/crystal-jar_wbznqbo.png', 'Sẽ cung cấp 3 lần sử dụng, mỗi lần sẽ hồi phục lại 120HP và 75MP trong 3 giây. Lọ sẽ được nạp đầy khi trở  về điểm hồi sinh. Có thể sử dụng lên bản thân hoặc đồng minh.', 650, '1', 0, 7),
(8, 'Cuốn sách thế giới', 'world-book', 'static/img/items/world-book_H5HiRpS.jpg', 'Cung cấp cho bạn 700 điểm kinh nghiệm cộng với 135 mỗi điểm kinh nghiệm mà nhóm của bạn tiêu thụ sau hai lần đầu tiên.', 150, '300', 1, 7),
(9, 'Hòn đá ma thuật', 'magic-stone', 'static/img/items/magic-stone_bFYHQ4c.jpg', 'Sau khi niệm 3 giây, bạn sẽ dịch chuyển đến công trình được chỉ định.', 100, '80', 0, 7),
(10, 'Lọ sương mù', 'bottle-smoke', 'static/img/items/bottle-smoke_NJlaGXK.jpg', 'Biến người chơi và tất cả các đơn vị đồng minh do người chơi điều khiển trong bán kính 1000 trở nên vô hình và tăng thêm 15% tốc độ di chuyển trong 30 giây. Tấn công hoặc di chuyển trong phạm vi 1000 của tướng hoặc tháp của đối phương sẽ phá vỡ khả năng tàng hình (cung cấp khả năng tàng hình miễn nhiễm với tầm nhìn chuẩn)', 50, '90', 0, 7),
(11, 'Bụi ma thuật', 'magic-dust', 'static/img/items/magic-dust_BJ8gZfB.PNG', 'Làm chậm và lộ diện các tướng tàng hình đi 20% trong bán kính 900 xung quanh trong 10 giây.', 80, '30', 0, 7),
(12, 'Rìu của tiều phu', 'woodcutter-axe', 'static/img/items/woodcutters_ax_On4LXeC.jpg', 'Tăng sát thương tấn công đối với các đơn vị không phải anh hùng lên 12 đối với anh hùng cận chiến và 6 đối với tầm xa. Khi kích hoạt sẽ phá hủy một đơn vị địa hình nhỏ.', 200, '5', 3, 6),
(13, 'Khiên gỗ', 'wooden-shield', 'static/img/items/wooden-shield_iuTn4sf.jpg', 'Chặn 15 sát thương từ các đòn tấn công sắp tới lên tướng cận chiến và 7 sát thương ở tầm xa.', 200, '0', 0, 6),
(14, 'Kiếm cùn', 'blunt-sword', 'static/img/items/blunt-sword_4S4C0cc.jpg', 'Cung cấp 50 HP, 8 STVL và 5% hút máu.', 450, '0', 1, 6),
(15, 'Nhẫn của phù thủy tập sự', 'ring-of-apprentice-witch', 'static/img/items/ring-of-apprentice-witch_fBuUuUM.jpg', 'Cung cấp 70HP, phục hồi 2 MP/s và 10 SMPT.', 450, '0', 4, 6),
(16, 'Đồng hồ sinh tử', 'clock-of-life-or-death', 'static/img/items/clock-life-death_3fB0fOO.jpg', 'Cung cấp 500HP và 350MP. Bị động: Hero sẽ sống sót với 1HP và trở nên không thể bị tiêu diệt trong 4s khi nhận sát thương lớn hơn lượng máu hiện tại. Kích hoạt: Loạt bỏ tất cả các hiệu ứng tiêu cực của hero và hồi lại 300HP và 200MP.', 3200, '90', 1, 3),
(17, 'Thanh kiếm bị nguyền rủa', 'cursed-sword', 'static/img/items/cursed-sword_MmqNafO.jpg', 'Cung cấp 60 STVL, 40 Tốc đánh, 100 tầm đánh(chỉ cận chiến). Nội tại: Các đòn tấn công cơ bản sẽ khiến cho mục tiêu phải nhận thêm 20% sát thương đồng thời giảm đi 40% các hiệu ứng hồi phục trong 2,5s. Kích hoạt: Loại bỏ tất cả các hiệu ứng có lợi của mục tiêu và khiến mục tiêu không thể nhận được các hiệu ứng có lợi trong vòng 3s.', 4300, '40', 14, 2),
(18, 'Nhẫn của nữ hoàng băng', 'ice-queen-ring', 'static/img/items/ice-queen-ring_BQfBFyT.png', 'Cung cấp 40 SMPT, 300 MP và phục hồi 4MP/s. Nội tại: Mỗi khi sử dụng một kỹ năng trúng mục tiêu sẽ làm chậm mục tiêu đi 35% trong 2s.', 2750, '0', 1, 2),
(19, 'Đá hoàn hồn', 'soul-stone', 'static/img/items/soul-stone_0ja6RmS.png', 'Kích hoạt: Cho phép người sử dụng được hồi sinh ngay lập tức và trong 60s sau khi hồi sinh, người sử dụng sẽ bị nhận hiệu ứng (tử thần dõi theo). Nếu nhưng người sử dụng bị tiêu diệt trong thời gian này sẽ phải nhận thêm 80% thời gian hồi sinh.', 1500, '300', 3, 7),
(20, 'Bộ giáp sương đen', 'black-mist-armor', 'static/img/items/black-mist-armor_kLimyU7.jpg', 'Cung cấp 15% kháng phép. Nội tại: Tăng 25 tốc độ di chuyển khi trời tối. Kích hoạt: Sau 0,5s trì hoãn, tàng hình và 30% kháng phép cho bạn hoặc một đơn vị đồng minh mục tiêu trong 5 giây.', 2050, '15', 1, 3),
(21, 'Nhẫn của Andvaranaut', 'andvaranaut-s-ring', 'static/img/items/andvaranaut-s-ring_57mxSsI.jpg', 'Nội tại: Cộng thêm 3 vàng/s. Khi kết liễu được một đơn vị quái, công trình, hoặc anh hùng bất kỳ sẽ nhận thêm 5 vàng. (Lời nguyền: Người trang bị sẽ nhận thêm 10% sát thương từ mọi nguồn)', 2100, '0', 2, 4),
(22, 'Áo giáp lụa', 'silk-armor', 'static/img/items/silk-armor_G5Rz2cW.jpg', 'Cung cấp 4 giáp', 500, '0', 1, 6),
(23, 'Cây cung của ác ma', 'devil-s-bow', 'static/img/items/devil-s-bow_myNlBjY.jpg', 'Cung cấp 30 STVL, 30 Tốc đánh.', 1800, '0', 4, 2),
(24, 'Thần kiếm Caladbolg', 'caladbolg', 'static/img/items/caladbolg_ISC6roS.png', 'Cung cấp 80 STVL, 500HP, 20% kháng phép. Nội tại: 1/Tăng sát thương tấn công đối với các đơn vị không phải anh hùng lên 20 đối với anh hùng cận chiến và 12 đối với tầm xa. | 2/Gây 80% STVL theo hình nón lên đến 650 xung quanh mục tiêu. Giảm một nửa hiệu ứng đối với creep (Chỉ cận chiến) | 3/Các đòn tấn công cơ bản sẽ gây thêm STC tương đương với 25% STVL. Kích hoạt: Phá hủy một đơn vị địa hình nhỏ.', 6400, '5', 10, 2),
(25, 'Áo choàng pháp sư', 'mage-cloak', 'static/img/items/mage-cloak_znLId0s.jpg', 'Cung cấp 6 giáp, 350 MP. Nội tại: Giảm 10% Kháng hiệu ứng và 10% Kháng phép của tất cả kẻ địch xung quanh trong 1000 đơn vị.', 3000, '0', 1, 3),
(26, 'Trái tim của Satan', 'heart-of-satan', 'static/img/items/heart-of-satan_VnSxoid.jpg', 'Cung cấp 1000 HP, 25% kháng phép, hồi phục 2% HP tối đa/s. Nội tại: 1/Giảm 20% mọi sát thương từ mọi nguồn. | 2/ Tăng thêm 20% máu tối đa cho chủ sở hữu. | 3. Khuếch đại mọi khả năng hội phục thêm 30%. Kích hoạt: Tạo một lớp khiên chắn bằng 30% HP tối đa trong 12s.', 6600, '60', 3, 3),
(27, 'Tà kiếm Muramasas', 'evil-sword-muramasas', 'static/img/items/evil-sword-muramasas_vyFnDZB.jpg', 'Cung cấp 80 STVL, 60 tốc đánh, 150 tầm đánh(Chỉ cận chiến). Nội tại: 1/Các đòn tấn công cơ bản sẽ khiến cho mục tiêu phải nhận thêm 25% sát thương đồng thời giảm đi 45% các hiệu ứng hồi phục trong 2,5s. | 2/Cho mỗi đòn tấn công 30% cơ hội gây 200% sát thương. | 3/Các đòn tấn công cơ bản sẽ giảm đi 35% tỉ lệ kháng hiệu ứng của mục tiêu trong 3s. (Lời nguyền: Người trang bị sẽ bị mất đi 5% HP tối đa mỗi khi gây sát thương chí mạng lên mục tiêu). Kích hoạt: Loại bỏ tất cả các hiệu ứng có lợi của mục tiêu và khiến mục tiêu không thể nhận được các hiệu ứng có lợi trong vòng 6s, đồng thời mục tiêu không thể hồi phục và bị làm chậm.', 6400, '60', 6, 2),
(28, 'Con mắt của sự thật', 'eyes-of-truth', 'static/img/items/eyes-of-truth_CKjrlFA.jpg', 'Nội tại: Cho khả năng nhìn thấy tất cả các đơn vị vô hình đối với bất kỳ tầm nhìn nào của đồng minh trong phạm vi 900. (Khi người sở hữu chết đi, trang bị này sẽ rơi ra đất và hiệu ứng của trang bị sẽ mất đi hiệu lực cho đến khi một đơn vị anh hùng khác cầm trang bị)', 1200, '300', 2, 5),
(29, 'Quyền trượng khô lâu', 'scepter-of-the-dead', 'static/img/items/scepter-of-the-dead_WrajHJP.jpg', 'Cung cấp 20 SMPT', 1000, '0', 1, 6),
(30, 'Huyết thương', 'blood-spear', 'static/img/items/blood-spear_4ZgFdVh.jpg', 'Cung cấp 10 STVL, 10 tốc đánh. Nội tại: Hồi máu bằng 20% STVL gây ra.', 1775, '0', 3, 2),
(31, 'Cung tà ác', 'evil-bow', 'static/img/items/evil-bow_HpU1lKh.jpg', 'Cung cấp 30 STVL, 30 tốc đánh. Nội tại: Các đòn tấn công cơ bản sẽ đầu độc mục tiêu khiến mục tiêu bị mất 1% HP/s, giảm 3 giáp và làm chậm 15% đối với cận chiến và 5% đối với đánh xa.', 2700, '0', 5, 2),
(32, 'Mề đay tử chiến', 'death-medal', 'static/img/items/death-medal_IPhKRlb.jpg', 'Cung cấp 450 HP, 7 giáp. Nội tại: Khi chủ sở hữu bị kết liễu sẽ phát nổ và gây sát thương chuẩn tương đương 20% HP tối đa. Kích hoạt: Dùng lên bản thân hoặc đồng minh cho một lớp khiên giảm dần tương đương 20%HP tối đa của chủ sở hữu trong 6s.', 2625, '40', 1, 3),
(33, 'Nọc độc', 'venom', 'static/img/items/venom_OKqTobP.jpg', 'Nội tại: Các đòn tấn công cơ bản sẽ đầu độc mục tiêu khiến chúng bị mất 1% HP tối đa/s và làm chậm đi 10% đối với cận chiến và 3% đối với đánh xa', 900, '0', 2, 5),
(34, 'Đá nguyên thủy', 'primordial-stone', 'static/img/items/primordial-stone_xjxQdR8.jpg', 'Khai sáng: Nâng cấp một trong những kỹ năng của bạn.', 3000, '0', 1, 7),
(35, 'Cuốn sách Goetia', 'goetia', 'static/img/items/goetia_eq4QWIF.jpg', 'Cung cấp 20/30/40/50 SMPT, 200/300/400/500 MP, hồi phục 3/3.5/4/5 MP/s (Trang bị có thể nâng cấp bằng 1800 vàng). Kích hoạt: Triệu hồi ra 2 con quỷ đen và trắng để chiến đấu.', 2450, '60', 1, 4),
(36, 'Trường súng liên thanh', 'machine-gun', 'static/img/items/machine-gun_m8vj1Hc.jpg', 'Cung cấp 30 tốc đánh, 150 tầm đánh(Chỉ đánh xa). Nội tại: Đòn tấn công cơ bản thứ 3 sẽ gây thêm 200 STMT và chắc chắn gây 100% sát thương chí mạng.', 2700, '0', 0, 2),
(37, 'Nanh độc Hydra', 'poison-fang-hydra', 'static/img/items/poison-fang-hydra_svidTN6.jpg', 'Cung cấp 40 STVL, 40 tốc đánh. Nội tại: 1/Các đòn tấn công cơ bản sẽ đầu độc mục tiêu khiến mục tiêu bị mất 1% HP/s và làm chậm 20% đối với cận chiến và 10% đối với đánh xa. | 2/Các đòn tấn công cơ bản sẽ gây tê liệt khiến mục tiêu bị choáng nhẹ trong 0.5s.', 4500, '2', 1, 2),
(38, 'Găng tay băng giá', 'frost-gloves', 'static/img/items/frost-gloves_lzXvEAV.jpg', 'Cung cấp 450 MP, 10 giáp. Nội tại: Mỗi khi gây sát thương lên một đơn vị bất kỳ sẽ tạo ra một vùng băng giá ảnh hưởng xung quanh mục tiêu, khiến chúng nhận STMT/s dựa và làm chậm đi 25%. Tồn tại trong 3s.', 3750, '2', 1, 3),
(39, 'Xiềng xích nô lệ', 'shackles-of-slaves', 'static/img/items/shackles-of-slaves_drf4JOa.png', 'Cung cấp 5 giáp, hồi 6 HP/s. Nội tại: Giảm 30% sát thương của quái rừng đối với người trang bị. Kích hoạt: Thu phục một quái rừng để điều khiển (Không thể thu phục được quái vật cấp cao, khi thu phục quái mới thì quái cũ sẽ bị chết ngay lập tức)', 1900, '45', 1, 1),
(40, 'Dao rựa của thợ săn', 'machete-of-hunter', 'static/img/items/machete-of-hunter_GOZi4I6.jpg', 'Cung cấp 20 STVL, 10 tốc đánh. Nội tại: Gây thêm 30% lên quái rừng đối với người trang bị. Kích hoạt: Loại bỏ 40% HP hiện tại của mục tiêu không phải anh hùng.', 1900, '15', 2, 1),
(41, 'Súng săn', 'shotgun', 'static/img/items/shotgun-of-hunter_K06rdRr.jpg', 'Cung cấp 20 tốc đánh, 20% tỉ lệ chí mạng. Nội tại: Các đòn tấn công cơ bản lên quái rừng sẽ gây sát thương lan ra các mục tiêu xung quanh. Các mục tiêu bị ảnh hưởng xung quanh sẽ nhận 35% sát thương so với mục tiêu chính. Kích hoạt: Cho phép bắn ngay lập tức thêm một loạt đạn gây 150% sát thương.', 1900, '10', 2, 1),
(42, 'Giáp thống khổ', 'armor-of-anguish', 'static/img/items/armor-of-anguish_PcYZKaB.jpg', 'Cung cấp 600 HP, 10 giáp. Nội tại: 1/Mỗi khi bị tấn công, chủ sở hữu sẽ trả lại 20% sát thương từ nguồn gây ra. | 2/Các mục tiêu tấn công chủ sở hữu sẽ bị giảm 40% khả năng hồi phục và 6 giáp trong 3s(Không cộng dồn). Kích hoạt: Trong 6 giây, sát thương trả lại từ tất cả các nguồn tăng thêm 80%. (Đau đớn: Chủ sở hữu trang bị sẽ nhận 16 sát thương chuẩn/s)', 6000, '25', 1, 3),
(43, 'Vương miện máu', 'crown-blood', 'static/img/items/crown-blood_DInrPqT.jpg', 'Cung cấp 300 STVL, 300 SMPT. (Lời nguyền máu: Khi người sở hữu chết đi, trang bị này sẽ rơi ra đất và khi một đơn vị anh hùng khác cầm trang bị sẽ tính là của kẻ đó)', 6000, '0', 0, 5),
(44, 'Mặt nạ ác quỷ', 'devil-mask', 'static/img/items/devil-mask_ffFQQIH.jpg', 'Cung cấp 16 STVL, 16 tốc đánh. Nội tại: Hồi máu bằng 20% STVL gây ra. Kích hoạt: Cho 110 tốc độ đánh và 30 tốc độ di chuyển, nhưng giảm 8 giáp và khiến bạn bị câm lặng, kéo dài 6s.', 2300, '16', 1, 2),
(45, 'Lồng đèn ác thần', 'evil-spirit-lantern', 'static/img/items/evil-spirit-lantern_f23i9HJ.png', 'Nội tại: Mỗi khi một đơn vị bị tiêu diệt trong phạm vi 300 đơn vị, lồng đèn sẽ hút linh hồn của kẻ xấu số và chuyển hóa trực tiếp thành 0,2 MP hồi phục và 0,3% SMPT ứng với 1 linh hồn cho chủ sở hữu. Khi chết sẽ  giải phóng một nửa số linh hồn thu thập được.', 2500, '0', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `app_new`
--

CREATE TABLE `app_new` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `view_count` int(10) UNSIGNED NOT NULL CHECK (`view_count` >= 0),
  `categorynew_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_new`
--

INSERT INTO `app_new` (`id`, `title`, `slug`, `image`, `description`, `view_count`, `categorynew_id`) VALUES
(1, 'Miracle - Thần đồng mới nổi của làng Amin thế giới', 'news1', 'static/img/news/news1_DxsDMpY.jpg', 'Amer al-Barkawi (tiếng Ả Rập: عامر البرقاوي) (sinh ngày 20 tháng 6 năm 1997), được biết đến với biệt danh Miracle-, là một vận động viên thể thao điện tử chuyên nghiệp môn Dota 2, hiện đang thi đấu cho Team Nigma. Ngày 12 tháng 8 năm 2017, anh cùng với Team Liquid vô địch The International 2017 giải đấu lớn nhất trong lịch sử thể thao điện tử tính đến năm 2017. Miracle- có quốc tịch kép do có mẹ là người Ba Lan và cha là người Jordan. Tính tới tháng 8 năm 2019, anh là vận động viên thể thao điện tử có tổng thu nhập cao thứ bảy thế giới với $4,691,444.88 USD sau khi cùng Team Liquid giành ngôi Á quân tại The International 2019. Từ nhỏ, Miracle- đã bắt đầu làm quen với thể loại game MOBA (ARTS) với tựa game Defense of the Ancients (DotA), vốn được phát triển dựa trên nền Warcraft 3. Từ khoảng giữa năm 2014, Miracle- nổi lên là một trong những người chơi nghiệp dư nổi tiếng nhất (\"pubstar\") của môn Dota 2. Đầu năm 2015, Miracle- bắt đầu sự nghiệp thi đấu chuyên nghiệp với đội Balkan Bears, tuy nhiên anh không được tham gia vào bất kỳ giải đấu lớn nào và rời đội chỉ sau bốn tháng. Cuối năm đó, Miracle- trở thành game thủ Dota 2 xếp hạng cao nhất. Cuối năm 2015, Miracle- trở thành vận động viên chuyên nghiệp khi được Johan \"N0tail\" Sundstein mời vào đội hình của đội (monkey) Business[4] Sau một thỏa thuận tài trợ, (monkey) Business đổi thành Team OG. Ngay sau khi đổi tên, Miracle- và đội đã vô địch giải Frankfurt Major[5], tiếp theo là vị trí thứ 7-8 tại Shanghai Major. Năm 2016, OG đã vô địch liên tiếp Manilla Major và ESL One Frankfurt, trở thành đội đầu tiên vô địch 2 giải Major trong lịch sử Dota 2. Ngày 11 tháng 5 năm 2016, anh trở thành người chơi Dota 2 đầu tiên cán mốc 9000 MMR - mức điểm xếp hạng cao nhất tính đến thời điểm đó của trò chơi. Sau khi đạt ví trí 9-12 tại giải vô địch thế giới The International 2016, Miracle- rời OG rồi tham gia Team Liquid vào tháng 9 năm 2016, sau khi Adrian \"Fata\" Trinks công bố nghỉ tạm thời thi đấu chuyên nghiệp. Đầu năm 2017, Team Liquid không đủ điều kiện tham gia Boston Major. Tuy nhiên sau khi bạn của anh Maroun \"GH\" Merhej gia nhập Liquid, đội đã giành chiến thắng tại DreamLeague và nhanh chóng trở lại top dẫn đầu Dota 2 chuyên nghiệp. Ngày 12/08/2017, Miracle- cùng Team Liquid đã vô địch The International 2017 sau khi chiến thắng Newbee với tỉ số 3-0, giành giải thưởng lớn nhất mà chưa một giải đấu eSport. Năm 2018, Team Liquid còn giành thêm được danh hiệu Dota 2 Supermajor tổ chức tại Trung Quốc. Họ kết thúc mùa giải 2017-18 tại vị trí số 2 theo bảng xếp hạng của Valve. Tuy nhiên, tại The International 2018, Miracle- và Liquid chỉ giành được vị trí thứ 4 sau khi để thua Evil Geniuses với tỷ số 0-2. Tại The International 2019, team Liquid để thua 1-3 trước Team OG tại trận chung kết tổng, qua đó giành Á quân với tiền thưởng $4,460,194 USD. Sau khi kết thúc The International 2019, toàn bộ thành viên đội Dota 2 của Team Liquid (trong đó có Miracle-) đã thông báo rời khỏi tổ chức Liquid để thành lập 1 tổ chức của riêng mình: Team Nigma.', 4, 2),
(2, 'Giải đấu Dreamleague season 1 chính thức khởi tranh', 'news2', 'static/img/news/news2_7CYKShb.jpg', 'Amer al-Barkawi (tiếng Ả Rập: عامر البرقاوي) (sinh ngày 20 tháng 6 năm 1997), được biết đến với biệt danh Miracle-, là một vận động viên thể thao điện tử chuyên nghiệp môn Dota 2, hiện đang thi đấu cho Team Nigma. Ngày 12 tháng 8 năm 2017, anh cùng với Team Liquid vô địch The International 2017 giải đấu lớn nhất trong lịch sử thể thao điện tử tính đến năm 2017. Miracle- có quốc tịch kép do có mẹ là người Ba Lan và cha là người Jordan. Tính tới tháng 8 năm 2019, anh là vận động viên thể thao điện tử có tổng thu nhập cao thứ bảy thế giới với $4,691,444.88 USD sau khi cùng Team Liquid giành ngôi Á quân tại The International 2019. Từ nhỏ, Miracle- đã bắt đầu làm quen với thể loại game MOBA (ARTS) với tựa game Defense of the Ancients (DotA), vốn được phát triển dựa trên nền Warcraft 3. Từ khoảng giữa năm 2014, Miracle- nổi lên là một trong những người chơi nghiệp dư nổi tiếng nhất (\"pubstar\") của môn Dota 2. Đầu năm 2015, Miracle- bắt đầu sự nghiệp thi đấu chuyên nghiệp với đội Balkan Bears, tuy nhiên anh không được tham gia vào bất kỳ giải đấu lớn nào và rời đội chỉ sau bốn tháng. Cuối năm đó, Miracle- trở thành game thủ Dota 2 xếp hạng cao nhất. Cuối năm 2015, Miracle- trở thành vận động viên chuyên nghiệp khi được Johan \"N0tail\" Sundstein mời vào đội hình của đội (monkey) Business[4] Sau một thỏa thuận tài trợ, (monkey) Business đổi thành Team OG. Ngay sau khi đổi tên, Miracle- và đội đã vô địch giải Frankfurt Major[5], tiếp theo là vị trí thứ 7-8 tại Shanghai Major. Năm 2016, OG đã vô địch liên tiếp Manilla Major và ESL One Frankfurt, trở thành đội đầu tiên vô địch 2 giải Major trong lịch sử Dota 2. Ngày 11 tháng 5 năm 2016, anh trở thành người chơi Dota 2 đầu tiên cán mốc 9000 MMR - mức điểm xếp hạng cao nhất tính đến thời điểm đó của trò chơi. Sau khi đạt ví trí 9-12 tại giải vô địch thế giới The International 2016, Miracle- rời OG rồi tham gia Team Liquid vào tháng 9 năm 2016, sau khi Adrian \"Fata\" Trinks công bố nghỉ tạm thời thi đấu chuyên nghiệp. Đầu năm 2017, Team Liquid không đủ điều kiện tham gia Boston Major. Tuy nhiên sau khi bạn của anh Maroun \"GH\" Merhej gia nhập Liquid, đội đã giành chiến thắng tại DreamLeague và nhanh chóng trở lại top dẫn đầu Dota 2 chuyên nghiệp. Ngày 12/08/2017, Miracle- cùng Team Liquid đã vô địch The International 2017 sau khi chiến thắng Newbee với tỉ số 3-0, giành giải thưởng lớn nhất mà chưa một giải đấu eSport. Năm 2018, Team Liquid còn giành thêm được danh hiệu Dota 2 Supermajor tổ chức tại Trung Quốc. Họ kết thúc mùa giải 2017-18 tại vị trí số 2 theo bảng xếp hạng của Valve. Tuy nhiên, tại The International 2018, Miracle- và Liquid chỉ giành được vị trí thứ 4 sau khi để thua Evil Geniuses với tỷ số 0-2. Tại The International 2019, team Liquid để thua 1-3 trước Team OG tại trận chung kết tổng, qua đó giành Á quân với tiền thưởng $4,460,194 USD. Sau khi kết thúc The International 2019, toàn bộ thành viên đội Dota 2 của Team Liquid (trong đó có Miracle-) đã thông báo rời khỏi tổ chức Liquid để thành lập 1 tổ chức của riêng mình: Team Nigma.', 1, 1),
(3, 'Lộ trình phát triển: Cập nhật lượng lớn anh hùng trong bản 1.0', 'news3', 'static/img/news/news3_JL7Z286.jpg', 'Amer al-Barkawi (tiếng Ả Rập: عامر البرقاوي) (sinh ngày 20 tháng 6 năm 1997), được biết đến với biệt danh Miracle-, là một vận động viên thể thao điện tử chuyên nghiệp môn Dota 2, hiện đang thi đấu cho Team Nigma. Ngày 12 tháng 8 năm 2017, anh cùng với Team Liquid vô địch The International 2017 giải đấu lớn nhất trong lịch sử thể thao điện tử tính đến năm 2017. Miracle- có quốc tịch kép do có mẹ là người Ba Lan và cha là người Jordan. Tính tới tháng 8 năm 2019, anh là vận động viên thể thao điện tử có tổng thu nhập cao thứ bảy thế giới với $4,691,444.88 USD sau khi cùng Team Liquid giành ngôi Á quân tại The International 2019. Từ nhỏ, Miracle- đã bắt đầu làm quen với thể loại game MOBA (ARTS) với tựa game Defense of the Ancients (DotA), vốn được phát triển dựa trên nền Warcraft 3. Từ khoảng giữa năm 2014, Miracle- nổi lên là một trong những người chơi nghiệp dư nổi tiếng nhất (\"pubstar\") của môn Dota 2. Đầu năm 2015, Miracle- bắt đầu sự nghiệp thi đấu chuyên nghiệp với đội Balkan Bears, tuy nhiên anh không được tham gia vào bất kỳ giải đấu lớn nào và rời đội chỉ sau bốn tháng. Cuối năm đó, Miracle- trở thành game thủ Dota 2 xếp hạng cao nhất. Cuối năm 2015, Miracle- trở thành vận động viên chuyên nghiệp khi được Johan \"N0tail\" Sundstein mời vào đội hình của đội (monkey) Business[4] Sau một thỏa thuận tài trợ, (monkey) Business đổi thành Team OG. Ngay sau khi đổi tên, Miracle- và đội đã vô địch giải Frankfurt Major[5], tiếp theo là vị trí thứ 7-8 tại Shanghai Major. Năm 2016, OG đã vô địch liên tiếp Manilla Major và ESL One Frankfurt, trở thành đội đầu tiên vô địch 2 giải Major trong lịch sử Dota 2. Ngày 11 tháng 5 năm 2016, anh trở thành người chơi Dota 2 đầu tiên cán mốc 9000 MMR - mức điểm xếp hạng cao nhất tính đến thời điểm đó của trò chơi. Sau khi đạt ví trí 9-12 tại giải vô địch thế giới The International 2016, Miracle- rời OG rồi tham gia Team Liquid vào tháng 9 năm 2016, sau khi Adrian \"Fata\" Trinks công bố nghỉ tạm thời thi đấu chuyên nghiệp. Đầu năm 2017, Team Liquid không đủ điều kiện tham gia Boston Major. Tuy nhiên sau khi bạn của anh Maroun \"GH\" Merhej gia nhập Liquid, đội đã giành chiến thắng tại DreamLeague và nhanh chóng trở lại top dẫn đầu Dota 2 chuyên nghiệp. Ngày 12/08/2017, Miracle- cùng Team Liquid đã vô địch The International 2017 sau khi chiến thắng Newbee với tỉ số 3-0, giành giải thưởng lớn nhất mà chưa một giải đấu eSport. Năm 2018, Team Liquid còn giành thêm được danh hiệu Dota 2 Supermajor tổ chức tại Trung Quốc. Họ kết thúc mùa giải 2017-18 tại vị trí số 2 theo bảng xếp hạng của Valve. Tuy nhiên, tại The International 2018, Miracle- và Liquid chỉ giành được vị trí thứ 4 sau khi để thua Evil Geniuses với tỷ số 0-2. Tại The International 2019, team Liquid để thua 1-3 trước Team OG tại trận chung kết tổng, qua đó giành Á quân với tiền thưởng $4,460,194 USD. Sau khi kết thúc The International 2019, toàn bộ thành viên đội Dota 2 của Team Liquid (trong đó có Miracle-) đã thông báo rời khỏi tổ chức Liquid để thành lập 1 tổ chức của riêng mình: Team Nigma.', 0, 4),
(4, 'Tiêu điểm anh hùng: Alvar - Erica', 'news4', 'static/img/news/news4_0boEtmc.jpg', 'Amer al-Barkawi (tiếng Ả Rập: عامر البرقاوي) (sinh ngày 20 tháng 6 năm 1997), được biết đến với biệt danh Miracle-, là một vận động viên thể thao điện tử chuyên nghiệp môn Dota 2, hiện đang thi đấu cho Team Nigma. Ngày 12 tháng 8 năm 2017, anh cùng với Team Liquid vô địch The International 2017 giải đấu lớn nhất trong lịch sử thể thao điện tử tính đến năm 2017. Miracle- có quốc tịch kép do có mẹ là người Ba Lan và cha là người Jordan. Tính tới tháng 8 năm 2019, anh là vận động viên thể thao điện tử có tổng thu nhập cao thứ bảy thế giới với $4,691,444.88 USD sau khi cùng Team Liquid giành ngôi Á quân tại The International 2019. Từ nhỏ, Miracle- đã bắt đầu làm quen với thể loại game MOBA (ARTS) với tựa game Defense of the Ancients (DotA), vốn được phát triển dựa trên nền Warcraft 3. Từ khoảng giữa năm 2014, Miracle- nổi lên là một trong những người chơi nghiệp dư nổi tiếng nhất (\"pubstar\") của môn Dota 2. Đầu năm 2015, Miracle- bắt đầu sự nghiệp thi đấu chuyên nghiệp với đội Balkan Bears, tuy nhiên anh không được tham gia vào bất kỳ giải đấu lớn nào và rời đội chỉ sau bốn tháng. Cuối năm đó, Miracle- trở thành game thủ Dota 2 xếp hạng cao nhất. Cuối năm 2015, Miracle- trở thành vận động viên chuyên nghiệp khi được Johan \"N0tail\" Sundstein mời vào đội hình của đội (monkey) Business[4] Sau một thỏa thuận tài trợ, (monkey) Business đổi thành Team OG. Ngay sau khi đổi tên, Miracle- và đội đã vô địch giải Frankfurt Major[5], tiếp theo là vị trí thứ 7-8 tại Shanghai Major. Năm 2016, OG đã vô địch liên tiếp Manilla Major và ESL One Frankfurt, trở thành đội đầu tiên vô địch 2 giải Major trong lịch sử Dota 2. Ngày 11 tháng 5 năm 2016, anh trở thành người chơi Dota 2 đầu tiên cán mốc 9000 MMR - mức điểm xếp hạng cao nhất tính đến thời điểm đó của trò chơi. Sau khi đạt ví trí 9-12 tại giải vô địch thế giới The International 2016, Miracle- rời OG rồi tham gia Team Liquid vào tháng 9 năm 2016, sau khi Adrian \"Fata\" Trinks công bố nghỉ tạm thời thi đấu chuyên nghiệp. Đầu năm 2017, Team Liquid không đủ điều kiện tham gia Boston Major. Tuy nhiên sau khi bạn của anh Maroun \"GH\" Merhej gia nhập Liquid, đội đã giành chiến thắng tại DreamLeague và nhanh chóng trở lại top dẫn đầu Dota 2 chuyên nghiệp. Ngày 12/08/2017, Miracle- cùng Team Liquid đã vô địch The International 2017 sau khi chiến thắng Newbee với tỉ số 3-0, giành giải thưởng lớn nhất mà chưa một giải đấu eSport. Năm 2018, Team Liquid còn giành thêm được danh hiệu Dota 2 Supermajor tổ chức tại Trung Quốc. Họ kết thúc mùa giải 2017-18 tại vị trí số 2 theo bảng xếp hạng của Valve. Tuy nhiên, tại The International 2018, Miracle- và Liquid chỉ giành được vị trí thứ 4 sau khi để thua Evil Geniuses với tỷ số 0-2. Tại The International 2019, team Liquid để thua 1-3 trước Team OG tại trận chung kết tổng, qua đó giành Á quân với tiền thưởng $4,460,194 USD. Sau khi kết thúc The International 2019, toàn bộ thành viên đội Dota 2 của Team Liquid (trong đó có Miracle-) đã thông báo rời khỏi tổ chức Liquid để thành lập 1 tổ chức của riêng mình: Team Nigma.', 2, 3),
(5, 'Một ngày làm việc của Amin', 'news5', 'static/img/news/news5_ghzqjq0.jpg', 'Amer al-Barkawi (tiếng Ả Rập: عامر البرقاوي) (sinh ngày 20 tháng 6 năm 1997), được biết đến với biệt danh Miracle-, là một vận động viên thể thao điện tử chuyên nghiệp môn Dota 2, hiện đang thi đấu cho Team Nigma. Ngày 12 tháng 8 năm 2017, anh cùng với Team Liquid vô địch The International 2017 giải đấu lớn nhất trong lịch sử thể thao điện tử tính đến năm 2017. Miracle- có quốc tịch kép do có mẹ là người Ba Lan và cha là người Jordan. Tính tới tháng 8 năm 2019, anh là vận động viên thể thao điện tử có tổng thu nhập cao thứ bảy thế giới với $4,691,444.88 USD sau khi cùng Team Liquid giành ngôi Á quân tại The International 2019. Từ nhỏ, Miracle- đã bắt đầu làm quen với thể loại game MOBA (ARTS) với tựa game Defense of the Ancients (DotA), vốn được phát triển dựa trên nền Warcraft 3. Từ khoảng giữa năm 2014, Miracle- nổi lên là một trong những người chơi nghiệp dư nổi tiếng nhất (\"pubstar\") của môn Dota 2. Đầu năm 2015, Miracle- bắt đầu sự nghiệp thi đấu chuyên nghiệp với đội Balkan Bears, tuy nhiên anh không được tham gia vào bất kỳ giải đấu lớn nào và rời đội chỉ sau bốn tháng. Cuối năm đó, Miracle- trở thành game thủ Dota 2 xếp hạng cao nhất. Cuối năm 2015, Miracle- trở thành vận động viên chuyên nghiệp khi được Johan \"N0tail\" Sundstein mời vào đội hình của đội (monkey) Business[4] Sau một thỏa thuận tài trợ, (monkey) Business đổi thành Team OG. Ngay sau khi đổi tên, Miracle- và đội đã vô địch giải Frankfurt Major[5], tiếp theo là vị trí thứ 7-8 tại Shanghai Major. Năm 2016, OG đã vô địch liên tiếp Manilla Major và ESL One Frankfurt, trở thành đội đầu tiên vô địch 2 giải Major trong lịch sử Dota 2. Ngày 11 tháng 5 năm 2016, anh trở thành người chơi Dota 2 đầu tiên cán mốc 9000 MMR - mức điểm xếp hạng cao nhất tính đến thời điểm đó của trò chơi. Sau khi đạt ví trí 9-12 tại giải vô địch thế giới The International 2016, Miracle- rời OG rồi tham gia Team Liquid vào tháng 9 năm 2016, sau khi Adrian \"Fata\" Trinks công bố nghỉ tạm thời thi đấu chuyên nghiệp. Đầu năm 2017, Team Liquid không đủ điều kiện tham gia Boston Major. Tuy nhiên sau khi bạn của anh Maroun \"GH\" Merhej gia nhập Liquid, đội đã giành chiến thắng tại DreamLeague và nhanh chóng trở lại top dẫn đầu Dota 2 chuyên nghiệp. Ngày 12/08/2017, Miracle- cùng Team Liquid đã vô địch The International 2017 sau khi chiến thắng Newbee với tỉ số 3-0, giành giải thưởng lớn nhất mà chưa một giải đấu eSport. Năm 2018, Team Liquid còn giành thêm được danh hiệu Dota 2 Supermajor tổ chức tại Trung Quốc. Họ kết thúc mùa giải 2017-18 tại vị trí số 2 theo bảng xếp hạng của Valve. Tuy nhiên, tại The International 2018, Miracle- và Liquid chỉ giành được vị trí thứ 4 sau khi để thua Evil Geniuses với tỷ số 0-2. Tại The International 2019, team Liquid để thua 1-3 trước Team OG tại trận chung kết tổng, qua đó giành Á quân với tiền thưởng $4,460,194 USD. Sau khi kết thúc The International 2019, toàn bộ thành viên đội Dota 2 của Team Liquid (trong đó có Miracle-) đã thông báo rời khỏi tổ chức Liquid để thành lập 1 tổ chức của riêng mình: Team Nigma.', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `app_order`
--

CREATE TABLE `app_order` (
  `id` int(11) NOT NULL,
  `ordered_by` varchar(200) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `subtotal` int(10) UNSIGNED NOT NULL CHECK (`subtotal` >= 0),
  `discount` int(10) UNSIGNED NOT NULL CHECK (`discount` >= 0),
  `total` int(10) UNSIGNED NOT NULL CHECK (`total` >= 0),
  `order_status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `cart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_order`
--

INSERT INTO `app_order` (`id`, `ordered_by`, `mobile`, `email`, `subtotal`, `discount`, `total`, `order_status`, `created_at`, `cart_id`) VALUES
(1, 'Nguyễn Ngọc Kim Cương', '0379329066', 'kimcuongpyai@gmail.com', 265000, 0, 265000, 'Đang xử lí', '2021-05-11 03:14:30.567664', 3),
(2, 'Nguyễn Ngọc Kim Cương', '0379329066', 'kimcuongpyai@gmail.com', 260000, 0, 260000, 'Đã nhận', '2021-05-16 07:53:33.595547', 6),
(3, 'Nguyễn Ngọc Kim Cương', '0379329066', 'kimcuongpyai@gmail.com', 155000, 0, 155000, 'Đang xử lí', '2021-05-31 07:58:53.344945', 8);

-- --------------------------------------------------------

--
-- Table structure for table `app_product`
--

CREATE TABLE `app_product` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `selling_price` int(10) UNSIGNED NOT NULL CHECK (`selling_price` >= 0),
  `description` longtext NOT NULL,
  `view_count` int(10) UNSIGNED NOT NULL CHECK (`view_count` >= 0),
  `category_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_product`
--

INSERT INTO `app_product` (`id`, `title`, `slug`, `image`, `selling_price`, `description`, `view_count`, `category_id`, `value_id`) VALUES
(1, 'Cú đêm', 'night-owl', 'static/img/products/night-owl_zLXmtkM.png', 65000, 'Có thể trao đổi', 1, 3, 2),
(2, 'Lưỡi câu', 'fishing-hook', 'static/img/products/fishing-hook_5LgN7lf.png', 50000, 'Có thể trao đổi', 2, 3, 2),
(3, 'Mùa xuân', 'spring', 'static/img/products/spring_omo3Ozt.png', 200000, 'Không thể trao đổi', 1, 4, 3),
(4, 'Mùa hè', 'summer', 'static/img/products/summer_qAHyrrG.png', 200000, 'Không thể trao đổi', 1, 4, 3),
(5, 'Mùa thu', 'autumn', 'static/img/products/autumn_BUKl7dE.png', 200000, 'Không thể trao đổi', 0, 4, 3),
(6, 'Mùa đông', 'winter', 'static/img/products/winter_uCEf5oE.png', 200000, 'Không thể trao đổi', 0, 4, 3),
(7, 'Ốc sên', 'snail', 'static/img/products/snail_8Jz5IbT.png', 20000, 'Có thể trao đổi', 0, 3, 1),
(8, 'Cây ăn thịt', 'carnivorous-plants', 'static/img/products/carnivorous-plants_dAQjDsB.png', 20000, 'Có thể trao đổi', 0, 3, 1),
(9, 'Bù nhìn rơm', 'scarecrow-straw', 'static/img/products/scarecrow_GTjCxDi.png', 25000, 'Có thể trao đổi', 0, 3, 1),
(10, 'Mùa xuân', 'springf', 'static/img/products/springf_lKgntui.png', 120000, 'Không thể trao đổi', 0, 2, 2),
(11, 'Mùa hè', 'summerf', 'static/img/products/summerf_YufdFAO.png', 120000, 'Không thể trao đổi', 1, 2, 2),
(12, 'Mùa thu', 'autumnf', 'static/img/products/autumnf_nHPPJDQ.png', 120000, 'Không thể trao đổi', 0, 2, 2),
(13, 'Mùa đông', 'winterf', 'static/img/products/winterf_OstyU9K.png', 120000, 'Không thể trao đổi', 0, 2, 2),
(14, 'Quỷ hề', 'clown-devil', 'static/img/products/clown-devil_ntuhtnQ.png', 65000, 'Có thể trao đổi', 0, 3, 2),
(15, 'Tượng rồng', 'dragon-statue', 'static/img/products/dragon-statue_e150pOU.png', 25000, 'Có thể trao đổi', 1, 3, 1),
(16, 'Bí ẩn biển sâu', 'deep-sea-mystery', 'static/img/products/deep-sea-mystery_U1Eao9G.png', 800000, 'Có thể trao đổi', 2, 4, 6),
(17, 'Giông bão', 'storm', 'static/img/products/storm_ZpQvxC0.png', 150000, 'Có thể trao đổi', 0, 2, 2),
(18, 'Halloween', 'halloween', 'static/img/products/halloween_twTHt61.png', 250000, 'Không thể trao đổi', 0, 2, 3),
(19, 'Địa ngục', 'hell', 'static/img/products/hell_9QPMZSH.png', 320000, 'Có thể trao đổi', 1, 2, 4),
(20, 'Cực quang', 'aurorae', 'static/img/products/aurorae_xOGoNLZ.png', 350000, 'Có thể trao đổi', 1, 2, 4),
(21, 'Song song', 'parallel-world', 'static/img/products/parallel-world_YIwR9ly.png', 850000, 'Có thể trao đổi', 1, 2, 6),
(22, 'Gói biểu cảm 1', 'expression-pack1', 'static/img/products/expression-pack1_1CAUFqF.png', 85000, 'Có thể trao đổi', 3, 1, 2),
(23, 'Gói biểu cảm 2', 'expression-pack2', 'static/img/products/expression-pack2_DvcGPJz.png', 85000, 'Có thể trao đổi', 1, 1, 2),
(24, 'Gói biểu cảm 3', 'expression-pack3', 'static/img/products/expression-pack3_LBSsB5o.png', 85000, 'Có thể trao đổi', 1, 1, 2),
(25, 'Con lăn 1', 'mouse-icon1', 'static/img/products/mouse-icon1_dEpqRYR.png', 50000, 'Có thể trao đổi', 2, 2, 2),
(26, 'Con lăn 2', 'mouse-icon2', 'static/img/products/mouse-icon2_14bLbXb.jpg', 50000, 'Có thể trao đổi', 2, 2, 2),
(27, 'Sương đen', 'dark-fog', 'static/img/products/dark-fog_d4ShD8E.jpg', 500000, 'Có thể trao đổi', 0, 2, 5),
(28, 'Ánh trăng mờ', 'dim-moonlight', 'static/img/products/dim-moonlight_yySWrDt.png', 70000, 'Không thể trao đổi', 3, 2, 2),
(29, 'Nắng vàng', 'golden-sunshine', 'static/img/products/golden-_sunshine.png', 70000, 'Không thể trao đổi', 1, 2, 2),
(30, 'Vực thẳm tối', 'abyss-of-darkness', 'static/img/products/abyss-of-darkness_jzItN82.png', 850000, 'Có thể trao đổi', 1, 4, 6),
(31, 'Đền cổ xưa', 'ancient-temple', 'static/img/products/ancient-temple_LtxLglh.jpg', 300000, 'Có thể trao đổi', 0, 4, 4),
(32, 'Gói biểu cảm 4', 'expression-pack4', 'static/img/products/expression-pack4_IFucBhk.png', 85000, 'Có thể trao đổi', 0, 1, 2),
(33, 'Gói biểu cảm 5', 'expression-pack5', 'static/img/products/expression-pack5_s0wx34t.png', 85000, 'Có thể trao đổi', 0, 1, 2),
(34, 'Gói biểu cảm 6', 'expression-pack6', 'static/img/products/expression-pack6_rp9UFzH.png', 85000, 'Có thể trao đổi', 0, 1, 2),
(35, 'Gói biểu cảm 7', 'expression-pack7', 'static/img/products/expression-pack7_4qt5jQp.png', 85000, 'Có thể trao đổi', 1, 1, 2),
(36, 'Con lăn 3', 'mouse-icon3', 'static/img/products/mouse-icon3_4NZjARy.png', 65000, 'Có thể trao đổi', 0, 2, 2),
(37, 'Con lăn 4', 'mouse-icon4', 'static/img/products/mouse-icon4_YcCE0C5.png', 65000, 'Có thể trao đổi', 0, 2, 2),
(38, 'Con lăn 5', 'mouse-icon5', 'static/img/products/mouse-icon5_nHbH2xr.png', 65000, 'Có thể trao đổi', 1, 2, 2),
(39, 'Phượng hoàng', 'phoenix', 'static/img/products/phoenix_ZGiq5CT.png', 60000, 'Có thể trao đổi', 0, 3, 2),
(40, 'Samurai', 'samurai', 'static/img/products/samurai_27kT7Ur.png', 50000, 'Có thể trao đổi', 0, 3, 2),
(41, 'Bướm bướm', 'butterfly', 'static/img/products/butterfly_l9mKM7p.jpg', 25000, 'Có thể trao đổi', 0, 3, 1),
(42, 'Thiên nhiên', 'nature', 'static/img/products/nature_BrPDMkj.jpg', 20000, 'Có thể trao đổi', 0, 3, 1),
(43, 'Con lăn 6', 'mouse-icon6', 'static/img/products/mouse-icon6_7QkF6I1.png', 75000, 'Có thể trao đổi', 1, 2, 2),
(44, 'Con lăn 7', 'mouse-icon7', 'static/img/products/mouse-icon7_JCMRHEA.png', 60000, 'Có thể trao đổi', 0, 2, 2),
(45, 'Nước chảy', 'water-flow', 'static/img/products/water-flow_GBhXLQf.png', 70000, 'Không thể trao đổi', 0, 2, 2),
(46, 'Lửa cháy', 'burning-flame', 'static/img/products/burning-flame_cvpoVMP.png', 70000, 'Không thể trao đổi', 2, 2, 2),
(47, 'Lợn con dễ thương', 'cute-pig', 'static/img/products/cute-pig_MIcE1a2.jpg', 25000, 'Có thể trao đổi', 0, 3, 1),
(48, 'Ếch đỏ', 'red-frog', 'static/img/products/red-frog_a82xyL6.png', 30000, 'Có thể trao đổi', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_skill`
--

CREATE TABLE `app_skill` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `ability` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `affects` varchar(100) NOT NULL,
  `type_damage` varchar(50) NOT NULL,
  `cooldown` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_skill`
--

INSERT INTO `app_skill` (`id`, `title`, `slug`, `image`, `ability`, `description`, `affects`, `type_damage`, `cooldown`) VALUES
(1, 'Kiếm hồn', 'blade-soul', 'static/img/ability/blade-soul_8lhtkt4.png', 'Bị động', 'Các đòn tấn công cơ bản của Kiyoko sẽ gây thêm sát thương phép và cướp đi năng lượng của kẻ thù để chuyển hóa thành của bản thân.', 'Kẻ thù/Bản thân', 'Phép thuật', '0'),
(2, 'Cảm thụ không gian', 'feel-the-space', 'static/img/ability/feel-the-space_d0M7pjt.png', 'Kích hoạt', 'Kiyoko phát động một làn sóng năng lượng để phát hiện ra tất cả các mục tiêu có năng lượng trong vùng ảnh hưởng, ngoài ra sẽ gây sát thương phép dựa trên lượng mana mà mục tiêu có.', 'Kẻ thù/Bản thân', 'Phép thuật', '20/18/16/14/12'),
(3, 'Bước nhảy không gian', 'space-jump', 'static/img/ability/space-jump_kdKFJOh.png', 'Kích hoạt', 'Kiyoko lướt một quãng ngắn đến vị trí chỉ định và gây sát thương vật lí lên các mục tiêu trên đường lướt của cô, mỗi lần sử dụng kỹ năng sẽ tăng thêm mức độ tiêu thụ mana.', 'Kẻ thù/Bản thân', 'Vật lý', '0.5'),
(4, 'Bão năng lượng (Ultimate)', 'energy-storm', 'static/img/ability/energy-storm_PTzXC5o.png', 'Kích hoạt', 'Kiyoko chọn một vùng và gây sát thương vật lý lên tất cả các kẻ thù trong đó, cô cũng trở lên bất khả xâm phạm trong khoảng thời gian này.', 'Kẻ thù/Bản thân', 'Vật lý', '140'),
(5, 'Cú nện tàn khốc', 'devastating-blow', 'static/img/ability/devastating-blow_aqBwKO0.png', 'Kích hoạt', 'Waldo nện mạnh chiếc rìu về phía trước gây sát thương hình nón lên mọi kẻ thù, nếu chỉ trúng một mục tiêu sẽ nhận thêm 100% sát thương.', 'Kẻ thù', 'Vật lý', '12/11/10/9/8'),
(6, 'Dư chấn', 'aftershocks', 'static/img/ability/aftershocks_wZcLpO2.png', 'Kích hoạt', 'Waldo đập mạnh chiếc rìu xuống mặt đất gây ra một vùng chấn động gây sát thương và làm chậm các mục tiêu ở trong vùng ảnh hưởng.', 'Kẻ thù', 'Vật lý', '20/19/18/17/16'),
(7, 'Ý niệm của loài Orc', 'concept-of-orc', 'static/img/ability/concept-of-orc_jyEjB6S.png', 'Bị động', 'Gia tăng mạnh khả năng giảm sát thương , hồi phục và sát thương khi lượng máu của Waldo càng thấp.', 'Bản thân', 'None', '0'),
(8, 'Cuồng bão rìu (Ultimate)', 'hurricane-ax', 'static/img/ability/hurricane-ax_SYGBNbY.png', 'Kích hoạt', 'Waldo xoay rìu gây sát thương liên tục lên tất cả các mục tiêu xung quanh, đồng thời hắn cũng sẽ miễn nhiễm với mọi loại khống chế và tăng 25% tốc độ di chuyển trong 10s hiệu lực củ kỹ năng.', 'Kẻ thù/Bản thân', 'Vật lý', '90'),
(9, 'Thệ ước', 'vow', 'static/img/ability/vow_LKqPRbt.png', 'Bị động', 'Alvar và Erica được liên kết với nhau thông qua lời thề ước. Hai người sẽ cùng nhận lượng vàng, kinh nghiệm và khi ở trong tầm liên kết cả hai sẽ có thể dùng được Ultimate. Ngoài ra khi một người chết đi, người kia cũng sẽ chết theo.', 'Bản thân', 'None', '0'),
(10, 'Dịch chuyển', 'teleport', 'static/img/ability/teleport_XxvxOxY.png', 'Kích hoạt', 'Sau khi niệm chiêu cho phép người kia dịch chuyển đến vị trí của người còn lại.', 'Bản thân', 'None', '50/45/40/35/30'),
(11, 'Thay đổi vũ khí (Alvar/Ultimate)', 'change-weapons', 'static/img/ability/change-weapons_TnNO6JK.png', 'Kích hoạt', 'Alvar chuyển đổi dạng vũ khí cận chiến - đánh xa', 'Bản thân', 'None', '5/3/1'),
(12, 'Đạn bóng tối (Alvar/Đánh xa)', 'dark-bullets', 'static/img/ability/dark-bullets_eNfn95w.png', 'Kích hoạt', 'Alvar đưa sức mạnh tối của bản thân vào viên đạn giúp cường hóa những đòn tấn công tầm xa và giảm lượng giáp của mục tiêu.', 'Kẻ thù/Bản thân', 'Vật lý', '20/18/16/14/12'),
(13, 'Đại pháo hắc ám (Alvar/Đánh xa)', 'dark-cannon', 'static/img/ability/dark-cannon_zSAOiKl.png', 'Kích hoạt', 'Alvar sử dụng đại pháo bắn mạnh một đòn về phía trước gây ra một lượng sát thương lớn.', 'Kẻ thù', 'Vật lý', '20/18/16/14/12'),
(14, 'Giật lùi (Alvar/Đánh xa)', 'recoil', 'static/img/ability/recoil_uIvADL5.png', 'Kích hoạt', 'Alvar nhảy lùi về phía sau một đoạn ngắn.', 'Bản thân', 'None', '16/14/12/10/8'),
(15, 'Liều lĩnh (Alvar/Cận chiến)', 'daredevils', 'static/img/ability/daredevils_nNzwczB.png', 'Kích hoạt', 'Alvar điên cuồng sử dụng song đao để gây sát thương và đỡ mọi đòn tấn công hướng đến theo dạng hình nón trước mặt.', 'Kẻ thù/Bản thân', 'Vật lý', '30/27/24/21/18'),
(16, 'Bão kiếm (Alvar/Cận chiến)', 'sword-storm', 'static/img/ability/sword-storm_PDjDPfl.png', 'Kích hoạt', 'Alvar vận sức chém liên tục vào không trung gây sát thương liên tục theo thời gian.', 'Kẻ thù/Bản thân', 'Vật lý', '16/15/14/13/12'),
(17, 'Lướt (Alvar/cận chiến)', 'surf', 'static/img/ability/surf_mHB6v6q.png', 'Kích hoạt', 'Alvar lướt lên phía trước một đoạn ngắn.', 'Bản thân', 'None', '16/14/12/10/8'),
(18, 'Vuốt quỷ (Erica)', 'demon-claws', 'static/img/ability/demon-claws_7HIdPmV.png', 'Kích hoạt', 'Erica truyền ma lực vào tay và vẩy về phía được chỉ định, gây sát thương lên kẻ địch đầu tiên trúng phải. Nếu kết liễu được mục tiêu thì kỹ năng sẽ tiếp tục bay tiếp, mục tiêu kế tiếp sẽ nhận thêm sát thương dựa trên lượng máu đã mất của mục tiêu trước. Cường hóa: Cho phép kỹ năng đi xuyên qua tất cả các kẻ thù mà không bị cản lại.', 'Kẻ thù', 'Phép thuật', '12/11/10/9/8'),
(19, 'Lửa đen (Erica)', 'black-fire', 'static/img/ability/black-fire_7jzWTa9.png', 'Kích hoạt', 'Erica đốt một vùng đất bằng ngọn lửa đen, các mục tiêu trong vùng thi triển sẽ nhận sát thương theo thời gian, bị làm chậm và giảm khả năng hồi phục. Cường hóa: Đốt toàn bộ vùng đất ở bên trong lãnh địa của quỷ.', 'Kẻ thù', 'Phép thuật', '16/15/14/13/12'),
(20, 'Gai đen (Erica)', 'black-thorns', 'static/img/ability/black-thorns_NZEaaYw.png', 'Kích hoạt', 'Erica triệu hồi một đám gai đâm xuyên lên mặt đất gây sát thương và làm choáng tất cả những mục tiêu trong vùng ảnh hưởng. Cường hóa: Phạm vi tăng lên toàn bộ lãnh thổ của quỷ.', 'Kẻ thù', 'Phép thuật', '20/18/16/14/12'),
(21, 'Lãnh địa của ác ma (Erica/Ultimate)', 'devil-s-territory', 'static/img/ability/devils-territory_FcAmIND.png', 'Kích hoạt', 'Erica dựng lên một kết giới và biến vùng đất bên trong trở thành lãnh thổ của bản thân, Erica sẽ nâng cấp các kỹ năng còn lại của bản thân mình cùng với đó sẽ nhốt toàn bộ kẻ thù ở bên trong không thể thoát ra ngoài.', 'Kẻ thù', 'None', '160/150/140'),
(22, 'Quả cầu tối', 'dark-sphere', 'static/img/ability/dark-sphere_55yK58u.jpg', 'Kích hoạt', 'Lucifer tung ra một quỷ cầu năng lượng hắc ám về phía trước gây sát thương và dừng lại ngay chỗ mục tiêu đầu tiên trúng phải. Quả cầu sẽ tồn tại trong 30s.', 'Kẻ thù', 'Phép thuật', '10/9/8/7/6'),
(23, 'Bộc phát', 'explosive', 'static/img/ability/explosive_ooszNOB.jpg', 'Kích hoạt', 'Lucifer kích nổ quả cầu tối được chỉ định gây sát thương cho các mục tiêu xung quanh quả cầu.', 'Kẻ thù', 'Phép thuật', '10/9/8/7/6'),
(24, 'Lưới ma thuật', 'magic-net', 'static/img/ability/magic-net_dhhlLxV.jpg', 'Kích hoạt', 'Lucifer ném ra một lưới ma thuật để làm chậm kẻ thù và gây sát thương theo thời gian. Nếu lưới quăng đến vị trí của quả cầu tối sẽ trói mục tiêu lại.', 'Kẻ thù', 'Phép thuật', '20/19/18/17/16'),
(25, 'Kích tàn hắc ám', 'activate-the-dark-remnants', 'static/img/ability/activate-the-dark-remnants_nEWgq0j.jpg', 'Kích hoạt', 'Lucifer chọn quả cầu tối để lướt đến, trong lúc lướt đến anh ta sẽ không thể chọn làm mục tiêu.', 'Bản thân', 'None', '5/4/3/2/1'),
(26, 'Hắc ám truy kích', 'darkness-pursued', 'static/img/ability/darkness-pursued_iqdicQm.jpg', 'Kích hoạt', 'Lucifer triệu hồi một số lượng cầu tối và phóng về phía chỉ định, gây sát thương cho mục tiêu đầu tiên trúng phải. Cầu tối sẽ tồn tại trong 30s.', 'Kẻ thù', 'Phép thuật', '30/28/26/24/20'),
(27, 'Đôi cánh của tội lỗi (Ultimate)', 'wings-of-sin', 'static/img/ability/wings-of-sin_e3bwjid.jpg', 'Kích hoạt', 'Lucifer giang rộng đôi cánh và tỏa ra một nguồn năng lực hắc ám. Gây hoảng sợ cho mọi kẻ thù trong 2s, ngoài ra sẽ gây sát thương liên tục và cho Lucifer khả năng đi xuyên địa hình.', 'Kẻ thù/Bản thân', 'Phép thuật', '160/150/140'),
(28, 'Tử thần sinh mệnh', 'death-lives', 'static/img/ability/death-lives_JxK4aUH.jpg', 'Kích hoạt', 'Death sử dụng máu của bản thân để hòi phục cho đồng đội hoặc gây sát thương lên kẻ thù.', 'Kẻ thù/Đồng minh/Bản thân', 'Phép thuật', '10/9/8/7/6'),
(29, 'Tay của người chết', 'Hands-of-the-dead-person', 'static/img/ability/hands-of-the-dead-person_JMpiPqf.jpg', 'Kích hoạt', 'Death triệu hồi những cánh tay của người chết giúp hắn tăng mạnh tốc độ di chuyển, gây sát thương và làm chậm tất cả các mục tiêu trong vùng ảnh hưởng.', 'Kẻ thù/Bản thân', 'Phép thuật', '16/15/14/13/12'),
(30, 'Kẻ ăn hồn', 'soul-eater', 'static/img/ability/soul-eater_xixpWUJ.jpg', 'Bị động', 'Death hấp thu linh hồn của những kẻ xấu số để tăng mạnh khả năng hồi phục, giáp và kháng phép giảm dần trong thời gian ngắn.', 'Bản thân', 'None', '0'),
(31, 'Lưỡi hái tử thần', 'death-scythe', 'static/img/ability/death-scythe_OtOFRLg.jpg', 'Kích hoạt', 'Death làm choáng mục tiêu, sau đó gây sát thương cộng thêm lượng mất đã mất của mục tiêu. Bất cứ mục tiêu nào bị kết liễu bởi kỹ năng sẽ bị tăng thêm 15/25/35s hồi sinh và không thể sử dụng đá hoàn hồn.', 'Kẻ thù', 'Phép thuật', '140'),
(32, 'Săn mồi', 'hunt', 'static/img/ability/hunt_EfKVhNm.jpg', 'Kích hoạt', 'Baphomet đẩy mạnh tốc độ di chuyển lên cực hạn và giảm dần theo thời gian để nhanh chóng áp sát con mồi.', 'Bản thân', 'None', '18/17/16/15/14'),
(33, 'Sức mạnh ác quỷ', 'devil-s-power', 'static/img/ability/devil-s-power_x6o2abd.jpg', 'Kích hoạt', 'Baphomet tóm lấy mục tiêu theo hướng chỉ định và giữ chúng bị choáng, tái kích hoạt cho phép hắn ném nạn nhân về vị trí chỉ định và gây sát thương vật lý lên chúng khi chạm đất.', 'Kẻ thù', 'Vật lý', '19/17/15/13/11'),
(34, 'Ngôi sao năm cánh ngược', 'reverse-pentagram', 'static/img/ability/reverse-pentagram_1jarKRP.jpg', 'Bị động', 'Cứ mỗi khi có một đơn vị chết đi trong bán kích 450 xung quanh baphomet, hắn ta sẽ được hồi lại một lượng máu tương đương 2/4/6/8/10% HP tối đa.', 'Bản thân', 'Phép thuật', '0'),
(35, 'Ăn tươi nuốt sống', 'devour', 'static/img/ability/devour_CcUSOWq.jpg', 'Kích hoạt', 'Baphomet đớp một cú cực mạnh gây sát thương chuẩn lên mục tiêu chỉ định, nếu cú đớp kết liễu được mục tiêu đó sẽ cho phép hắn ta nhận thêm máu vĩnh viễn.', 'Kẻ thù/Bản thân', 'Chuẩn', '90/75/60');

-- --------------------------------------------------------

--
-- Table structure for table `app_staff`
--

CREATE TABLE `app_staff` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_staff`
--

INSERT INTO `app_staff` (`id`, `full_name`, `image`, `mobile`, `user_id`) VALUES
(1, 'Nguyễn Ngọc Kim Cương', 'static/img/staff/cuongai_rsfUgiR.jpg', '0379329066', 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_stat`
--

CREATE TABLE `app_stat` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `health` varchar(100) NOT NULL,
  `health_regen` varchar(100) NOT NULL,
  `mana` varchar(100) NOT NULL,
  `mana_regen` varchar(100) NOT NULL,
  `armor` varchar(100) NOT NULL,
  `magic_resistance` varchar(100) NOT NULL,
  `damage` varchar(100) NOT NULL,
  `magic` varchar(100) NOT NULL,
  `move_speed` varchar(100) NOT NULL,
  `att_speed` varchar(100) NOT NULL,
  `att_range` varchar(100) NOT NULL,
  `vision_range` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_stat`
--

INSERT INTO `app_stat` (`id`, `title`, `slug`, `health`, `health_regen`, `mana`, `mana_regen`, `armor`, `magic_resistance`, `damage`, `magic`, `move_speed`, `att_speed`, `att_range`, `vision_range`) VALUES
(1, 'Kiyoko', 'kiyoko', '660 (+30 HP/Level)', '1.25 (+0.125 HP regen/Level)', '229 (+21 MP/Level)', '0.9 (+0.09 MP regen/Level)', '2 (+0.5 Armor/Level)', '20%', '34 (+4 Dmg/Level)', '15 (+3 Magic/Level)', '300', '110', '150', '1800/900'),
(2, 'Waldo', 'waldo', '660 (+70 HP/Level)', '2.0 (+0.3 HP regen/Level)', '290 (+18 MP/Level)', '0.9 (+0.08 MP regen/Level)', '2.5 (+0.5 Armor/Level)', '25%', '52 (+4 Dmg/Level)', '14 (+2 Magic/Level)', '300', '100', '200', '1800/900'),
(3, 'Lucifer', 'lucifer', '620 (+40 HP/Level)', '2.1 (+0.2 HP regen/Level)', '350 (+48 MP/Level)', '1.2 (+0.2 MP regen/Level)', '5.3 (+0.3 Armor/Level)', '20%', '49 (+4 Dmg/Level)', '22 (+6 Magic/Level)', '310', '110', '450', '1800/900'),
(4, 'Death', 'death', '560 (+40 HP/Level)', '1.5 (+0.35 HP regen/Level)', '315 (+22 MP/Level)', '1.0 (+0.09 MP regen/Level)', '0 (+0.5 Armor/Level)', '25%', '50 (+4 Dmg/Level)', '16 (+4 Magic/Level)', '305', '100', '300', '1800/900'),
(5, 'Alvar - Erica', 'alvar-erica', 'Alvar: 660 (+70 HP/Level) | Erica: 590 (+50 HP/Level)', 'Alvar: 2.5 (+0.125 HP regen/Level) | Erica: 1.5 (+0.2 HP regen/Level)', 'Alvar: 315 (+25 MP/Level) | Erica: 350 (+48 MP/Level)', 'Alvar: 1 (+0.1 MP regen/Level) | Erica: 1 (+0.3 MP regen/Level)', 'Alvar: 2.5 (+0.5 Armor/Level) | Erica: 2.5 (+0.3 Armor/Level)', 'Alvar: 25% | Erica: 25%', 'Alvar: 49 (+4 Dmg/Level) | Erica: 40 (+3 Dmg/Level))', 'Alvar: 0 (+3 Magic/Level) | Erica: 16 (+6 Magic/Level)', 'Alvar: 310 | Erica: 295', 'Alvar: 110 | Erica: 100', 'Alvar: 150 | Erica: 500', 'Alvar: 1800/900 | Erica: 900/1800'),
(6, 'Baphomet', 'baphomet', '660 (+60 HP/Level)', '2.5 (+0.29 HP regen/Level)', '255 (+27 MP/Level)', '0.75 (+0.12 MP regen/Level)', '4.0 (+0.48 Armor/Level)', '25%', '46 (+4 Dmg/Level)', '16 (+6 Magic/Level)', '325', '120', '150', '900/1800');

-- --------------------------------------------------------

--
-- Table structure for table `app_value`
--

CREATE TABLE `app_value` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_value`
--

INSERT INTO `app_value` (`id`, `title`, `slug`) VALUES
(1, 'Thường', 'common'),
(2, 'Cao cấp', 'uncommon'),
(3, 'Hiếm có', 'rare'),
(4, 'Huyền thoại', 'legend'),
(5, 'Thần thánh', 'divine'),
(6, 'Bất diệt', 'immortal');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add cart', 1, 'add_cart'),
(2, 'Can change cart', 1, 'change_cart'),
(3, 'Can delete cart', 1, 'delete_cart'),
(4, 'Can view cart', 1, 'view_cart'),
(5, 'Can add category', 2, 'add_category'),
(6, 'Can change category', 2, 'change_category'),
(7, 'Can delete category', 2, 'delete_category'),
(8, 'Can view category', 2, 'view_category'),
(9, 'Can add category hero', 3, 'add_categoryhero'),
(10, 'Can change category hero', 3, 'change_categoryhero'),
(11, 'Can delete category hero', 3, 'delete_categoryhero'),
(12, 'Can view category hero', 3, 'view_categoryhero'),
(13, 'Can add category item', 4, 'add_categoryitem'),
(14, 'Can change category item', 4, 'change_categoryitem'),
(15, 'Can delete category item', 4, 'delete_categoryitem'),
(16, 'Can view category item', 4, 'view_categoryitem'),
(17, 'Can add category new', 5, 'add_categorynew'),
(18, 'Can change category new', 5, 'change_categorynew'),
(19, 'Can delete category new', 5, 'delete_categorynew'),
(20, 'Can view category new', 5, 'view_categorynew'),
(21, 'Can add skill', 6, 'add_skill'),
(22, 'Can change skill', 6, 'change_skill'),
(23, 'Can delete skill', 6, 'delete_skill'),
(24, 'Can view skill', 6, 'view_skill'),
(25, 'Can add stat', 7, 'add_stat'),
(26, 'Can change stat', 7, 'change_stat'),
(27, 'Can delete stat', 7, 'delete_stat'),
(28, 'Can view stat', 7, 'view_stat'),
(29, 'Can add value', 8, 'add_value'),
(30, 'Can change value', 8, 'change_value'),
(31, 'Can delete value', 8, 'delete_value'),
(32, 'Can view value', 8, 'view_value'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add order', 10, 'add_order'),
(38, 'Can change order', 10, 'change_order'),
(39, 'Can delete order', 10, 'delete_order'),
(40, 'Can view order', 10, 'view_order'),
(41, 'Can add new', 11, 'add_new'),
(42, 'Can change new', 11, 'change_new'),
(43, 'Can delete new', 11, 'delete_new'),
(44, 'Can view new', 11, 'view_new'),
(45, 'Can add item', 12, 'add_item'),
(46, 'Can change item', 12, 'change_item'),
(47, 'Can delete item', 12, 'delete_item'),
(48, 'Can view item', 12, 'view_item'),
(49, 'Can add hero', 13, 'add_hero'),
(50, 'Can change hero', 13, 'change_hero'),
(51, 'Can delete hero', 13, 'delete_hero'),
(52, 'Can view hero', 13, 'view_hero'),
(53, 'Can add customer', 14, 'add_customer'),
(54, 'Can change customer', 14, 'change_customer'),
(55, 'Can delete customer', 14, 'delete_customer'),
(56, 'Can view customer', 14, 'view_customer'),
(57, 'Can add cart product', 15, 'add_cartproduct'),
(58, 'Can change cart product', 15, 'change_cartproduct'),
(59, 'Can delete cart product', 15, 'delete_cartproduct'),
(60, 'Can view cart product', 15, 'view_cartproduct'),
(61, 'Can add staff', 16, 'add_staff'),
(62, 'Can change staff', 16, 'change_staff'),
(63, 'Can delete staff', 16, 'delete_staff'),
(64, 'Can view staff', 16, 'view_staff'),
(65, 'Can add log entry', 17, 'add_logentry'),
(66, 'Can change log entry', 17, 'change_logentry'),
(67, 'Can delete log entry', 17, 'delete_logentry'),
(68, 'Can view log entry', 17, 'view_logentry'),
(69, 'Can add permission', 18, 'add_permission'),
(70, 'Can change permission', 18, 'change_permission'),
(71, 'Can delete permission', 18, 'delete_permission'),
(72, 'Can view permission', 18, 'view_permission'),
(73, 'Can add group', 19, 'add_group'),
(74, 'Can change group', 19, 'change_group'),
(75, 'Can delete group', 19, 'delete_group'),
(76, 'Can view group', 19, 'view_group'),
(77, 'Can add user', 20, 'add_user'),
(78, 'Can change user', 20, 'change_user'),
(79, 'Can delete user', 20, 'delete_user'),
(80, 'Can view user', 20, 'view_user'),
(81, 'Can add content type', 21, 'add_contenttype'),
(82, 'Can change content type', 21, 'change_contenttype'),
(83, 'Can delete content type', 21, 'delete_contenttype'),
(84, 'Can view content type', 21, 'view_contenttype'),
(85, 'Can add session', 22, 'add_session'),
(86, 'Can change session', 22, 'change_session'),
(87, 'Can delete session', 22, 'delete_session'),
(88, 'Can view session', 22, 'view_session'),
(89, 'Can add comment', 23, 'add_comment'),
(90, 'Can change comment', 23, 'change_comment'),
(91, 'Can delete comment', 23, 'delete_comment'),
(92, 'Can view comment', 23, 'view_comment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$QUMOEmtXFUGBBfOV0HjWqo$qzqv2WNBKAMEfrG0YoYLZV0F7QfZSN8Bsl7k3Uq5foo=', '2021-05-18 07:09:18.915765', 1, 'eyemeed', '', '', 'johnleeyest@gmail.com', 1, 1, '2021-05-10 15:24:57.155835'),
(2, 'pbkdf2_sha256$260000$avMcoilqV3i0LdC2WxdBIP$vVGv2gG8CePa6vvgiHrJ2GQEwziGYCYeVMKoExpXC6A=', '2021-05-31 07:59:15.488913', 0, 'cuongai', '', '', '', 0, 1, '2021-05-11 02:56:43.048009'),
(3, 'pbkdf2_sha256$260000$X5zBHDkpZh1RV1SiAHG4hS$tHrIJkyiKOvwwP8KCCe620nC2kVmPl1uXmviE66i4go=', '2021-05-18 12:31:35.565647', 0, 'pyai', '', '', 'kimcuongpyai@gmail.com', 0, 1, '2021-05-11 03:06:38.600969');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-05-10 15:28:40.911665', '1', 'Biểu cảm', 1, '[{\"added\": {}}]', 2, 1),
(2, '2021-05-10 15:28:52.846768', '2', 'Hiệu ứng', 1, '[{\"added\": {}}]', 2, 1),
(3, '2021-05-10 15:29:15.781732', '3', 'Mắt', 1, '[{\"added\": {}}]', 2, 1),
(4, '2021-05-10 15:29:24.971353', '4', 'Bản đồ', 1, '[{\"added\": {}}]', 2, 1),
(5, '2021-05-10 15:29:34.321356', '5', 'Trang phục', 1, '[{\"added\": {}}]', 2, 1),
(6, '2021-05-10 15:31:08.864153', '1', 'Thường', 1, '[{\"added\": {}}]', 8, 1),
(7, '2021-05-10 15:32:36.781155', '2', 'Cao cấp', 1, '[{\"added\": {}}]', 8, 1),
(8, '2021-05-10 15:32:49.588458', '3', 'Hiếm có', 1, '[{\"added\": {}}]', 8, 1),
(9, '2021-05-10 15:32:57.585265', '4', 'Huyền thoại', 1, '[{\"added\": {}}]', 8, 1),
(10, '2021-05-10 15:33:15.196745', '5', 'Thần thánh', 1, '[{\"added\": {}}]', 8, 1),
(11, '2021-05-10 15:33:24.178825', '6', 'Bất diệt', 1, '[{\"added\": {}}]', 8, 1),
(12, '2021-05-10 15:38:53.246025', '1', 'Cú đêm', 1, '[{\"added\": {}}]', 9, 1),
(13, '2021-05-10 15:39:46.116256', '2', 'Lưỡi câu', 1, '[{\"added\": {}}]', 9, 1),
(14, '2021-05-10 15:40:52.149056', '3', 'Mùa xuân', 1, '[{\"added\": {}}]', 9, 1),
(15, '2021-05-10 15:41:27.636026', '4', 'Mùa hè', 1, '[{\"added\": {}}]', 9, 1),
(16, '2021-05-10 15:41:58.285054', '5', 'Mùa thu', 1, '[{\"added\": {}}]', 9, 1),
(17, '2021-05-10 15:42:50.274350', '6', 'Mùa đông', 1, '[{\"added\": {}}]', 9, 1),
(18, '2021-05-10 15:44:05.768039', '7', 'Ốc sên', 1, '[{\"added\": {}}]', 9, 1),
(19, '2021-05-10 15:44:34.388978', '8', 'Cây ăn thịt', 1, '[{\"added\": {}}]', 9, 1),
(20, '2021-05-10 15:45:00.578732', '9', 'Bù nhìn rơm', 1, '[{\"added\": {}}]', 9, 1),
(21, '2021-05-10 15:46:06.371688', '10', 'Mùa xuân', 1, '[{\"added\": {}}]', 9, 1),
(22, '2021-05-10 15:47:05.319262', '11', 'Mùa hè', 1, '[{\"added\": {}}]', 9, 1),
(23, '2021-05-10 15:47:33.068490', '12', 'Mùa thu', 1, '[{\"added\": {}}]', 9, 1),
(24, '2021-05-10 15:48:00.416840', '13', 'Mùa đông', 1, '[{\"added\": {}}]', 9, 1),
(25, '2021-05-10 15:49:25.281194', '14', 'Quỷ hề', 1, '[{\"added\": {}}]', 9, 1),
(26, '2021-05-10 15:50:08.266394', '15', 'Tượng rồng', 1, '[{\"added\": {}}]', 9, 1),
(27, '2021-05-10 15:51:21.144153', '16', 'Bí ẩn biển sâu', 1, '[{\"added\": {}}]', 9, 1),
(28, '2021-05-10 15:52:33.500448', '17', 'Giông bão', 1, '[{\"added\": {}}]', 9, 1),
(29, '2021-05-10 15:53:54.272612', '18', 'Halloween', 1, '[{\"added\": {}}]', 9, 1),
(30, '2021-05-10 15:54:53.013832', '19', 'Địa ngục', 1, '[{\"added\": {}}]', 9, 1),
(31, '2021-05-10 15:55:38.259210', '20', 'Cực quang', 1, '[{\"added\": {}}]', 9, 1),
(32, '2021-05-10 15:56:22.517954', '21', 'Song song', 1, '[{\"added\": {}}]', 9, 1),
(33, '2021-05-10 15:57:50.915588', '1', 'Trang bị rừng', 1, '[{\"added\": {}}]', 4, 1),
(34, '2021-05-10 15:58:16.542408', '2', 'Trang bị tấn công', 1, '[{\"added\": {}}]', 4, 1),
(35, '2021-05-10 16:04:43.442663', '3', 'Trang bị phòng thủ', 1, '[{\"added\": {}}]', 4, 1),
(36, '2021-05-10 16:05:08.170664', '4', 'Trang bị hỗ trợ', 1, '[{\"added\": {}}]', 4, 1),
(37, '2021-05-10 16:05:21.686311', '5', 'Trang bị bí ẩn', 1, '[{\"added\": {}}]', 4, 1),
(38, '2021-05-10 16:05:33.295461', '6', 'Trang bị cơ bản', 1, '[{\"added\": {}}]', 4, 1),
(39, '2021-05-10 16:05:55.553971', '7', 'Trang bị tiêu thụ', 1, '[{\"added\": {}}]', 4, 1),
(40, '2021-05-10 16:12:05.480193', '1', 'Bình máu', 1, '[{\"added\": {}}]', 12, 1),
(41, '2021-05-10 16:12:39.477479', '2', 'Bình năng lượng', 1, '[{\"added\": {}}]', 12, 1),
(42, '2021-05-10 16:13:54.911235', '3', 'Mắt soi sáng', 1, '[{\"added\": {}}]', 12, 1),
(43, '2021-05-10 16:14:55.893464', '4', 'Mắt quét', 1, '[{\"added\": {}}]', 12, 1),
(44, '2021-05-10 16:16:13.754177', '5', 'Huyết thạch', 1, '[{\"added\": {}}]', 12, 1),
(45, '2021-05-10 16:17:01.146425', '6', 'Giọt nước mắt nữ thần', 1, '[{\"added\": {}}]', 12, 1),
(46, '2021-05-10 16:18:26.755022', '7', 'Lọ pha lê', 1, '[{\"added\": {}}]', 12, 1),
(47, '2021-05-10 16:18:39.634910', '2', 'Bình năng lượng', 2, '[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]', 12, 1),
(48, '2021-05-10 16:20:10.406861', '8', 'Cuốn sách thế giới', 1, '[{\"added\": {}}]', 12, 1),
(49, '2021-05-10 16:21:13.893449', '9', 'Hòn đá ma thuật', 1, '[{\"added\": {}}]', 12, 1),
(50, '2021-05-10 16:22:48.917912', '10', 'Lọ sương mù', 1, '[{\"added\": {}}]', 12, 1),
(51, '2021-05-10 16:23:42.676451', '11', 'Bụi ma thuật', 1, '[{\"added\": {}}]', 12, 1),
(52, '2021-05-10 16:24:37.763226', '12', 'Rìu của tiều phu', 1, '[{\"added\": {}}]', 12, 1),
(53, '2021-05-10 16:25:26.937797', '13', 'Khiên gỗ', 1, '[{\"added\": {}}]', 12, 1),
(54, '2021-05-10 16:26:32.808801', '14', 'Kiếm cùn', 1, '[{\"added\": {}}]', 12, 1),
(55, '2021-05-10 16:27:05.502697', '15', 'Nhẫn của phù thủy tập sự', 1, '[{\"added\": {}}]', 12, 1),
(56, '2021-05-10 16:29:13.823304', '16', 'Đồng hồ sinh tử', 1, '[{\"added\": {}}]', 12, 1),
(57, '2021-05-10 16:31:06.122724', '17', 'Thanh kiếm bị nguyền rủa', 1, '[{\"added\": {}}]', 12, 1),
(58, '2021-05-10 16:32:34.683008', '1', 'Giải đấu', 1, '[{\"added\": {}}]', 5, 1),
(59, '2021-05-10 16:32:44.677773', '2', 'HighLights', 1, '[{\"added\": {}}]', 5, 1),
(60, '2021-05-10 16:32:53.233286', '3', 'Blog', 1, '[{\"added\": {}}]', 5, 1),
(61, '2021-05-10 16:33:03.031984', '4', 'Cập nhật', 1, '[{\"added\": {}}]', 5, 1),
(62, '2021-05-10 16:38:34.292887', '1', 'Miracle - Thần đồng mới nổi của làng Amin thế giới', 1, '[{\"added\": {}}]', 11, 1),
(63, '2021-05-10 16:39:51.461221', '2', 'Giải đấu Dreamleague season 1 chính thức khởi tranh', 1, '[{\"added\": {}}]', 11, 1),
(64, '2021-05-10 16:40:53.352495', '3', 'Lộ trình phát triển: Cập nhật lượng lớn anh hùng trong bản 1.0', 1, '[{\"added\": {}}]', 11, 1),
(65, '2021-05-10 16:41:24.979732', '4', 'Tiêu điểm anh hùng: Alvar - Erica', 1, '[{\"added\": {}}]', 11, 1),
(66, '2021-05-10 16:43:22.135946', '1', 'Fighter', 1, '[{\"added\": {}}]', 3, 1),
(67, '2021-05-10 16:43:43.249355', '2', 'Melee', 1, '[{\"added\": {}}]', 3, 1),
(68, '2021-05-10 16:43:55.379601', '3', 'Ranged', 1, '[{\"added\": {}}]', 3, 1),
(69, '2021-05-10 16:45:54.925177', '4', 'Carry', 1, '[{\"added\": {}}]', 3, 1),
(70, '2021-05-10 16:47:20.400421', '5', 'Support', 1, '[{\"added\": {}}]', 3, 1),
(71, '2021-05-10 16:48:37.535396', '6', 'Tanks', 1, '[{\"added\": {}}]', 3, 1),
(72, '2021-05-10 16:49:20.196726', '7', 'Assassin', 1, '[{\"added\": {}}]', 3, 1),
(73, '2021-05-10 16:50:25.341184', '8', 'Mage', 1, '[{\"added\": {}}]', 3, 1),
(74, '2021-05-10 16:52:07.367914', '9', 'Disabler', 1, '[{\"added\": {}}]', 3, 1),
(75, '2021-05-10 16:52:49.003240', '10', 'Initiator', 1, '[{\"added\": {}}]', 3, 1),
(76, '2021-05-10 16:54:02.051809', '11', 'Escape', 1, '[{\"added\": {}}]', 3, 1),
(77, '2021-05-10 16:54:29.128661', '12', 'Pusher', 1, '[{\"added\": {}}]', 3, 1),
(78, '2021-05-10 16:55:31.674345', '13', 'Jungle', 1, '[{\"added\": {}}]', 3, 1),
(79, '2021-05-10 16:56:42.833672', '1', 'Kiyoko', 1, '[{\"added\": {}}]', 7, 1),
(80, '2021-05-10 16:57:36.577323', '2', 'Waldo', 1, '[{\"added\": {}}]', 7, 1),
(81, '2021-05-10 16:58:34.633293', '3', 'Lucifer', 1, '[{\"added\": {}}]', 7, 1),
(82, '2021-05-10 16:59:43.998982', '4', 'Death', 1, '[{\"added\": {}}]', 7, 1),
(83, '2021-05-10 17:00:48.287099', '5', 'Alvar - Erica', 1, '[{\"added\": {}}]', 7, 1),
(84, '2021-05-11 01:42:11.960573', '1', 'Kiếm hồn', 1, '[{\"added\": {}}]', 6, 1),
(85, '2021-05-11 01:43:20.931640', '2', 'Cảm thụ không gian', 1, '[{\"added\": {}}]', 6, 1),
(86, '2021-05-11 01:45:09.923549', '3', 'Bước nhảy không gian', 1, '[{\"added\": {}}]', 6, 1),
(87, '2021-05-11 01:47:44.153862', '4', 'Bão năng lượng (Ultimate)', 1, '[{\"added\": {}}]', 6, 1),
(88, '2021-05-11 01:58:30.263711', '5', 'Cú nện tàn khốc', 1, '[{\"added\": {}}]', 6, 1),
(89, '2021-05-11 01:59:24.723281', '6', 'Dư chấn', 1, '[{\"added\": {}}]', 6, 1),
(90, '2021-05-11 02:00:10.242888', '7', 'Ý niệm của loài Orc', 1, '[{\"added\": {}}]', 6, 1),
(91, '2021-05-11 02:00:56.956273', '8', 'Cuồng bão rìu (Ultimate)', 1, '[{\"added\": {}}]', 6, 1),
(92, '2021-05-11 02:02:03.717063', '9', 'Thệ ước', 1, '[{\"added\": {}}]', 6, 1),
(93, '2021-05-11 02:02:50.538286', '10', 'Dịch chuyển', 1, '[{\"added\": {}}]', 6, 1),
(94, '2021-05-11 02:04:25.054700', '11', 'Thay đổi vũ khí (Alvar/Ultimate)', 1, '[{\"added\": {}}]', 6, 1),
(95, '2021-05-11 02:06:46.463961', '12', 'Đạn bóng tối (Alvar/Đánh xa)', 1, '[{\"added\": {}}]', 6, 1),
(96, '2021-05-11 02:07:38.019348', '13', 'Đại pháo hắc ám (Alvar/Đánh xa)', 1, '[{\"added\": {}}]', 6, 1),
(97, '2021-05-11 02:08:58.970599', '14', 'Liều lĩnh (Alvar/Cận chiến)', 1, '[{\"added\": {}}]', 6, 1),
(98, '2021-05-11 02:10:29.034720', '15', 'Liều lĩnh (Alvar/Cận chiến)', 1, '[{\"added\": {}}]', 6, 1),
(99, '2021-05-11 02:11:41.913945', '14', 'Giật lùi (Alvar/Đánh xa)', 2, '[{\"changed\": {\"fields\": [\"T\\u00ean\"]}}]', 6, 1),
(100, '2021-05-11 02:12:54.778361', '16', 'Bão kiếm (Alvar/Cận chiến)', 1, '[{\"added\": {}}]', 6, 1),
(101, '2021-05-11 02:14:04.282156', '17', 'Lướt (Alvar/cận chiến)', 1, '[{\"added\": {}}]', 6, 1),
(102, '2021-05-11 02:16:14.135941', '18', 'Vuốt quỷ (Erica)', 1, '[{\"added\": {}}]', 6, 1),
(103, '2021-05-11 02:17:10.264947', '19', 'Lửa đen (Erica)', 1, '[{\"added\": {}}]', 6, 1),
(104, '2021-05-11 02:18:14.549966', '20', 'Gai đen (Erica)', 1, '[{\"added\": {}}]', 6, 1),
(105, '2021-05-11 02:19:59.694039', '21', 'Lãnh địa của ác ma (Erica/Ultimate)', 1, '[{\"added\": {}}]', 6, 1),
(106, '2021-05-11 02:21:14.540094', '22', 'Quả cầu tối', 1, '[{\"added\": {}}]', 6, 1),
(107, '2021-05-11 02:21:56.658852', '23', 'Bộc phát', 1, '[{\"added\": {}}]', 6, 1),
(108, '2021-05-11 02:24:01.908934', '24', 'Lưới ma thuật', 1, '[{\"added\": {}}]', 6, 1),
(109, '2021-05-11 02:36:17.696451', '25', 'Kích tàn hắc ám', 1, '[{\"added\": {}}]', 6, 1),
(110, '2021-05-11 02:37:15.284703', '26', 'Hắc ám truy kích', 1, '[{\"added\": {}}]', 6, 1),
(111, '2021-05-11 02:38:13.540619', '27', 'Đôi cánh của tội lỗi (Ultimate)', 1, '[{\"added\": {}}]', 6, 1),
(112, '2021-05-11 02:39:12.093072', '28', 'Tử thần sinh mệnh', 1, '[{\"added\": {}}]', 6, 1),
(113, '2021-05-11 02:40:10.362725', '29', 'Tay của người chết', 1, '[{\"added\": {}}]', 6, 1),
(114, '2021-05-11 02:40:47.869236', '30', 'Kẻ ăn hồn', 1, '[{\"added\": {}}]', 6, 1),
(115, '2021-05-11 02:42:19.039226', '31', 'Lưỡi hái tử thần', 1, '[{\"added\": {}}]', 6, 1),
(116, '2021-05-11 02:47:27.048412', '1', 'Kiyoko', 1, '[{\"added\": {}}]', 13, 1),
(117, '2021-05-11 02:49:00.129042', '2', 'Waldo', 1, '[{\"added\": {}}]', 13, 1),
(118, '2021-05-11 02:50:22.193206', '3', 'Lucifer', 1, '[{\"added\": {}}]', 13, 1),
(119, '2021-05-11 02:52:54.543554', '4', 'Alvar - Erica', 1, '[{\"added\": {}}]', 13, 1),
(120, '2021-05-11 02:54:09.814170', '5', 'Death', 1, '[{\"added\": {}}]', 13, 1),
(121, '2021-05-11 02:56:43.573038', '2', 'cuongai', 1, '[{\"added\": {}}]', 20, 1),
(122, '2021-05-11 02:57:38.497116', '1', 'cuongai', 1, '[{\"added\": {}}]', 16, 1),
(123, '2021-05-12 02:42:13.454365', '22', 'Gói biểu cảm 1', 1, '[{\"added\": {}}]', 9, 1),
(124, '2021-05-12 02:43:20.263029', '23', 'Gói biểu cảm 2', 1, '[{\"added\": {}}]', 9, 1),
(125, '2021-05-12 02:43:49.632973', '24', 'Gói biểu cảm 3', 1, '[{\"added\": {}}]', 9, 1),
(126, '2021-05-12 02:47:12.111119', '25', 'Biểu tượng chuột 1', 1, '[{\"added\": {}}]', 9, 1),
(127, '2021-05-12 02:47:45.799425', '25', 'Con lăn 1', 2, '[{\"changed\": {\"fields\": [\"T\\u00ean\"]}}]', 9, 1),
(128, '2021-05-12 02:49:09.177185', '26', 'Con lăn 2', 1, '[{\"added\": {}}]', 9, 1),
(129, '2021-05-12 02:49:15.489694', '25', 'Con lăn 1', 2, '[{\"changed\": {\"fields\": [\"Gi\\u00e1\"]}}]', 9, 1),
(130, '2021-05-12 02:51:35.777096', '27', 'Sương đen', 1, '[{\"added\": {}}]', 9, 1),
(131, '2021-05-12 02:57:41.551102', '28', 'Ánh trăng mờ', 1, '[{\"added\": {}}]', 9, 1),
(132, '2021-05-12 02:59:59.340014', '29', 'Nắng vàng', 1, '[{\"added\": {}}]', 9, 1),
(133, '2021-05-12 03:11:03.511234', '30', 'Vực thẳm của bóng đêm', 1, '[{\"added\": {}}]', 9, 1),
(134, '2021-05-12 03:11:36.483601', '30', 'Vực thẳm tối', 2, '[{\"changed\": {\"fields\": [\"T\\u00ean\"]}}]', 9, 1),
(135, '2021-05-12 03:13:14.257808', '31', 'Đền cổ xưa', 1, '[{\"added\": {}}]', 9, 1),
(136, '2021-05-12 22:44:24.059890', '32', 'Gói biểu cảm 4', 1, '[{\"added\": {}}]', 9, 1),
(137, '2021-05-12 22:44:58.785696', '33', 'Gói biểu cảm 5', 1, '[{\"added\": {}}]', 9, 1),
(138, '2021-05-12 22:45:31.799436', '34', 'Gói biểu cảm 6', 1, '[{\"added\": {}}]', 9, 1),
(139, '2021-05-12 22:46:02.143350', '35', 'Gói biểu cảm 7', 1, '[{\"added\": {}}]', 9, 1),
(140, '2021-05-12 22:48:05.774079', '36', 'Con lăn 3', 1, '[{\"added\": {}}]', 9, 1),
(141, '2021-05-12 22:48:35.257100', '37', 'Con lăn 4', 1, '[{\"added\": {}}]', 9, 1),
(142, '2021-05-12 22:49:04.359600', '38', 'Con lăn 5', 1, '[{\"added\": {}}]', 9, 1),
(143, '2021-05-12 22:57:23.530716', '39', 'Phượng hoàng', 1, '[{\"added\": {}}]', 9, 1),
(144, '2021-05-12 22:58:37.973491', '40', 'Samurai', 1, '[{\"added\": {}}]', 9, 1),
(145, '2021-05-12 23:00:15.011507', '41', 'Bướm bướm', 1, '[{\"added\": {}}]', 9, 1),
(146, '2021-05-12 23:01:10.489194', '42', 'Thiên nhiên', 1, '[{\"added\": {}}]', 9, 1),
(147, '2021-05-12 23:03:12.395796', '43', 'Con lăn 6', 1, '[{\"added\": {}}]', 9, 1),
(148, '2021-05-12 23:03:52.403244', '44', 'Con lăn 7', 1, '[{\"added\": {}}]', 9, 1),
(149, '2021-05-12 23:05:38.145456', '45', 'Nước chảy', 1, '[{\"added\": {}}]', 9, 1),
(150, '2021-05-12 23:06:37.106773', '46', 'Lửa cháy', 1, '[{\"added\": {}}]', 9, 1),
(151, '2021-05-12 23:12:25.098038', '47', 'Lợn con dễ thương', 1, '[{\"added\": {}}]', 9, 1),
(152, '2021-05-12 23:13:24.595530', '48', 'Ếch đỏ', 1, '[{\"added\": {}}]', 9, 1),
(153, '2021-05-12 23:36:57.356190', '18', 'Nhẫn của nữ hoàng băng', 1, '[{\"added\": {}}]', 12, 1),
(154, '2021-05-12 23:45:14.986049', '19', 'Đá hoàn hồn', 1, '[{\"added\": {}}]', 12, 1),
(155, '2021-05-12 23:54:54.287686', '20', 'Bộ giáp sương đen', 1, '[{\"added\": {}}]', 12, 1),
(156, '2021-05-13 02:29:45.166567', '21', 'Nhẫn của Andvaranaut', 1, '[{\"added\": {}}]', 12, 1),
(157, '2021-05-13 02:34:49.117850', '22', 'Áo giáp lụa', 1, '[{\"added\": {}}]', 12, 1),
(158, '2021-05-13 02:40:31.658060', '23', 'Cây cung của ác ma', 1, '[{\"added\": {}}]', 12, 1),
(159, '2021-05-13 03:11:00.848182', '24', 'Thần kiếm Caladbolg', 1, '[{\"added\": {}}]', 12, 1),
(160, '2021-05-14 02:53:06.350599', '25', 'Áo choàng pháp sư', 1, '[{\"added\": {}}]', 12, 1),
(161, '2021-05-14 03:46:18.840888', '26', 'Trái tim của Satan', 1, '[{\"added\": {}}]', 12, 1),
(162, '2021-05-14 04:27:15.820503', '27', 'Tà kiếm Muramasas', 1, '[{\"added\": {}}]', 12, 1),
(163, '2021-05-14 04:42:42.667290', '28', 'Con mắt của sự thật', 1, '[{\"added\": {}}]', 12, 1),
(164, '2021-05-14 04:49:00.005348', '29', 'Quyền trượng khô lâu', 1, '[{\"added\": {}}]', 12, 1),
(165, '2021-05-14 04:55:02.803308', '30', 'Huyết thương', 1, '[{\"added\": {}}]', 12, 1),
(166, '2021-05-14 07:52:47.583225', '31', 'Cung tà ác', 1, '[{\"added\": {}}]', 12, 1),
(167, '2021-05-14 07:53:37.655926', '23', 'Cây cung của ác ma', 2, '[{\"changed\": {\"fields\": [\"Gi\\u00e1 ti\\u1ec1n\"]}}]', 12, 1),
(168, '2021-05-14 08:13:32.328923', '32', 'Mề đay tử chiến', 1, '[{\"added\": {}}]', 12, 1),
(169, '2021-05-14 08:19:35.611282', '33', 'Nọc độc', 1, '[{\"added\": {}}]', 12, 1),
(170, '2021-05-14 08:25:35.435054', '34', 'Đá nguyên thủy', 1, '[{\"added\": {}}]', 12, 1),
(171, '2021-05-14 08:40:04.181990', '35', 'Cuốn sách Goetia', 1, '[{\"added\": {}}]', 12, 1),
(172, '2021-05-14 13:11:06.092120', '36', 'Trường súng liên thanh', 1, '[{\"added\": {}}]', 12, 1),
(173, '2021-05-14 13:22:51.102521', '37', 'Nanh độc Hydra', 1, '[{\"added\": {}}]', 12, 1),
(174, '2021-05-14 13:28:40.932902', '38', 'Găng tay băng giá', 1, '[{\"added\": {}}]', 12, 1),
(175, '2021-05-14 13:52:07.199453', '39', 'Xiềng xích nô lệ', 1, '[{\"added\": {}}]', 12, 1),
(176, '2021-05-14 14:05:59.471992', '40', 'Dao rựa của thợ săn', 1, '[{\"added\": {}}]', 12, 1),
(177, '2021-05-14 16:30:08.107595', '41', 'Súng săn của thợ săn', 1, '[{\"added\": {}}]', 12, 1),
(178, '2021-05-14 16:31:20.089980', '41', 'Súng săn', 2, '[{\"changed\": {\"fields\": [\"T\\u00ean\", \"M\\u00e3\"]}}]', 12, 1),
(179, '2021-05-14 16:46:25.178896', '42', 'Giáp thống khổ', 1, '[{\"added\": {}}]', 12, 1),
(180, '2021-05-14 16:53:58.432213', '43', 'Vương miện máu', 1, '[{\"added\": {}}]', 12, 1),
(181, '2021-05-14 17:05:25.968791', '44', 'Mặt nạ ác quỷ', 1, '[{\"added\": {}}]', 12, 1),
(182, '2021-05-14 17:21:02.661869', '45', 'Lồng đèn ác thần', 1, '[{\"added\": {}}]', 12, 1),
(183, '2021-05-18 07:44:53.340095', '6', 'Baphomet', 1, '[{\"added\": {}}]', 7, 1),
(184, '2021-05-18 08:00:08.671342', '32', 'Săn mồi', 1, '[{\"added\": {}}]', 6, 1),
(185, '2021-05-18 08:05:55.437044', '33', 'Sức mạnh ác quỷ', 1, '[{\"added\": {}}]', 6, 1),
(186, '2021-05-18 08:12:50.764070', '34', 'Ngôi sao năm cánh ngược', 1, '[{\"added\": {}}]', 6, 1),
(187, '2021-05-18 08:17:09.605359', '35', 'Ăn tươi nuốt sống', 1, '[{\"added\": {}}]', 6, 1),
(188, '2021-05-18 08:19:28.953758', '6', 'Baphomet', 1, '[{\"added\": {}}]', 13, 1),
(189, '2021-05-18 08:20:07.015349', '34', 'Ngôi sao năm cánh ngược', 2, '[{\"changed\": {\"fields\": [\"\\u1ea2nh h\\u01b0\\u1edfng\"]}}]', 6, 1),
(190, '2021-05-18 08:46:27.883837', '5', 'Một ngày làm việc của Amin', 1, '[{\"added\": {}}]', 11, 1),
(191, '2021-05-18 08:55:37.728523', '5', 'Một ngày làm việc của Amin', 2, '[{\"changed\": {\"fields\": [\"M\\u00e3\", \"H\\u00ecnh \\u1ea3nh\"]}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(17, 'admin', 'logentry'),
(1, 'app', 'cart'),
(15, 'app', 'cartproduct'),
(2, 'app', 'category'),
(3, 'app', 'categoryhero'),
(4, 'app', 'categoryitem'),
(5, 'app', 'categorynew'),
(23, 'app', 'comment'),
(14, 'app', 'customer'),
(13, 'app', 'hero'),
(12, 'app', 'item'),
(11, 'app', 'new'),
(10, 'app', 'order'),
(9, 'app', 'product'),
(6, 'app', 'skill'),
(16, 'app', 'staff'),
(7, 'app', 'stat'),
(8, 'app', 'value'),
(19, 'auth', 'group'),
(18, 'auth', 'permission'),
(20, 'auth', 'user'),
(21, 'contenttypes', 'contenttype'),
(22, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-05-10 15:20:22.783475'),
(2, 'auth', '0001_initial', '2021-05-10 15:20:31.262932'),
(3, 'admin', '0001_initial', '2021-05-10 15:20:33.601629'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-05-10 15:20:33.645803'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-10 15:20:33.717167'),
(6, 'app', '0001_initial', '2021-05-10 15:20:53.835607'),
(7, 'app', '0002_auto_20210416_2009', '2021-05-10 15:20:53.930585'),
(8, 'app', '0003_auto_20210416_2143', '2021-05-10 15:20:54.038097'),
(9, 'app', '0004_auto_20210417_2101', '2021-05-10 15:20:54.085372'),
(10, 'app', '0005_auto_20210418_1334', '2021-05-10 15:20:54.122908'),
(11, 'app', '0006_auto_20210418_1449', '2021-05-10 15:20:54.172529'),
(12, 'app', '0007_staff', '2021-05-10 15:20:55.649914'),
(13, 'app', '0008_auto_20210423_0928', '2021-05-10 15:21:10.493815'),
(14, 'contenttypes', '0002_remove_content_type_name', '2021-05-10 15:21:11.297327'),
(15, 'auth', '0002_alter_permission_name_max_length', '2021-05-10 15:21:12.253376'),
(16, 'auth', '0003_alter_user_email_max_length', '2021-05-10 15:21:12.349266'),
(17, 'auth', '0004_alter_user_username_opts', '2021-05-10 15:21:12.394055'),
(18, 'auth', '0005_alter_user_last_login_null', '2021-05-10 15:21:12.947268'),
(19, 'auth', '0006_require_contenttypes_0002', '2021-05-10 15:21:12.992327'),
(20, 'auth', '0007_alter_validators_add_error_messages', '2021-05-10 15:21:13.025765'),
(21, 'auth', '0008_alter_user_username_max_length', '2021-05-10 15:21:13.167851'),
(22, 'auth', '0009_alter_user_last_name_max_length', '2021-05-10 15:21:13.284861'),
(23, 'auth', '0010_alter_group_name_max_length', '2021-05-10 15:21:13.394257'),
(24, 'auth', '0011_update_proxy_permissions', '2021-05-10 15:21:13.456132'),
(25, 'auth', '0012_alter_user_first_name_max_length', '2021-05-10 15:21:13.587911'),
(26, 'sessions', '0001_initial', '2021-05-10 15:21:14.596241'),
(27, 'app', '0009_comment', '2021-05-18 12:39:36.603416'),
(28, 'app', '0010_delete_comment', '2021-05-18 13:03:13.652908');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('qv2j6lsp6g5ds67siwn6y50dqsar5t5j', '.eJxVjEEOwiAQRe_C2hAGxQGX7nuGZmYAqRpISrsy3l2bdKHb_977LzXSupRx7Wkep6guyqrD78Ykj1Q3EO9Ub01Lq8s8sd4UvdOuhxbT87q7fweFevnWIATBEZzYOp_RCqHJjrLAGdFlC2SSJ88ULScDGCxyOHoU9CZAYPX-AOPDN6A:1lncpP:OOs3kWUjcTawV4GJ-QgaCtFP3D4dVCpBtjBO8yeVfOQ', '2021-06-14 07:59:15.611957'),
('vx8dyquazsk860dukgnaxzy6nsk5k367', '.eJxVjMsOwiAQAP-FsyG8hK5H7_0GArurVA1NSnsy_rsl6UGvM5N5i5i2tcSt8RInEhehxemX5YRPrl3QI9X7LHGu6zJl2RN52CbHmfh1Pdq_QUmt9K114D06pwcilRESQgbjTfBDtqgCKsWG9U7czds9AzqrkC0lcJZYfL7ATjcQ:1liBZ3:rThMT_87775sTVXPrZpI7DUytFzw1M-MWKliU0b6M5Y', '2021-05-30 07:51:53.550058');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_cart`
--
ALTER TABLE `app_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_cart_customer_id_88f45dc1_fk_app_customer_id` (`customer_id`);

--
-- Indexes for table `app_cartproduct`
--
ALTER TABLE `app_cartproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_cartproduct_cart_id_d83fb808_fk_app_cart_id` (`cart_id`),
  ADD KEY `app_cartproduct_product_id_e106e737_fk_app_product_id` (`product_id`);

--
-- Indexes for table `app_category`
--
ALTER TABLE `app_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `app_categoryhero`
--
ALTER TABLE `app_categoryhero`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `app_categoryitem`
--
ALTER TABLE `app_categoryitem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `app_categorynew`
--
ALTER TABLE `app_categorynew`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `app_customer`
--
ALTER TABLE `app_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `app_hero`
--
ALTER TABLE `app_hero`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `app_hero_stat_id_cd65144f_fk_app_stat_id` (`stat_id`);

--
-- Indexes for table `app_hero_categoryhero`
--
ALTER TABLE `app_hero_categoryhero`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_hero_categoryhero_hero_id_categoryhero_id_070b824b_uniq` (`hero_id`,`categoryhero_id`),
  ADD KEY `app_hero_categoryher_categoryhero_id_a0bcafd0_fk_app_categ` (`categoryhero_id`);

--
-- Indexes for table `app_hero_skill`
--
ALTER TABLE `app_hero_skill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_hero_skill_hero_id_skill_id_e39c58d4_uniq` (`hero_id`,`skill_id`),
  ADD KEY `app_hero_skill_skill_id_a8a8c636_fk_app_skill_id` (`skill_id`);

--
-- Indexes for table `app_item`
--
ALTER TABLE `app_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `app_item_categoryitem_id_de0a2bdf_fk_app_categoryitem_id` (`categoryitem_id`);

--
-- Indexes for table `app_new`
--
ALTER TABLE `app_new`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `app_new_categorynew_id_ec7b3776_fk_app_categorynew_id` (`categorynew_id`);

--
-- Indexes for table `app_order`
--
ALTER TABLE `app_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`);

--
-- Indexes for table `app_product`
--
ALTER TABLE `app_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `app_product_category_id_023742a5_fk_app_category_id` (`category_id`),
  ADD KEY `app_product_value_id_ae6baaf3_fk_app_value_id` (`value_id`);

--
-- Indexes for table `app_skill`
--
ALTER TABLE `app_skill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `app_staff`
--
ALTER TABLE `app_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `app_stat`
--
ALTER TABLE `app_stat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `app_value`
--
ALTER TABLE `app_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_cart`
--
ALTER TABLE `app_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `app_cartproduct`
--
ALTER TABLE `app_cartproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `app_category`
--
ALTER TABLE `app_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_categoryhero`
--
ALTER TABLE `app_categoryhero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `app_categoryitem`
--
ALTER TABLE `app_categoryitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `app_categorynew`
--
ALTER TABLE `app_categorynew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `app_customer`
--
ALTER TABLE `app_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_hero`
--
ALTER TABLE `app_hero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app_hero_categoryhero`
--
ALTER TABLE `app_hero_categoryhero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `app_hero_skill`
--
ALTER TABLE `app_hero_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `app_item`
--
ALTER TABLE `app_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `app_new`
--
ALTER TABLE `app_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_order`
--
ALTER TABLE `app_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_product`
--
ALTER TABLE `app_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `app_skill`
--
ALTER TABLE `app_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `app_staff`
--
ALTER TABLE `app_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_stat`
--
ALTER TABLE `app_stat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app_value`
--
ALTER TABLE `app_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_cart`
--
ALTER TABLE `app_cart`
  ADD CONSTRAINT `app_cart_customer_id_88f45dc1_fk_app_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `app_customer` (`id`);

--
-- Constraints for table `app_cartproduct`
--
ALTER TABLE `app_cartproduct`
  ADD CONSTRAINT `app_cartproduct_cart_id_d83fb808_fk_app_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `app_cart` (`id`),
  ADD CONSTRAINT `app_cartproduct_product_id_e106e737_fk_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`);

--
-- Constraints for table `app_customer`
--
ALTER TABLE `app_customer`
  ADD CONSTRAINT `app_customer_user_id_e6e52921_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `app_hero`
--
ALTER TABLE `app_hero`
  ADD CONSTRAINT `app_hero_stat_id_cd65144f_fk_app_stat_id` FOREIGN KEY (`stat_id`) REFERENCES `app_stat` (`id`);

--
-- Constraints for table `app_hero_categoryhero`
--
ALTER TABLE `app_hero_categoryhero`
  ADD CONSTRAINT `app_hero_categoryher_categoryhero_id_a0bcafd0_fk_app_categ` FOREIGN KEY (`categoryhero_id`) REFERENCES `app_categoryhero` (`id`),
  ADD CONSTRAINT `app_hero_categoryhero_hero_id_6af16818_fk_app_hero_id` FOREIGN KEY (`hero_id`) REFERENCES `app_hero` (`id`);

--
-- Constraints for table `app_hero_skill`
--
ALTER TABLE `app_hero_skill`
  ADD CONSTRAINT `app_hero_skill_hero_id_3e9354f4_fk_app_hero_id` FOREIGN KEY (`hero_id`) REFERENCES `app_hero` (`id`),
  ADD CONSTRAINT `app_hero_skill_skill_id_a8a8c636_fk_app_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `app_skill` (`id`);

--
-- Constraints for table `app_item`
--
ALTER TABLE `app_item`
  ADD CONSTRAINT `app_item_categoryitem_id_de0a2bdf_fk_app_categoryitem_id` FOREIGN KEY (`categoryitem_id`) REFERENCES `app_categoryitem` (`id`);

--
-- Constraints for table `app_new`
--
ALTER TABLE `app_new`
  ADD CONSTRAINT `app_new_categorynew_id_ec7b3776_fk_app_categorynew_id` FOREIGN KEY (`categorynew_id`) REFERENCES `app_categorynew` (`id`);

--
-- Constraints for table `app_order`
--
ALTER TABLE `app_order`
  ADD CONSTRAINT `app_order_cart_id_627d6d9c_fk_app_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `app_cart` (`id`);

--
-- Constraints for table `app_product`
--
ALTER TABLE `app_product`
  ADD CONSTRAINT `app_product_category_id_023742a5_fk_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `app_category` (`id`),
  ADD CONSTRAINT `app_product_value_id_ae6baaf3_fk_app_value_id` FOREIGN KEY (`value_id`) REFERENCES `app_value` (`id`);

--
-- Constraints for table `app_staff`
--
ALTER TABLE `app_staff`
  ADD CONSTRAINT `app_staff_user_id_1ebff06f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
