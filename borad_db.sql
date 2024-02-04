-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2023 at 04:31 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `borad`
--
CREATE DATABASE IF NOT EXISTS `borad` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `borad`;

-- --------------------------------------------------------

--
-- Table structure for table `announces`
--

CREATE TABLE `announces` (
  `announce_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announces`
--

INSERT INTO `announces` (`announce_id`, `user_id`, `title`, `content`, `publish_date`) VALUES
(1, 1, 'หาคนเข้าวงดนตรี', 'https://www.google.com/', '2023-10-17 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `cmt_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `img` blob NOT NULL,
  `datatime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`cmt_id`, `post_id`, `user_id`, `username`, `comment`, `img`, `datatime`) VALUES
(3, 4, 2, 'user2', 'ขอไปด้วยครับ', '', '2023-10-18 13:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `follow_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`follow_id`, `user_id`, `following_id`) VALUES
(2, 1, 2),
(3, 2, 1),
(4, 3, 1),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `highlights`
--

CREATE TABLE `highlights` (
  `highlight_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `highlights`
--

INSERT INTO `highlights` (`highlight_id`, `title`, `description`, `date_added`, `user_id`) VALUES
(2, 'เชิญชวนเข้าร่วมทำบุญ', 'https://www.figma.com/file/FVEXaMZVqzsIOVUORNv2ne/Projectmain?type=design&node-id=0-1&mode=design&t=MoAU6rv31NxjvQ2g-0', '2023-10-17 17:00:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `img_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`img_id`, `user_id`, `image`) VALUES
(1, 1, 0x89504e470d0a1a0a0000000d4948445200000060000000600806000000e2987738000000097048597300000b1300000b1301009a9c180000031149444154789cedddcb4b555114c7f1edc034b066865134282c0a1222a8a0fe8ccaa23f209a3a8d042705d1d8d272d82424ff82a41a6444448fa18d0a83ae48f6f09d7e6377d7a02032f3dcbdf6b9e7f7810b723cde73d65ee7b51f671b828888888888888888486680edc079e036f00ca801cbf6a9d9b261e01cb0cd7b7f9b06b01f1801e6f87771dd3b40b7f7fe9716b015b801acf0ffe2d9711d68f78ea754806ee00dc59900767ac7550ac011bba617ed3dd0e31d5f198efc5a030affd7247479c79925a01d7849e33d8ff717ef78b343fd869bca8077bc393e6aae244cc0575d8a7e4fc008e90dfa1d72f9d570e71c12f04d35e6f03301b179c14b6fa83aea6d3b5e8642d5516f44f33211aa0e98764cc0c75075c09263021643d5a104b82760daf10cd02508dd84ddcf8061c733e056a83aea7db85ece84aa033aac5920b5b8cd0eeff8b340bd033db561efb873eb095b4e58f8b1eeb1d73beeac501fbd90ca35ef7873ed929c4850f84f8036ef78b3047401ef1a58f853c02eef38b306f4d8e885a2c5c41ef68eaf14804ee051c1971d0d47d96012dae2e8854dd611e2d3ce555df3377f5f18dc6022e2ba437ad42cbec6dc1bdb6f80a7b125d38ef025fb392ebb099c550d57444444444444444464e36fce1cb57143fdc05d60dcde727c6bafb32edaa766cbe2ef1ed8bafdf6b7f13b3477c43a85dd0a1c07fa8031eb3a2cda947d779f6dabb5b26704d0021cb30e9771a777c4e66cdb03b62f2da102857ecadaec3f909f29dbb7934d950c6007701998a43c266d9f3b43590187ecfddf05ca6bc1864d1e0c6501ecb1fed8ef348f55e01eb02fe40ad8628f7ef1b1b0592d0257b27b82b2c154454eb094bbd7d90cf28a2f39388deff71627fc38ed5df8978035aa6b0db8e855f817ece65475abb1c9c3637e9f79efc833329f748a4ce0b177c4197a98aaf063555dfeec44b34f2f93bbc64f7f03bcf28e32632f522460d63bca8c7d4a9100f90b25c09912e04c0970a6043853022a90802fde41666c364502ee7b4799b1d114093800cc78479aa199642da2c06eeba4feec1d750662198cea3f3689888888888888884858c70f065339e0b2283e290000000049454e44ae426082),
(2, 2, 0x89504e470d0a1a0a0000000d4948445200000060000000600806000000e2987738000000097048597300000b1300000b1301009a9c180000035b49444154789ceddd4b6c8d4114c0f113f58a9d578462212256d81022f62416121142e2b1c746826021166a25285aaf858d48040bda051b76422d88b293786d3c2a94d226ed5f263dab06d1eabd73be39e797dca4e96defbd33f3dd6f66ce77663e91104208218410423008680056000780eb4027d005f4e923fdfc4c9f4b7fb31c1893fb73571e30073806bc65f8de004dc0ecdce5a81c603a700ee8e5ffa5d76801a6e52e5725009b814f8cbe8fc0a6dce5330b18075ca0f65ad37be52eaf29c024a09dfa694bef99bbdc968efc76eaef2e305ebca33ea79d3f6911cf802de4b7513c02a6021f72d7be8eb8fc0d51759c6fc519f124cd4e476992355ad267992b5e6878c19a26f12005c9344e634d8a373548e934aa69d532299d868badda2fa5036e60d735299d5e38b1eaa994ae46a1e6d1f2414a676cfc3fd44f295d344066710aca2c3ae1cc62189a99f189d83e299d264d59b5549c04e35e63cf2b37d9749ab166cd51f1c2e005999f40a378a2e98256348b37c0142317e53fbabc289f009b72d73eb0413c6330573397d3e21d838b2f6e66a8fcdbc0d8dce5b7949cdb56c7cabf15c9b9bf4fd26da943e59f8e23ffefdf868d351a1dbd77dfe10e336ff48c4e90fe577a8de634ec1de119d22fa051c31623891da5ff39ea6e865bc300deb294b793524752f6825e59ebd547faf9893eb72f4535dd04d6420821841042080158ac53ffe7c037aaef9b96e514b0c86c0b031381f3403fe5ead70b4813c460e5dfc78f7ba61a418f7c6f5ac5d039bfe4d3ce9ff49be813b4c3f5ea84850678815f9d161aa01bbfba2d34806b921bce496e3827b9013df8f5dd42038c645be152bcb6d0001df8d591bbfead2db4f0178e00b6e2d7760b0d3019f8813f7dc00cb100b8823fd7c40a6089b388e800b0522c012ee1c755317ad70b0f73824f663779d57d2052e754aa7e608d58066c2bb43f1800764915003b0a6b840160a75449faaaeafdbdaaee6b65d79601f3814754d76360a114b0107bb71e4955ca86db53d47256602670d278d8a207386e26c4500bc02ce008f00e3bd28aca434557fc50e9eb0dac052e039f336d53731158ede2be01ffb04dc12ae0b0e65dd6a2bf488d7c0738a813c672ceef355a17bc00580fecd51bfea4cd3c1eeae67a5d431ae98bfeee25f040774239ab1de93a605eee328510420821841082a85f8a273a9fd661a8570000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `num_phone` int(10) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `introduce` text DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `first_name`, `last_name`, `nick_name`, `num_phone`, `gender`, `introduce`, `birthday`) VALUES
(1, 'user1', 'user1', 'user1', 639352410, 'male', 'สวัสดี', '2002-10-11'),
(2, 'user2', 'user2', 'user2', 99999999, 'male', 'สวัสดี', '2004-10-14'),
(3, 'user3', 'user3', 'user3', 987654321, 'male', 'สวัสดี', '2023-10-24'),
(4, 'user4', 'user4', 'user4', 639352410, 'male', 'สวัสดี', '2002-10-11'),
(5, 'user5', 'user5', 'user5', 987654321, 'male', NULL, '2023-10-18');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `borad` text NOT NULL,
  `num_chip` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25') NOT NULL,
  `choice` enum('พูดคุย','วิ่ง','คำถาม','กิจกรรมทางศาสนา','แต่งกายและแฟชัน','แต่งหน้าและความงาม','การถ่ายรูป','ว่ายน้ำ','เล่นหมากรุก','ปั่นจักรยาน','งานอาสาสมัคร','คอนเสิร์ตและงานแสดงสด','ทำอาหาร','E-sports','ปิงปอง','ฟิตเนส','อ่านหนังสือ','นิยาย','เตรียมสอบ','ฟุตบอล','แบดมินตัน','เทนนิส','บทความ','บล็อก','บาสเกตบอล','วอลเลย์บอล') NOT NULL,
  `img` blob NOT NULL,
  `datatime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `username`, `title`, `borad`, `num_chip`, `choice`, `img`, `datatime`) VALUES
(4, 1, 'user1', 'วิ่งเอาบรรยากาศ', 'หาเพื่อนวิ่งที่ 4 เเยกสะดือมอครับ', '5', 'วิ่ง', 0x89504e470d0a1a0a0000000d4948445200000080000000800806000000c33e61cb000000097048597300000ec400000ec401952b0e1b0000093349444154789ced9d7fa81c5715c7bf77591e8f20e111cbe3212184108288d4584a0921d422a1888826c182a445db108b9420258856298296528aa294504b51a912422935d45f50448a06a9d2c618eaa3b6b18d62427dd858db9a68fa926c3efe7176c9bad99dd99d99bb33f3e67c202484997bcfdcf9ceb9e7de736656721cc7711cc7711ca75984b20d9836404bd20e49b74ada26698da4b6a4df4afa6c08e14f19da9c91745d91768ec15b218497a7dc677d01047c147881d12c03f701b313b43b033c95d0662c9681dd31c76cc5006c067e39c1e09e006e02c6697b57849b3b2e678177e5199b569e93ab0e300f3c2ae9a8a4ed139cba49d23392be0f5c9372ec7bb2da570033791b58910200dac03e492f49ba5336c74f4a4bd21e498bc06e2c7618755c6da9b5f18360f3fc36d9137f4016e0e56541d221494f03ef2da0bd4ab16204002c487a4cd211499b237471b3a4635890b82a42fba5507b0174ddfd5d925e9474bbe25ed32a49f7caa6851ddd6961ec154315a9ed3e0016a16f91f490a41b4a32e3d732016c29a9ff0b92de1d423897b5815a0aa01b99df2769afb205782b85dc02a8d5e0755dee6e490faadce5d78aa13602e846e00fc98231a7202a2f806ec4bd5fd29724e5daf51ac2e5eedfb50f86b352d90befaee96f92f49c6cbe2ffae6ff45d22724dd22e954c16d3b7900ae01be0b5c8cb07f7e1ef806b0baafbf39e0e148fdc564999cb9804a01b4804f01af451ab0678191695b602b703c52df315839020036023f033a1106ea0de02e2035e60166817bb04c5bd5a9bf00b001df0fbc1d61803ac093c0ba0c766d027e411c4116457d058005793700cf451a9c57808f33464e3fc1c616f0696029928d79a9a70080d55820763ec2a05c15e48db0a18da57977313ad5db3b7601f821d50b12eb2500ec89fa0856711383c420afcf8e6b8167bae774b0d86353ca398a6c7b16ea2300e23e4567b0202fb1420658037c9be19ee72cf0555252bd98f77a60441bd3a6fa02c09efaddc459da5d049e00d6a6d8d0066e1fd38697b0e2d1b469e13acce39449b505006c007e429c48fa04f03152823ce07ae0c8846d77306125ae1eb08ae07dd832b30caa2980c803f31fcc05a70579f3d8eede728ebede00ee26a54c1c58872d37a7bd64ac9e0080f733f913372e4780c4722f4c7c7b2976e9760cb891046f834d753b809305f69b46750400acc282a8183b686780cf911ee46d21debcbc8ce527e6536c98c302cd3c9e67129bca1500b63cfa30b018e1022f0207490ff2e6814798cea02f017b48d856c6c6642b7034b22de50a005bda3d469ca5dd8bc0cd24bbdd367633cad8a9fb15e9d3d12cf005e0cd4836942300e2ccb33dce02f7a65d1816ddff2642ff93d0db759c4bb175237156431de02ba404c48581b9b62dc419f80e90faf205562b70806a6cc4f438c99532f15176b7804f027f8bd0ff69e0f3c4f406c05accddc798674f639b4549f36a1b4bcc9c8ed07f1174b0b78437a48ce31a4cc031c6f124b6e195fb9dc17e8357616e26c63cb68c0d46e20b985cd9bbaf726ab6c79bc01749d83b207e90780cd84e8e4c68cfc8ed58301683df61d349920dab8107b1cd9fba719c9457ccb9520b11e3e1ba083c0e4c5e3e8fad651f255ee2661f096e8a2b9b2aaf44e87f9a2c63d3e642ca786f000e13c7c3fd039b3ac72b00c68a3462a43c2f0287485fd36fc0e6d23ab8fb7159c2564d49314e0bcb6dc4107d071bfbd1ab15cce5ef218ebb5dc4d6f44951724c7758053a8cb7951d73da5b64d82a0bbbf9f750fc53f736b6a64fcbb16fc5029726306e326b33b6d954344bc0f5839deda5d89bdfc1363e36a65c64cc2551d53981d51d248d4fac9dce33c0fb7a9daca7587773022bc64cdb14d905fcb5c07eeb482fd7911624ce634179910fca2230232c8357046781af91be85bb967272e7556609dbc0497a6862ec1ddc266cf991879ebb4f2baa6c037762eec7b99a0ef61e42da38ce60f58f458ce3c196ecb327597955d24e493b43087f4e307a93a4a7253d2229edb36b4da5257bf5fd28b69338749f2484702184f01d491f90f403499772f4b9d092f4cf0c279e93f475491f0c21fc34847079d8415db5eed795eff455f66de40ab15af6018c67198cd6fb0821fc5dd21d923e24e9f98c7dfd4b5816691237759894e85eb20f3a507ebab6ee9c07ee277d19dd4bcf4f5a797d5b2f281b27ba7c01cb0da4954bb7b1adde18effa359545ecfb87690fdd1ce36f223d49ef5e6273cea8a8fc35c6a8c7ebb6b30ecbe97b845f3ccb58f1496acc8615a01c64782e6719f32aedfe13046cc36ae14f634fef716c6b36b5daa47bfe2e2cf1e0c46511d83ae63db916cb019cc1720c0f33b0157cd567e23065b4255d1815dc0d1c3f2b0b5af6c983bc697141d23725dd1f42f86fdac198f7be1c42b86ac590eb3b81d80ed613926eccd38e93993f4aba2384f087ac0d64160096d57a4ad2faac6d3885f0e310c2ceac27e771d9b7c86f7eedf139bbe1b8001a8e0ba0e1b8001a8e0ba0fee4fadeb30ba0fee4ba872e8086e30268382e8086e30268382e8086e30268382e8086e30268382e8086e30268382e8086e302a83fb9be08e602a83f9e0c72b25385df0ebe24ab731f6412718e3a36a98dd6887f4f4aafd6beff1d8a61ef53a4be6331c49656f74fb4fb5405017c4fd29707fe6f928b6e6bf40d1c353ff69fb35dd28131fb1ae45649bf9789e0b2fe5f0c832f61f48e4962f0ba6724cd4a9a93744852e2b703b2500501bc134278abacce075f959a804b929e0f21bc5aa43da3004e2982003c0618df350f3bef9d220d49214a5f2e80e1f1c7385cce716ed6fe0ac705909d61f37c4ca2f4e502a80f2e800a12c52d4f13174076a63d0544c10530dd483e0f3e05349c5102f06450c3f16490931d1740c37101d427088c820ba0e1b8001a8e0ba0e1b800eac3c85f22cd830b60ba29ddcae102c89ed0895aab372d5c00f998e6f845e9cb05501f8afb49f83e5c00f9a6802837659ab800b20781d31680af022a465b53fa093cece765137f90332bb58f624ba425e930f0bacc8bf457095f52be028ed9bebfdb92e635fad3fcb9bc900b201feb55fe6f26783d404e6a5fd7970717800bc069322e8086e302f029a0f1b8009ce6e202700fd0785c000dc72b821a4eed5ff1ce830bc03d40e399f6b77e2a45e305104290a47f976d4759e411c0d9826c3857503b7978bd6c0372906bfcf208e05b927e94a773493f97f440ce368ae0f1b20dc8c829499f29db08c7711cc7711cc771eac4ff00ad9d2fbfbc4dfc180000000049454e44ae426082, '2023-10-18 15:24:50'),
(6, 2, 'user2', 'อ่านชิวๆ ที่ห้องสมุด', 'หาเพื่อนอ่านหนังสือสอบ', '3', 'อ่านหนังสือ', 0x89504e470d0a1a0a0000000d4948445200000080000000800806000000c33e61cb000000097048597300000ec400000ec401952b0e1b00000b8749444154789ced9d6d885ec515c7ff1342084b48974416110921a6218a488856da20360dad6ca55a11493fb4685189d6aaad8d7db1484b9120f960255848ad2d06350629d686da446b53152d56534db52f26956435b6d14413f3b6c9c6cdeeaf1fce7deabafbec3ecfbd77e6be3c3b3fb8ec66b33bf73c73ce9d3b73e69c334e91c200a64a5a22e9424967483a25f9afc392de94f49ca4679c7303a5081809033015f81af02aad791bf80ed055b6dc110f00738027db50fc68b60167972d7f2407c042a02f83f21b7c002c2dfb734432009c9a53f9238d208e04750210b0d183f21b6c03a697fdb9226d02f47a547e831bcbfe5c913601b60430809dc034dfb24ef1dde064079823e982004dcf9374beef46a301f8e77c49de9fd48465be1b8c06e09fb302b67da6ef06a301f86776c0b667f96e301a807f86ebd4763400ffec0dd8f6bbbe1b8c06e09fbf056cfb55df0d4603f0cf4b928e066afb0fbe1b8c06e019e7dc0149bf0dd0f45f246d0fd06ec437c02260d0a3177008b83c84ac2e44a365022c96749da4b9920624fd4bd25649af48daed9c0b394b1f29c71a49377b6aee09499738e74e7a6aaff300ba80bb5a3c797bb1e08c3b804b81d3b030ad10f24c079ef6f0f4f701a78690b1630016002f66e8dc41e00de011e056e002a0dba35ca7e434829dc0425ff27424c0722c68c21747809781b5c0d7b1a89e3cf2750177937e4ef018d0e3b1ab3a0b6c885d834d9042f31ef07be0766019d04d4aa3c02686eb81fe09ee73021b312e0ad46d63a8e524109827e941598875191c934dcc6e73cefd3bcd1f02a7c9b68be74bfa846c297e48d26e49cf4bdae55c2dd5520cc0c5d864ae0a1c017e4080408dc8288069d8ecdde7fada172f63cbcf4808801e6073c94a6ec5716c8e1083377d029c8f2d87eac256e09cb2fbadf6005380154c3c6bae2ac781ef11e706d9006600f795ab432f3c0b2c28bb3f27a272eb0d2caaf611499ff6d4e4b0caddf53c28e91649ebaab8bcab9444581edc06493e7cdf6f4aba4bd243b258bac592ce9545ed2e963453c519c6b0a487257dc339172a56a0be60a9542bb077675ede48da1a77368e2d29170337001bb00d972296976b8becd75a804df65691dfa5fb162d143f810c5381f9c0b7096b08c7314f6044fabff2d7e6ecd477809bf1505001f3ea85e64e1f7d577bb0617f558e8edc8f395e667a926721c52c39f7e271cbb9b60017926db8edc7023fbc6d9562af80a7bda9b835933bd3177bfa9f4ad9692730dfc0dc00f2dce85bc32dd8c1647612618e9e769ffe13d83e7a10870a36f93b1446cf131224c8b31660a152ad18c49668e7902322a7851c530893cbdf0ecf86fa5c9527e9f8ade374cc71e041e0ecd01d045c5f8cae9b32049c17f4035619601eb6c57b28b9b661b3fad30bba7f5943ff48d617f15927a2745730b68c9b22e96051be722c147cb3a4cf1772c3f1199074a673eecdb204283d35cc3977d8395798f21356a87ce54bd27459124b69943e02140d305fd2364933ca9625619fa44f3ae70e9771f3d24780224986fe7b551de54b528fa42bcbbaf9a4320049d72b40a1250fdc44a014b5564c1a03c01c49ab0ab8d531496993381748ba34802c2d991406903c5df7c9824042322c8bfe7938c3dfae0426853e0a07dbe72f822dd8c6d242d2c7370c01210a4c4e6e12651cf1ace8661cc156188dfbfe3a431bbf63b2ba874340b1dbbcb78ebaf712d28f0283c0a2b2faabe3c062fe8a602ba3b677b1fd8ee732b4f51496495cc852b5631d415806f136859ff80d48faac73eea526325c2ee9d18ced0ecbaa8dbd2f7316ed4bbe7f57568b70dfa8eba8a40fd39691e94803c066d39b25159167ff53e7dcca71e49826abed17baca47c3580eca0c648fa45d92fe2ee94fceb9dd81ef5f2d806b29a670441f2d62122977cb196c7b7d2de3bc523a6e04c0328bb6294061e5510c4bfab273eef116f24c97d4273fc92e79785c5669ec633fec28c70336f4af5178e54b560c7253ab5f4a0e815c135e9c967c49d29cd13fec28039074998a71a91e90b43245cdc15fc8267065332629a5630c004b0cb95bc57ca61fa709e248cac7963d0a0c484a55cfa85660696145f0021976ee809958de62190c02beaa96560fcce3d7ceb9bc7939418e5a40985bfaad02e46cd08fb99797318e8bb9943de8009c9d5ca1f99973ee95ac7fec9cdb0e7c46d2fd6acf47313ce2ebf0a87f1f93adfd1bebff033287d01ed9aa63bba47fb44a47ef1403e855f877ff2e4977e46dc439b707f8a22c2671a6a40f93ebe488af2747fd7c20f97ea0f1bdafa2d79d62009f0adcfeb0a4ef3ae70efa682c519ef7c31fb2d029ab8031eb5bcf6c92f49bc0f72885da1b4032b909599befa8a46f55b1be8f0f6a6f0089620e04bcc56ae7dcae80ed974aed0d2021f3ccbc054725ad0bd47625e81403784c610e6c9c21690be0fdd0e68847b0e89b3f0774a81c275605af3658d9b713018d002ca77f5ed99f35320e58b5b0d081208780ab8931fcd5037b15dc5980110c011b29a896416404ad3a3d3182ab29aee4db72622c7f3160c7baeda48dda80d8ce5b96b0ecb40c61b58c4e29a20f262dd8495d8dfdf4f5b4f10ec6b6896fc08a4a86e62da097381a84012b1c359255ed7636703af06801463008dc8387b2b591116007388e6608f8610a23107019c50464fc937888941fb077f97827830e6195c5d2b4370bf815e1cbc3f7138f8dc907763ae80b2d3a7a085bfab5bd2ec746835e2cb123345b88cbc56c248a6d97fb4979560016a8792fe14783f7b0d3ca437555e7012ccda098a74879d43a1f8d06a18fa61b04ae0fd55f1d05564bb82f6347f7011766b86737568d3ca417f104152b0f1b24cc051beaa68eb8ba64e95add4dbece6ef2f35325e571ac7c28e91ae7dc4319e4ee95b456d2dc1cf79f8867247dae2a11466d0785269dd39d5c3db234a31e99a266cb14d7b8ba6511af3392abe899f034a5afd4d5882e7a02385776e2d895f21f33b144d23c599471b5c1eafa5f8dd5bbd981ed8455f1f0e6d16c26e76e1d1ff90dfe1b40be2b7ce92818d8c4e8ed001f3e341fe071cf1e3bb8fa11fcce0daef5255f5e9a3e2540af2cccaa8eebd7effb0ce274ceed93f4154957c95f866fc820d6548c99896043e70e49f3c7fe7ae5d9242b8210223eb051776883ecf4d1ac1c941587ae42ba78d31160a1eaa9fc7d92ae0ba57c494a46968d399b595715e54bcd0da08ebeeb6149df74cefda7807b5d92e36f0764ab8bcad0cc00b6ab1ad52cd2b04e05a46e6105a7f338721e28c848db668c0124356d7e52822c59d92ee9969043ff08ae52f684da6392567b94251c585cdd8f081f669d977e0ada77c74e1cefcb216bfd4e0e07cec3c2af8a08a94acb10b0a2c0beb83887acfd54349f60c2e1cc39f757495fc5b659cf92b448d21932ffc0e93257708fcced3b55f64a29225efea4a4db64d5b78283b9c1f31ceef44055134cbdec48604593466ee8748ff8f72c35df2be896a5754f97ad3cda597d0c4b7a4dd24dceb9e77dc8de0ed879c53b946d8534205bf7576af2d7c04b8590a440f1fb4ab17ae0a3bcfeaee4eb0c9951343690ba92abd1e9876513bed7d21644f6c095cabe3cfe6555951f69032cb43c6b20e9112a1e0e16f3db5ad3b4c46a9bfc3c3efd3506db12de9cf1e9df4fcaf0b448c5001690dd1792bba45ca46480d5399efeeeb2e58fe400cb49c81a10737bd9f24772025c9151f9efd046f672a4e290fdb8b9ceadca3d5920dbc99f60c925b5ca0c8e7e80e65ca36c7db3ca3977ccb730910201ba92f7785a5ea7a423e0231ec16afe646179d9b247728279fe9ecca0fc17e3d3df0100f3499ff934041471426910e224f0e36489f9fb637245ea0cd9b67d078985a43b032c17322d1bca963be2092cf8350dc7b13c8148ddc1d2e0d3463edf53b6dc114f0017a554fe7e60cc39bc7524ae028c2fa4fcfdd5ceb93d412489140fe98a4ad76ec327320158ca579a323097972d73c4235879b876bd7feb89c51e3b0bac76703b7bff6f10cf04e83cb0d8bfbd2d947f085854b6ac914030b113e810b0b46c19230101e6d17c1fe0752a56dad537d5a8575a01801e492b6515c08e4ada2c2be8d4d1215eff03632064c4ac056b490000000049454e44ae426082, '2023-10-18 15:25:14');

-- --------------------------------------------------------

--
-- Table structure for table `supprots`
--

CREATE TABLE `supprots` (
  `support_id` int(11) NOT NULL,
  `support_ticket_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `supject` varchar(255) NOT NULL,
  `reslution` varchar(255) NOT NULL,
  `image` blob NOT NULL,
  `comment` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `member_id`, `username`, `password`) VALUES
(1, 1, 'user1', '12345'),
(2, 2, 'user2', '12345'),
(3, 3, 'user3', '12345'),
(4, 4, 'user4', '12345'),
(5, 5, 'user5', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announces`
--
ALTER TABLE `announces`
  ADD PRIMARY KEY (`announce_id`,`user_id`) USING BTREE,
  ADD UNIQUE KEY `author` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`cmt_id`,`post_id`,`user_id`,`username`) USING BTREE,
  ADD UNIQUE KEY `post_id` (`post_id`),
  ADD UNIQUE KEY `acc_id` (`user_id`,`username`) USING BTREE;

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`follow_id`,`user_id`,`following_id`) USING BTREE,
  ADD UNIQUE KEY `user_id` (`user_id`,`following_id`) USING BTREE,
  ADD KEY `follows_ibfk_2` (`following_id`);

--
-- Indexes for table `highlights`
--
ALTER TABLE `highlights`
  ADD PRIMARY KEY (`highlight_id`,`user_id`) USING BTREE,
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`,`user_id`),
  ADD KEY `images_ibfk_1` (`user_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`) USING BTREE,
  ADD UNIQUE KEY `id` (`member_id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`,`user_id`,`username`) USING BTREE,
  ADD UNIQUE KEY `acc_id` (`user_id`,`username`) USING BTREE;

--
-- Indexes for table `supprots`
--
ALTER TABLE `supprots`
  ADD PRIMARY KEY (`support_id`,`support_ticket_id`,`email`) USING BTREE,
  ADD UNIQUE KEY `support_ticket_id` (`support_ticket_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`,`username`,`member_id`) USING BTREE,
  ADD UNIQUE KEY `member_id` (`member_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announces`
--
ALTER TABLE `announces`
  MODIFY `announce_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `highlights`
--
ALTER TABLE `highlights`
  MODIFY `highlight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supprots`
--
ALTER TABLE `supprots`
  MODIFY `support_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announces`
--
ALTER TABLE `announces`
  ADD CONSTRAINT `announces_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`,`username`) REFERENCES `users` (`user_id`, `username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`following_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `highlights`
--
ALTER TABLE `highlights`
  ADD CONSTRAINT `highlights_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`,`username`) REFERENCES `users` (`user_id`, `username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supprots`
--
ALTER TABLE `supprots`
  ADD CONSTRAINT `supprots_ibfk_1` FOREIGN KEY (`support_ticket_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
