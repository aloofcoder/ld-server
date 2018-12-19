-- --------------------------------------------------------
-- 主机:                           39.106.42.84
-- 服务器版本:                        5.7.24 - MySQL Community Server (GPL)
-- 服务器操作系统:                      linux-glibc2.12
-- HeidiSQL 版本:                  9.5.0.5293
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 ledai 的数据库结构
DROP DATABASE IF EXISTS `ledai`;
CREATE DATABASE IF NOT EXISTS `ledai` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ledai`;

-- 导出  表 ledai.loan_info 结构
DROP TABLE IF EXISTS `loan_info`;
CREATE TABLE IF NOT EXISTS `loan_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `loan_product_type` tinyint(4) DEFAULT NULL COMMENT '产品类型()',
  `loan_purpose` varchar(50) DEFAULT NULL,
  `loan_repayment` int(11) DEFAULT NULL COMMENT '每期需还款金额',
  `loan_date` bigint(20) DEFAULT NULL COMMENT '贷款日期',
  `loan_money` int(11) DEFAULT NULL COMMENT '贷款总金额',
  `loan_interest` int(11) DEFAULT NULL COMMENT '贷款总利息',
  `loan_periods` int(11) DEFAULT NULL COMMENT '贷款总期数',
  `loan_interest_period` int(11) DEFAULT NULL COMMENT '先息后本的利息期数',
  `loan_type` int(11) DEFAULT NULL COMMENT '贷款类型:(0.等额本息，1.先息后本)',
  `loan_pledge` varchar(50) DEFAULT NULL COMMENT '贷款质押',
  `loan_status` tinyint(4) DEFAULT NULL COMMENT '状态(0:还款中，1:还款完成，2：无效记录)',
  `loan_remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `edit_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `edit_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='贷款明细表';

-- 正在导出表  ledai.loan_info 的数据：~0 rows (大约)
DELETE FROM `loan_info`;
/*!40000 ALTER TABLE `loan_info` DISABLE KEYS */;
INSERT INTO `loan_info` (`id`, `user_id`, `loan_product_type`, `loan_purpose`, `loan_repayment`, `loan_date`, `loan_money`, `loan_interest`, `loan_periods`, `loan_interest_period`, `loan_type`, `loan_pledge`, `loan_status`, `loan_remarks`, `create_user`, `edit_user`, `create_time`, `edit_time`) VALUES
	(25, 33, 0, '1', 600000, 1543244655, 4800000, NULL, 12, NULL, 0, NULL, 0, NULL, '超级管理员1', '超级管理员1', 1543244657, 1543244840);
/*!40000 ALTER TABLE `loan_info` ENABLE KEYS */;

-- 导出  表 ledai.manager_info 结构
DROP TABLE IF EXISTS `manager_info`;
CREATE TABLE IF NOT EXISTS `manager_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `manager_num` varchar(50) DEFAULT NULL,
  `manager_pwd` varchar(50) DEFAULT NULL,
  `manager_name` varchar(50) DEFAULT NULL,
  `login_time` bigint(20) DEFAULT NULL,
  `manager_status` tinyint(4) DEFAULT NULL,
  `manager_remark` tinyint(4) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `edit_time` bigint(20) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `edit_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 正在导出表  ledai.manager_info 的数据：~3 rows (大约)
DELETE FROM `manager_info`;
/*!40000 ALTER TABLE `manager_info` DISABLE KEYS */;
INSERT INTO `manager_info` (`id`, `manager_num`, `manager_pwd`, `manager_name`, `login_time`, `manager_status`, `manager_remark`, `create_time`, `edit_time`, `create_user`, `edit_user`) VALUES
	(2, '18149197093', '123456', '超级管理员2', NULL, 1, NULL, 1539958940, 1539963682, '韩乐', '韩乐'),
	(3, '18149197091', '123456', '超级管理员1', 1543242620, 0, NULL, 1539963094, 1543242621, '韩乐', '超级管理员1'),
	(7, '18149197090', '123456', '超级管理员3', NULL, 0, NULL, 1540005998, 1540005998, '韩乐', '韩乐'),
	(13, '1', '1', '超级管理员', 1543249871, 0, NULL, 1543244874, 1543249871, '超级管理员1', '超级管理员');
/*!40000 ALTER TABLE `manager_info` ENABLE KEYS */;

-- 导出  表 ledai.repayment_info 结构
DROP TABLE IF EXISTS `repayment_info`;
CREATE TABLE IF NOT EXISTS `repayment_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户档案id',
  `loan_id` bigint(20) DEFAULT NULL COMMENT '对应的贷款id',
  `repayment_money` int(11) DEFAULT NULL COMMENT '还款金额',
  `repayment_source` varchar(50) DEFAULT NULL COMMENT '还款渠道',
  `repayment_time` bigint(20) DEFAULT NULL COMMENT '还款时间',
  `lower_time` bigint(20) DEFAULT NULL COMMENT '还款计划下发日期',
  `repayment_status` tinyint(4) DEFAULT NULL COMMENT '还款状态(0:待还款，1:还款完成，2:删除)',
  `repayment_remark` varchar(100) DEFAULT NULL COMMENT '还款备注',
  `create_time` bigint(20) DEFAULT NULL,
  `edit_time` bigint(20) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `edit_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='还款明细表';

-- 正在导出表  ledai.repayment_info 的数据：~5 rows (大约)
DELETE FROM `repayment_info`;
/*!40000 ALTER TABLE `repayment_info` DISABLE KEYS */;
INSERT INTO `repayment_info` (`id`, `user_id`, `loan_id`, `repayment_money`, `repayment_source`, `repayment_time`, `lower_time`, `repayment_status`, `repayment_remark`, `create_time`, `edit_time`, `create_user`, `edit_user`) VALUES
	(49, 27, 16, 458333, '支付宝', 1541307263, 1541001600, 1, NULL, 1541302048, 1541307269, '管理员', '超级管理员1'),
	(50, 4, 1, 100, NULL, NULL, 1541001600, 0, NULL, 1541327414, 1541327414, '韩乐', '韩乐'),
	(51, 31, 21, 37500, NULL, NULL, 1541001600, 2, NULL, 1541327851, 1541327851, '管理员', '管理员'),
	(52, 31, 21, 37500, NULL, NULL, 1541001600, 2, NULL, 1541328027, 1541328027, '管理员', '管理员'),
	(53, 29, 22, 958333, NULL, NULL, 1541001600, 2, NULL, 1541328027, 1541328027, '管理员', '管理员');
/*!40000 ALTER TABLE `repayment_info` ENABLE KEYS */;

-- 导出  表 ledai.user_info 结构
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_num` varchar(50) NOT NULL COMMENT '用户编号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `user_gender` tinyint(4) DEFAULT NULL COMMENT '用户性别',
  `user_mobile` varchar(50) DEFAULT NULL COMMENT '用户电话',
  `user_address` varchar(100) DEFAULT NULL COMMENT '用户地址',
  `mobile_date` int(11) DEFAULT NULL,
  `user_marriage` tinyint(11) DEFAULT NULL,
  `children_num` int(11) DEFAULT NULL,
  `support_num` int(11) DEFAULT NULL,
  `user_education` tinyint(4) DEFAULT NULL,
  `is_nowcity` tinyint(4) DEFAULT NULL,
  `user_houseregister` varchar(50) DEFAULT NULL,
  `live_type` varchar(50) DEFAULT NULL,
  `live_startdate` bigint(20) DEFAULT NULL,
  `month_wages` int(11) DEFAULT NULL,
  `company_properties` varchar(50) DEFAULT NULL,
  `is_privatecompany` tinyint(4) DEFAULT NULL,
  `user_position` varchar(50) DEFAULT NULL,
  `user_positionlevel` tinyint(4) DEFAULT NULL,
  `is_servant` tinyint(4) DEFAULT NULL,
  `user_department` varchar(50) DEFAULT NULL,
  `join_companydate` bigint(20) DEFAULT NULL,
  `company_mobile` varchar(50) DEFAULT NULL,
  `put_wagestype` varchar(50) DEFAULT NULL,
  `company_createdate` bigint(20) DEFAULT NULL,
  `company_social` varchar(50) DEFAULT NULL,
  `company_socialdate` bigint(20) DEFAULT NULL,
  `company_socialbase` varchar(50) DEFAULT NULL,
  `user_pdf` varchar(50) DEFAULT NULL,
  `pdf_createdate` bigint(20) DEFAULT NULL,
  `pdf_base` varchar(50) DEFAULT NULL,
  `house_type` varchar(50) DEFAULT NULL,
  `house_buy_date` bigint(20) DEFAULT NULL,
  `house_money` int(11) DEFAULT NULL,
  `house_acreage` int(11) DEFAULT NULL,
  `house_address` varchar(50) DEFAULT NULL,
  `house_is_address` tinyint(4) DEFAULT NULL,
  `house_loanyear` int(11) DEFAULT NULL,
  `house_repayment_money` int(11) DEFAULT NULL,
  `has_house_repayment` tinyint(4) DEFAULT NULL,
  `car_buytype` varchar(50) DEFAULT NULL,
  `car_buydate` bigint(20) DEFAULT NULL,
  `car_money` int(11) DEFAULT NULL,
  `car_course` int(11) DEFAULT NULL,
  `car_repayment_money` int(11) DEFAULT NULL,
  `car_brand` varchar(20) DEFAULT NULL,
  `car_inputdate` bigint(20) DEFAULT NULL,
  `car_color` varchar(50) DEFAULT NULL,
  `car_model` varchar(50) DEFAULT NULL,
  `car_safe` varchar(50) DEFAULT NULL,
  `car_hasfault` tinyint(4) DEFAULT NULL,
  `linkman_nexus1` varchar(50) DEFAULT NULL,
  `linkman_nexus2` varchar(50) DEFAULT NULL,
  `linkman_nexus3` varchar(50) DEFAULT NULL,
  `user_idcard` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `user_idcardurl` varchar(50) DEFAULT NULL COMMENT '身份证照片路径',
  `user_imgurl` varchar(50) DEFAULT NULL COMMENT '用户照片路径',
  `user_profession` varchar(50) DEFAULT NULL COMMENT '用户职业',
  `user_company` varchar(50) DEFAULT NULL COMMENT '公司',
  `user_companyadr` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `linkman_name1` varchar(50) DEFAULT NULL COMMENT '联系人1姓名',
  `linkman_mobile1` varchar(50) DEFAULT NULL COMMENT '联系人1电话',
  `linkman_name2` varchar(50) DEFAULT NULL COMMENT '联系人2姓名',
  `linkman_mobile2` varchar(50) DEFAULT NULL COMMENT '联系人2电话',
  `linkman_name3` varchar(50) DEFAULT NULL COMMENT '联系人3姓名',
  `linkman_mobile3` varchar(50) DEFAULT NULL COMMENT '联系人4姓名',
  `user_status` tinyint(4) DEFAULT NULL COMMENT '用户状态',
  `user_remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `edit_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `edit_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_num` (`user_num`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='用户档案表';

-- 正在导出表  ledai.user_info 的数据：~0 rows (大约)
DELETE FROM `user_info`;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`id`, `user_num`, `user_name`, `user_gender`, `user_mobile`, `user_address`, `mobile_date`, `user_marriage`, `children_num`, `support_num`, `user_education`, `is_nowcity`, `user_houseregister`, `live_type`, `live_startdate`, `month_wages`, `company_properties`, `is_privatecompany`, `user_position`, `user_positionlevel`, `is_servant`, `user_department`, `join_companydate`, `company_mobile`, `put_wagestype`, `company_createdate`, `company_social`, `company_socialdate`, `company_socialbase`, `user_pdf`, `pdf_createdate`, `pdf_base`, `house_type`, `house_buy_date`, `house_money`, `house_acreage`, `house_address`, `house_is_address`, `house_loanyear`, `house_repayment_money`, `has_house_repayment`, `car_buytype`, `car_buydate`, `car_money`, `car_course`, `car_repayment_money`, `car_brand`, `car_inputdate`, `car_color`, `car_model`, `car_safe`, `car_hasfault`, `linkman_nexus1`, `linkman_nexus2`, `linkman_nexus3`, `user_idcard`, `user_idcardurl`, `user_imgurl`, `user_profession`, `user_company`, `user_companyadr`, `linkman_name1`, `linkman_mobile1`, `linkman_name2`, `linkman_mobile2`, `linkman_name3`, `linkman_mobile3`, `user_status`, `user_remark`, `create_user`, `edit_user`, `create_time`, `edit_time`) VALUES
	(33, '20181126230417451', '刘子光', 0, '18149197030', '西安', 2, 0, 0, 0, 1, 0, '咸阳', '常驻', 1543244638, 450000, '8', 0, '软件开发工程师', 12, 1, '开发部', 1511103882, '029-00000000', '0', 1288883136, '无', 1543244746, '11', '无', 1543244756, '1', '0', 1510931167, 15000, 130, '西安', 0, 22, 350000, 0, '借款', 1543244802, 2200, 15000, 150000, '别克', 1480000023, '蓝色', '无', '无', 1, '朋友', NULL, NULL, '1', NULL, NULL, '码农', '垃圾', '西安', '胖子', '15555555555', NULL, NULL, NULL, NULL, 0, NULL, '超级管理员1', '超级管理员1', 1543244657, 1543244840);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
