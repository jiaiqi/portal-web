-- CMS 默认数据插入脚本
-- 创建日期: 2026-02-06

USE nest_admin;

-- ----------------------------
-- 1. 焦点图数据
-- ----------------------------
DELETE FROM cms_focus WHERE del_flag = '0';
INSERT INTO `cms_focus` (`title`, `image_url`, `image_type`, `link_url`, `sort_order`, `status`, `create_by`, `update_by`) VALUES
('焦点图大图', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/640_20250127152953A190.jpg', 'big', '', 1, '0', 'admin', 'admin'),
('焦点图小图1', 'https://www.wyzyz.org/claav-api/profile/upload/2024/03/26/换届_20240326194203A028.png', 'small', '', 1, '0', 'admin', 'admin'),
('焦点图小图2', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100743A007_20240103145744A044.png', 'small', '', 2, '0', 'admin', 'admin'),
('焦点图小图3', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100333A006_20240103145721A043.png', 'small', '', 3, '0', 'admin', 'admin');

-- ----------------------------
-- 2. 轮播图数据
-- ----------------------------
DELETE FROM cms_banner WHERE del_flag = '0';
INSERT INTO `cms_banner` (`title`, `image`, `link_url`, `position`, `sort_order`, `status`, `create_by`, `update_by`) VALUES
('焦点横幅', 'https://www.wyzyz.org/claav-api/profile/upload/2025/12/30/mmexport1767076004004_20251230142654A441.jpg', '', 'focus', 1, '1', 'admin', 'admin'),
('右侧顶部轮播图', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100209A005_20240103145859A047.png', '', 'right_top', 1, '1', 'admin', 'admin'),
('右侧平台轮播图', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100840A009 (1)_20240103145523A040.png', '', 'right_platform', 1, '1', 'admin', 'admin');

-- ----------------------------
-- 3. 文章分类数据
-- ----------------------------
DELETE FROM cms_category WHERE category_code IN ('news', 'information', 'announcement');
INSERT INTO `cms_category` (`category_name`, `category_code`, `parent_id`, `sort_order`, `status`, `create_by`, `update_by`) VALUES
('要闻动态', 'news', 0, 1, '1', 'admin', 'admin'),
('资讯', 'information', 0, 2, '1', 'admin', 'admin'),
('公告公示', 'announcement', 0, 3, '1', 'admin', 'admin');

-- ----------------------------
-- 4. 文章数据
-- ----------------------------
DELETE FROM cms_article WHERE del_flag = '0';
INSERT INTO `cms_article` (`title`, `category_id`, `summary`, `cover_image`, `content`, `publish_time`, `status`, `is_top`, `open_type`, `create_by`, `update_by`) VALUES
('习近平致中国志愿服务联合会第三届会员代表大会的贺信', 1, '习近平致中国志愿服务联合会第三届会员代表大会的贺信', 'https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210255A439.png', '<p>习近平致中国志愿服务联合会第三届会员代表大会的贺信内容...</p>', '2025-11-29 12:00:00', '1', '1', 'current', 'admin', 'admin'),
('习近平总书记致中国志愿服务联合会第三届会员代表大会的贺信引发热烈反响', 1, '习近平总书记致中国志愿服务联合会第三届会员代表大会的贺信引发热烈反响', 'https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210446A440.png', '<p>习近平总书记致中国志愿服务联合会第三届会员代表大会的贺信引发热烈反响内容...</p>', '2025-11-29 12:00:00', '1', '0', 'current', 'admin', 'admin'),
('第12个中国文艺志愿者服务日|"强基工程"——"与人民同行"新时代文明实践中国文艺志愿者小分队走进辽宁沈阳', 1, '第12个中国文艺志愿者服务日活动报道', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095142_20250527095153A373.png', '<p>第12个中国文艺志愿者服务日活动内容...</p>', '2025-05-27 12:00:00', '1', '0', 'current', 'admin', 'admin'),
('中央宣传思想文化工作领导小组关于认定命名第七届全国文明城市、文明村镇、文明单位和第三届全国文明家庭、文明校园的决定', 1, '中央宣传思想文化工作领导小组决定', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095422_20250527095430A374.png', '<p>中央宣传思想文化工作领导小组决定内容...</p>', '2025-05-27 12:00:00', '1', '0', 'current', 'admin', 'admin'),
('第12个中国文艺志愿者服务日|文艺志愿者们在行动', 1, '第12个中国文艺志愿者服务日活动报道', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527094917_20250527094929A372.png', '<p>第12个中国文艺志愿者服务日活动内容...</p>', '2025-05-27 12:00:00', '1', '0', 'current', 'admin', 'admin'),
('共唱团圆家 百花再出发|"百花迎春——中国文学艺术界2025春节大联欢"报道', 1, '春节大联欢活动报道', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/微信截图_20250127152109_20250127152122A187.png', '<p>春节大联欢活动内容...</p>', '2025-01-27 15:20:00', '1', '0', 'current', 'admin', 'admin');

-- ----------------------------
-- 5. 公告数据
-- ----------------------------
DELETE FROM cms_notice WHERE del_flag = '0';
INSERT INTO `cms_notice` (`title`, `content`, `notice_type`, `status`, `is_top`, `sort_order`, `create_by`, `update_by`) VALUES
('中国文联文艺志愿服务中心部门预算 （2025 年）', '中国文联文艺志愿服务中心部门预算内容...', 'notice', '0', '1', 1, 'admin', 'admin'),
('第三届"时代风尚"学雷锋文艺志愿服务先进典型名单公布', '第三届"时代风尚"学雷锋文艺志愿服务先进典型名单公布内容...', 'notice', '0', '0', 2, 'admin', 'admin'),
('中国文联文艺志愿服务中心2023年度部门决算', '中国文联文艺志愿服务中心2023年度部门决算内容...', 'notice', '0', '0', 3, 'admin', 'admin'),
('中国文联文艺志愿服务中心部门决算（2022年度）', '中国文联文艺志愿服务中心部门决算（2022年度）内容...', 'notice', '0', '0', 4, 'admin', 'admin'),
('公示｜第三届宣传推选"时代风尚"学雷锋文艺志愿服务先进典型公示名单', '公示｜第三届宣传推选"时代风尚"学雷锋文艺志愿服务先进典型公示名单内容...', 'announcement', '0', '0', 5, 'admin', 'admin'),
('中国文联文艺志愿服务中心部门预算（2024年）', '中国文联文艺志愿服务中心部门预算（2024年）内容...', 'notice', '0', '0', 6, 'admin', 'admin');

-- ----------------------------
-- 6. 单页数据
-- ----------------------------
DELETE FROM cms_page;
INSERT INTO `cms_page` (`page_key`, `page_name`, `content`) VALUES
('about', '协会概况', '<p>中国文艺志愿者协会（China Literary and Art Volunteers'' Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。中国文艺志愿者协会是在中国文联党组领导下...</p>'),
('charter', '协会章程', '<p>中国文艺志愿者协会章程内容...</p>'),
('leaders', '协会领导', '<p>协会领导介绍内容...</p>'),
('council', '理事会', '<p>理事会介绍内容...</p>'),
('regulations', '会员工作条例', '<p>会员工作条例内容...</p>');

-- ----------------------------
-- 7. 快捷链接数据
-- ----------------------------
DELETE FROM cms_quick_link WHERE del_flag = '0';
INSERT INTO `cms_quick_link` (`link_name`, `link_url`, `link_position`, `sort_order`, `status`, `create_by`, `update_by`) VALUES
('协会简介', '/about', 'top', 1, '1', 'admin', 'admin'),
('组织机构', '/about/leaders', 'top', 2, '1', 'admin', 'admin'),
('理事会', '/about/council', 'top', 3, '1', 'admin', 'admin'),
('制度建设', '/about/regulations', 'top', 4, '1', 'admin', 'admin');

-- ----------------------------
-- 8. 友情链接数据
-- ----------------------------
DELETE FROM cms_link WHERE del_flag = '0';
INSERT INTO `cms_link` (`link_name`, `link_url`, `link_type`, `sort_order`, `status`, `create_by`, `update_by`) VALUES
('中国文艺网', 'http://www.cflac.org.cn', '0', 1, '1', 'admin', 'admin'),
('中国志愿者服务网', 'http://www.chinavolunteer.cn', '0', 2, '1', 'admin', 'admin'),
('中国文联', 'http://www.cflac.org.cn', '0', 3, '1', 'admin', 'admin');

-- ----------------------------
-- 9. 专题数据
-- ----------------------------
DELETE FROM cms_special WHERE del_flag = '0';
INSERT INTO `cms_special` (`title`, `cover_image`, `description`, `sort_order`, `status`, `create_by`, `update_by`) VALUES
('时代风尚', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/01/时代风尚.jpg', '时代风尚专题', 1, '1', 'admin', 'admin'),
('文艺志愿服务', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/01/文艺志愿服务.jpg', '文艺志愿服务专题', 2, '1', 'admin', 'admin'),
('新时代文明实践', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/01/新时代文明实践.jpg', '新时代文明实践专题', 3, '1', 'admin', 'admin');
