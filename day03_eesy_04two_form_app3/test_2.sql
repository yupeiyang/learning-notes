-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.17 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 test_2 的数据库结构
CREATE DATABASE IF NOT EXISTS `test_2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test_2`;

-- 导出  表 test_2.account 结构
CREATE TABLE IF NOT EXISTS `account` (
  `ID` int(11) NOT NULL COMMENT '编号',
  `UID` int(11) DEFAULT NULL COMMENT '用户编号',
  `MONEY` double DEFAULT NULL COMMENT '金额',
  `name` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_8` (`UID`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`UID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  test_2.account 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`ID`, `UID`, `MONEY`, `name`) VALUES
	(1, 41, 1200, '工行第一账户'),
	(2, 41, 1000, '工行第二账户'),
	(3, 43, 800, '农行第一账户'),
	(5, 45, 1700, '中行第一账户'),
	(6, 43, 123.45, '农行第二账户'),
	(7, 45, 223, '中行第二账户'),
	(10, 45, 1244.45, '中行第三账户'),
	(11, 59, 1244.45, '邮政第一账户'),
	(15, 55, 15000, '东莞商业第一账户'),
	(16, 41, 15000, '工行第三账户'),
	(17, 50, 15000, '商行第一账户'),
	(25, 52, 1000, '南京第一账户'),
	(26, 55, 1000, '东莞商业第二账户'),
	(27, 50, 3000, '商行第二账户'),
	(30, 52, 1666, '南京第二账户'),
	(31, 59, 1999, '邮政第二账户'),
	(32, 41, 1999, '工行第四账户'),
	(80, 52, 1120, 'aaa'),
	(81, 55, 2060, 'bbb'),
	(82, 60, 5400, 'ccc'),
	(83, 55, 1200, '周扬青');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- 导出  表 test_2.items 结构
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` float(10,0) DEFAULT NULL,
  `pic` varchar(40) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  test_2.items 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `name`, `price`, `pic`, `createtime`, `detail`) VALUES
	(1, '传智播客', 1000, NULL, '2018-03-13 09:29:30', '带我走上人生巅峰'),
	(2, '黑马310', NULL, NULL, '2018-03-28 10:05:52', '插入测试'),
	(3, '黑马307', 199, NULL, '2018-03-07 10:08:04', '插入测试'),
	(7, '插入测试', NULL, NULL, NULL, NULL),
	(8, '插入测试', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- 导出  表 test_2.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `ID` int(11) NOT NULL COMMENT '编号',
  `ROLE_NAME` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色名称',
  `ROLE_DESC` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  test_2.role 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`ID`, `ROLE_NAME`, `ROLE_DESC`) VALUES
	(1, '后勤主任', '收学生的学费'),
	(2, '总裁', '负责学校的决策'),
	(3, '校长', '管理学校运作'),
	(4, '大内总管', '内部事务'),
	(5, '教员', '负责教学任务'),
	(6, '会计', '财务管理'),
	(7, '教学主任', '指定每周的教学任务，并监督');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- 导出  表 test_2.stu 结构
CREATE TABLE IF NOT EXISTS `stu` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  test_2.stu 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `stu` DISABLE KEYS */;
/*!40000 ALTER TABLE `stu` ENABLE KEYS */;

-- 导出  表 test_2.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名称',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` char(16) DEFAULT NULL COMMENT '性别',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `password` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- 正在导出表  test_2.user 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `birthday`, `sex`, `address`, `password`, `age`) VALUES
	(41, '老王', '2018-02-27 17:47:08', '0', '北京', '12356', 26),
	(42, 'wwj', '2018-03-02 15:09:37', '1', '北京', '789', 24),
	(43, '李太', '2020-03-13 18:07:14', '0', '天津', '8', 24),
	(45, '老李', '2018-03-04 12:04:06', '0', '北京', '44', 24),
	(48, '小龙', '2018-03-08 11:44:00', '0', '天津', '67', 24),
	(49, '贺知章', '2020-03-10 17:59:15', '0', '四川', '321', 14),
	(50, '白居易', '2020-03-10 17:59:14', '0', '西安', '321', 36),
	(51, '小晓', '2020-03-10 17:59:11', '1', '江油', '123456', 74),
	(52, '刘天华', '2020-03-10 17:57:33', '1', '安徽阜阳', '123456', 15),
	(55, 'wwj', '2020-03-11 16:10:18', '1', '甘肃兰州', '321', 38),
	(56, 'UZI', '2020-04-15 21:24:42', '男', '浙江杭州', '333', 63),
	(57, '王新华', '2020-04-13 18:16:15', '男', '浙江杭州', '489', 29),
	(58, '小青皮', '2020-04-14 14:00:10', '男', '浙江义乌', '32', 65),
	(59, '小彩旗', '2020-04-14 15:54:30', '女', '北京海淀', '356', 32),
	(60, '刘田贵', '2020-04-15 21:25:29', '男', '广东惠州', '33', 48);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 导出  表 test_2.user1 结构
CREATE TABLE IF NOT EXISTS `user1` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  test_2.user1 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `user1` DISABLE KEYS */;
INSERT INTO `user1` (`id`, `name`) VALUES
	(1, 'yupeiyang'),
	(2, 'libai'),
	(3, 'tom');
/*!40000 ALTER TABLE `user1` ENABLE KEYS */;

-- 导出  表 test_2.user_role 结构
CREATE TABLE IF NOT EXISTS `user_role` (
  `UID` int(11) NOT NULL COMMENT '用户编号',
  `RID` int(11) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`UID`,`RID`),
  KEY `FK_Reference_10` (`RID`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`RID`) REFERENCES `role` (`ID`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`UID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  test_2.user_role 的数据：~18 rows (大约)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`UID`, `RID`) VALUES
	(41, 1),
	(55, 1),
	(45, 2),
	(43, 3),
	(55, 3),
	(42, 4),
	(57, 4),
	(41, 5),
	(52, 5),
	(55, 5),
	(56, 5),
	(60, 5),
	(49, 6),
	(58, 6),
	(43, 7),
	(51, 7),
	(55, 7),
	(59, 7);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
