-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2025-07-26 04:49:12
-- 服务器版本： 10.4.33-MariaDB-log
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `patch_management`
--

-- --------------------------------------------------------

--
-- 表的结构 `patches`
--

CREATE TABLE `patches` (
  `id` int(11) NOT NULL,
  `hostname` varchar(200) NOT NULL,
  `ip_address` varchar(200) NOT NULL,
  `mac_address` varchar(200) NOT NULL,
  `patch_num` text NOT NULL,
  `timestamp` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `patchinfo`
--

CREATE TABLE `patchinfo` (
  `id` int(11) NOT NULL,
  `patch_num` text NOT NULL,
  `patch_level` text NOT NULL,
  `patch_descri` text DEFAULT NULL,
  `patch_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `patchinfo`
--

INSERT INTO `patchinfo` (`id`, `patch_num`, `patch_level`, `patch_descri`, `patch_time`) VALUES
(2, 'KB5049981', '高危漏洞补丁', '现已确认 Microsoft 软件产品中存在可能会影响您的系统的安全问题。您可以通过安装本 Microsoft 更新程序来保护您的系统不受侵害。有关本更新程序中所含问题的完整列表，请参阅相关 Microsoft 知识库文章。安装本更新程序之后，可能需要重新启动系统。', '2025-01-14'),
(3, 'KB5050021', '高危漏洞补丁', '现已确认 Microsoft 软件产品中存在可能会影响您的系统的安全问题。您可以通过安装本 Microsoft 更新程序来保护您的系统不受侵害。有关本更新程序中所含问题的完整列表，请参阅相关 Microsoft 知识库文章。安装本更新程序之后，可能需要重新启动系统。', '2025-01-14'),
(4, 'KB5050109', '高危漏洞补丁', '安装本更新程序可解决 Windows 中的问题。有关此更新程序中所含问题的完整列表，请参阅相关 Microsoft 知识库文章获取详细信息。安装本更新程序之后，可能必须重新启动计算机。', '2025-01-14'),
(5, 'KB5049613', '高危漏洞补丁', NULL, '2025-01-14'),
(6, 'KB5049615', '高危漏洞补丁', NULL, '2025-01-14'),
(7, 'KB5049621', '高危漏洞补丁', NULL, '2025-01-14'),
(8, 'KB5049622', '高危漏洞补丁', NULL, '2025-01-14'),
(9, 'KB5049624', '高危漏洞补丁', NULL, '2025-01-14'),
(10, 'KB5050009', '高危漏洞补丁', NULL, '2025-01-14'),
(11, 'KB5050387', '高危漏洞补丁', NULL, '2025-01-14'),
(12, 'KB5050113', '高危漏洞补丁', NULL, '2025-01-14'),
(13, 'KB5050108', '高危漏洞补丁', NULL, '2025-01-14'),
(15, 'KB5052093', '高危漏洞补丁', '高危漏洞补丁', '2025-02-25'),
(16, 'KB5052915', '高危漏洞补丁', '高危漏洞补丁', '2025-02-25'),
(17, 'KB5051987', '高危漏洞补丁', '高危漏洞补丁', '2025-02-11'),
(18, 'KB5052085', '高危漏洞补丁', '高危漏洞补丁', '2025-02-11'),
(19, 'KB5051989', '高危漏洞补丁', '高危漏洞补丁', '2025-02-11'),
(20, 'KB5053488', '高危漏洞补丁', '高危漏洞补丁', '2025-02-11'),
(21, 'KB5050577', '高危漏洞补丁', '高危漏洞补丁', '2025-01-28'),
(22, 'KB5060842', '高危漏洞', '高危漏洞', '2025-06-10'),
(23, 'KB5059502', '高危漏洞', '高危', '2025-06-10'),
(24, 'KB5054979', '高危漏洞', '高危', '2025-04-08'),
(25, 'KB5063060', '高危漏洞', '高危', '2025-06-10'),
(26, 'KB5058523', '高危漏洞', '高危', '2025-05-13'),
(27, 'KB5056579', '高危漏洞', '高危', '2025-04-25'),
(28, 'KB5058538', '高危漏洞', '高危', '2025-04-17'),
(29, 'KB5062553', '高危漏洞', '高危', '2025-07-08'),
(30, 'KB5063666', '高危漏洞', '高危', '2025-07-08'),
(31, 'KB5062862', '高危漏洞', '高危', '2025-06-26');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(7, 'patch', '$2y$10$wNRjCe768ByPDrhxzo730uXdFQe/2.MDaJZOmISMTa1BvIRigzf1u', 'user', '2025-07-25 20:48:36');

--
-- 转储表的索引
--

--
-- 表的索引 `patches`
--
ALTER TABLE `patches`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `patchinfo`
--
ALTER TABLE `patchinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `patches`
--
ALTER TABLE `patches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- 使用表AUTO_INCREMENT `patchinfo`
--
ALTER TABLE `patchinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
