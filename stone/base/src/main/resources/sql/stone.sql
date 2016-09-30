/*
Navicat MySQL Data Transfer

Source Server         : 阿里云DB
Source Server Version : 50505
Source Host           : 101.200.194.213:3306
Source Database       : stone

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-05-06 14:50:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_ad
-- ----------------------------
DROP TABLE IF EXISTS `t_ad`;
CREATE TABLE `t_ad` (
  `AD_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AD_NAME` varchar(80) DEFAULT '' COMMENT '名称',
  `AD_DESCRIPTION` varchar(200) DEFAULT '' COMMENT '描述',
  `AD_TYPE` int(1) DEFAULT '0' COMMENT '显示类型：1：图片 2：文字',
  `AD_WORDS` varchar(200) DEFAULT '' COMMENT '广告文字',
  `AD_IMG` varchar(200) DEFAULT '' COMMENT '广告图片',
  `AD_STATUS` int(1) DEFAULT NULL COMMENT '1: 显示   2： 隐藏',
  `AD_URL` varchar(200) DEFAULT '' COMMENT '广告链接',
  `OWNER_ID` int(11) DEFAULT NULL COMMENT '投放者',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`AD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1069 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ad_location
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_location`;
CREATE TABLE `t_ad_location` (
  `LOCATION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级',
  `LOCATION_NAME` varchar(30) DEFAULT '' COMMENT '位置名称',
  `LOCATION_DESCRIPTIONS` varchar(200) DEFAULT NULL COMMENT '位置描述',
  `LOCATION_WIDTH` int(5) DEFAULT NULL COMMENT '宽度',
  `LOCATION_HIGH` int(5) DEFAULT NULL COMMENT '高度',
  `LOCATION_CODE` text COMMENT '广告代码',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`LOCATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1060 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ad_location_link
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_location_link`;
CREATE TABLE `t_ad_location_link` (
  `AD_ID` int(11) NOT NULL COMMENT '广告id',
  `LOCATION_ID` int(11) NOT NULL COMMENT '广告位id',
  `STATUS` int(2) NOT NULL DEFAULT '0' COMMENT '状态：1 显示  2 隐藏',
  `ORDER` int(2) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `CATEGORY_ID` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `SITE_ID` int(11) NOT NULL DEFAULT '0' COMMENT '分站ID',
  PRIMARY KEY (`AD_ID`,`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ad_owner
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_owner`;
CREATE TABLE `t_ad_owner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LINK_MAN` varchar(30) NOT NULL COMMENT '联系人',
  `PHONE` varchar(200) NOT NULL COMMENT '联系人电话',
  `EMAIL` varchar(200) NOT NULL COMMENT '联系邮箱',
  `TYPE` int(10) NOT NULL COMMENT '1：公司  2：个人',
  `ADDRESS` varchar(255) NOT NULL COMMENT '地址',
  `COMPANY_NAME` varchar(100) NOT NULL COMMENT '公司名称',
  `COMPANY_SITE` varchar(100) NOT NULL COMMENT '公司站点',
  `OFFICE_PHONE` varchar(20) NOT NULL COMMENT '公司电话',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL,
  `t_s_id` int(11) NOT NULL,
  `username` char(30) DEFAULT NULL,
  `password` char(30) DEFAULT NULL,
  `linkman` varchar(20) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1：平台 2：分站 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌主键',
  `name` varchar(80) NOT NULL COMMENT '品牌名称：一般为该字段在前台显示的中文名称，也可含有英文或数字',
  `desc` varchar(200) DEFAULT NULL COMMENT '品牌描述',
  `img` varchar(100) DEFAULT NULL COMMENT '品牌图标：存储图标地址',
  `website` varchar(240) DEFAULT NULL COMMENT '品牌网址',
  `order` int(5) DEFAULT NULL COMMENT '前台显示排序',
  `status` int(1) DEFAULT '0' COMMENT '1：启用  2：禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='品牌';

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_c_id` int(11) DEFAULT NULL COMMENT '父id',
  `name` char(50) DEFAULT NULL COMMENT '名称',
  `status` int(11) DEFAULT NULL COMMENT '1：正常 2：停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_category_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_category_brand`;
CREATE TABLE `t_category_brand` (
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_category_template
-- ----------------------------
DROP TABLE IF EXISTS `t_category_template`;
CREATE TABLE `t_category_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` char(20) NOT NULL,
  `format` int(11) NOT NULL DEFAULT '1' COMMENT '1：text 2：area 3：radio 4：checkbox 5：select',
  `options` varchar(200) NOT NULL DEFAULT '' COMMENT '项分隔符：英文"," 例性别： 男,女  表示两个选择项 男  女',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1：普通属性  2：规格属性（平台设定可选项）3：规格属性（店家设定可选项）',
  `status` int(11) NOT NULL COMMENT '1：正常 2：停用',
  `order` int(11) NOT NULL COMMENT '属性显示位次',
  `value_order` int(11) NOT NULL DEFAULT '0' COMMENT '值存储顺序 此字段只有type=2即规格属性时才有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_category_template_shop
-- ----------------------------
DROP TABLE IF EXISTS `t_category_template_shop`;
CREATE TABLE `t_category_template_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `category_id` int(11) NOT NULL COMMENT '类别id',
  `template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `options` varchar(300) DEFAULT '' COMMENT '项分隔符：英文"," 例性别： 男,女  表示两个选择项 男  女',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cms_category
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_category`;
CREATE TABLE `t_cms_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `NAME` varchar(100) NOT NULL COMMENT '类别名称',
  `DESCRIPTION` varchar(200) NOT NULL COMMENT '类别描述',
  `PARENT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '父类别',
  `STATUS` int(11) NOT NULL COMMENT '1：启用   2：禁用',
  `ORDER` int(11) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `ADMIN_ID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cms_content
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_content`;
CREATE TABLE `t_cms_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(200) NOT NULL COMMENT '文章标题',
  `KEYWORDS` varchar(300) NOT NULL COMMENT '关键字 用英文分号隔开    ',
  `CONTENT` text NOT NULL COMMENT '文章内容',
  `CATEGORY_ID` int(11) NOT NULL COMMENT '内容所属类别',
  `FROM` varchar(255) NOT NULL COMMENT '来源  如： 自发   或   其他***网站转载',
  `STATUS` int(11) NOT NULL COMMENT '0：不显示，1：显示',
  `ADMIN_ID` int(11) NOT NULL COMMENT '发布人',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_distri
-- ----------------------------
DROP TABLE IF EXISTS `t_distri`;
CREATE TABLE `t_distri` (
  `ID` int(11) NOT NULL COMMENT '主键',
  `DISTRI_NAME` varchar(50) DEFAULT NULL COMMENT '配送商名称',
  `LEGAL_REP` varchar(20) DEFAULT NULL COMMENT '法人代表',
  `REG_CAP` varchar(20) DEFAULT NULL COMMENT '注册资本，中文表示10个字符以内',
  `CORP_TYPE` int(2) DEFAULT NULL COMMENT '企业类型，1国有企业, 2集体企业, 3私营企业, 4联营企业, 5有限责任公司, 6股份有限公司, 7股份合作企业, 8其他企业, 9港、澳、台商投资企业, 10 外商投资企业责任; 6.股份有限; 7.股份合作; 8.其他（事业单位、社会团体、民办非企业）',
  `BIZ_SCOPE` varchar(200) DEFAULT NULL COMMENT '经营范围',
  `LICENSE_NO` varchar(20) DEFAULT NULL COMMENT '营业执照号',
  `ESTABLISH_DATE` varchar(20) DEFAULT NULL COMMENT '创立日期',
  `CONTACT` varchar(20) DEFAULT NULL COMMENT '联系人: ',
  `MOBILE` varchar(11) DEFAULT NULL COMMENT '移动电话，11位数字',
  `FIXED_PHONE` varchar(20) DEFAULT NULL COMMENT '固定电话号码',
  `FAX` varchar(20) DEFAULT NULL COMMENT '传真号码',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `WEBSITE` varchar(100) DEFAULT NULL COMMENT '网址',
  `ADDRESS` varchar(100) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_field_type
-- ----------------------------
DROP TABLE IF EXISTS `t_field_type`;
CREATE TABLE `t_field_type` (
  `int_a` int(11) NOT NULL,
  `bigint_a` bigint(20) NOT NULL,
  `float_a` float NOT NULL,
  PRIMARY KEY (`int_a`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_navigation
-- ----------------------------
DROP TABLE IF EXISTS `t_navigation`;
CREATE TABLE `t_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '导航名称',
  `url` varchar(200) NOT NULL COMMENT '导航链接',
  `parent_id` int(11) NOT NULL COMMENT '父级导航id',
  `type` int(11) NOT NULL COMMENT '导航类型：1 纵向  2 横向',
  `order` int(11) NOT NULL COMMENT '显示顺序',
  `status` int(11) NOT NULL COMMENT '状态： 1 启用 2禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_navigation_field
-- ----------------------------
DROP TABLE IF EXISTS `t_navigation_field`;
CREATE TABLE `t_navigation_field` (
  `FIELD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RECORD_ID` int(11) NOT NULL COMMENT 'navigation_record 主键',
  `NAME` varchar(100) NOT NULL COMMENT '导航名称',
  `URL` varchar(200) NOT NULL COMMENT '导航链接',
  `ORDER` int(11) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `HOT` int(11) NOT NULL DEFAULT '0' COMMENT '1：正常  2：推荐',
  `STATUS` int(11) NOT NULL DEFAULT '0' COMMENT '状态： 1 启用 2禁用',
  PRIMARY KEY (`FIELD_ID`),
  KEY `RECORD_ID` (`RECORD_ID`),
  CONSTRAINT `t_navigation_field_ibfk_1` FOREIGN KEY (`RECORD_ID`) REFERENCES `t_navigation_record` (`RECORD_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_navigation_record
-- ----------------------------
DROP TABLE IF EXISTS `t_navigation_record`;
CREATE TABLE `t_navigation_record` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) NOT NULL COMMENT '父级导航id',
  `TYPE` int(11) NOT NULL COMMENT '导航类型：1 纵向  2 横向',
  `ORDER` int(11) NOT NULL COMMENT '显示顺序',
  `STATUS` int(11) NOT NULL COMMENT '状态： 1 启用 2禁用',
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_navigation_record_copy
-- ----------------------------
DROP TABLE IF EXISTS `t_navigation_record_copy`;
CREATE TABLE `t_navigation_record_copy` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) NOT NULL COMMENT '父级导航id',
  `TYPE` int(11) NOT NULL COMMENT '导航类型：1 纵向  2 横向',
  `ORDER` int(11) NOT NULL COMMENT '显示顺序',
  `STATUS` int(11) NOT NULL COMMENT '状态： 1 启用 2禁用',
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_offer
-- ----------------------------
DROP TABLE IF EXISTS `t_offer`;
CREATE TABLE `t_offer` (
  `ID` int(11) NOT NULL DEFAULT '0' COMMENT '促销活动主键',
  `OFFER_NAME` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `SHORT_NAME` varchar(50) DEFAULT NULL COMMENT '活动简称。用字母代表，如A1中的A',
  `OFFER_NO` varchar(50) DEFAULT NULL COMMENT '活动编号',
  `OFFER_WAY` int(10) DEFAULT NULL COMMENT '让利方式：1：代金券；2：打折券',
  `OFFER_FROM` float DEFAULT NULL COMMENT '让利来源：1：平台；2：店家',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `ORDER_ID` bigint(16) NOT NULL COMMENT '订单。包括实体商品和虚拟商品的订单',
  `GROUP_ID` bigint(16) NOT NULL COMMENT '组订单id    判断订单的拆分来源',
  `USER_ID` int(11) NOT NULL COMMENT '用户主键',
  `SHOP_ID` int(11) NOT NULL DEFAULT '0' COMMENT '所属店铺',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户真实名称',
  `ORDER_NUM` bigint(16) DEFAULT NULL COMMENT '订单号，订单号规则：订单生成日期+7位数，1000001第一个。递增. 如：201512151000001',
  `PAYMENT` int(1) DEFAULT NULL COMMENT '支付方式：1: 在线支付；2: 货到付款；3: 线下转账',
  `PAY_PLATFORM` int(2) DEFAULT NULL COMMENT '支付平台：1: 支付宝 2：微信  3：快钱  4：工商银行; 5: 建设银行; 5: 农业银行',
  `ORDER_SUM` float(20,0) DEFAULT NULL COMMENT '订单总金额：各订单项的售价之和，包括运费等',
  `SHIP_FEE` float(20,0) DEFAULT NULL COMMENT '运费',
  `IS_PAID` int(1) DEFAULT NULL COMMENT '未付款(待付款)=0;已付款(付款成功)=1;待退款=2;退款成功=3;退款失败=4;撤销成功=5;撤销失败=6;关闭=7;',
  `STATUS` int(2) DEFAULT NULL COMMENT '订单状态: 待卖家发货=1,卖家已发货=2,买家已收货=3,退货-待买家发货=4,退货-买家已发货=5,退货-卖家已收货=6, 关闭=7',
  `PAYMENT_CASE` int(1) DEFAULT '0' COMMENT '货到付款方式：1: 现金；2: POS刷卡; 3: 支票',
  `DISTRI_ID` int(11) DEFAULT NULL COMMENT '配送商ID',
  `DELIVERY_METHOD` int(1) DEFAULT NULL COMMENT '送货方式：1：快递；2：营业厅自提；3：平邮',
  `PAYMENT_NO` varchar(30) DEFAULT NULL COMMENT '支付号',
  `ORDER_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `PAY_TIME` timestamp NULL DEFAULT NULL COMMENT '付款时间',
  `DEPOSIT_TIME` timestamp NULL DEFAULT NULL COMMENT '到帐时间',
  `SUCCESS_TIME` timestamp NULL DEFAULT NULL COMMENT '成功时间',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `SRV_TYPE` int(2) unsigned zerofill DEFAULT '00' COMMENT '业务类型，0：无业务；1：A业务订单；2：B业务订单',
  `IS_DELETED` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '用户彻底删除订单标记。1：是；0：否',
  `IS_DISPLAY` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '用户删除订单标记，在已删除菜单下能看到。1：是；0：否',
  `ORDER_TYPE` int(3) DEFAULT NULL COMMENT '0、无；1、用户下单；2、后台下单',
  `notes` varchar(300) DEFAULT '' COMMENT '订单备注',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_order_comment`;
CREATE TABLE `t_order_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(11) NOT NULL COMMENT '订单id',
  `PRODUCT_ID` int(11) NOT NULL COMMENT '商品id',
  `PRODUCT` varchar(500) NOT NULL COMMENT '商品评价',
  `SERVICE` varchar(500) NOT NULL COMMENT '服务评价',
  `IMGS` varchar(500) NOT NULL COMMENT '晒的图片',
  `PRODUCT_STAR` int(11) NOT NULL COMMENT '商品星级',
  `SERVICE_STAR` int(11) NOT NULL COMMENT '服务星级',
  `EXPRESS_STAR` int(11) NOT NULL COMMENT '快递星级',
  `STAR` int(11) NOT NULL COMMENT '总体星级',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ORDER_ID` bigint(16) NOT NULL COMMENT '订单主键',
  `PRODUCT_ID` int(11) DEFAULT NULL COMMENT '商品主键',
  `PRODUCT_NO` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `PRODUCT_TITLE` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `SKU_ID` int(11) DEFAULT NULL COMMENT '最小销售单元主键',
  `SKU_NAME` varchar(50) DEFAULT NULL COMMENT '货品名称',
  `SKU_NO` varchar(50) DEFAULT NULL COMMENT '货品编号',
  `SKU_IMG` varchar(50) DEFAULT NULL COMMENT '图片路径',
  `SKU_PRICE` float DEFAULT NULL COMMENT 'sku销售价',
  `SKU_DISCOUNT` float DEFAULT NULL COMMENT '优惠额',
  `DISCOUNT_PRICE` float DEFAULT NULL COMMENT '折后价格',
  `OFFER_ID` int(11) DEFAULT NULL COMMENT '促销活动主键',
  `PRICE` float DEFAULT NULL COMMENT '成交价格（即实际购买价格）。若是营销活动，则按公式DISCOUNT_PRICE-OFFER计算',
  `COUNT` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `SNAPSHOT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '商品快照  ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order_extra
-- ----------------------------
DROP TABLE IF EXISTS `t_order_extra`;
CREATE TABLE `t_order_extra` (
  `EXTRA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单附加信息id',
  `ORDER_ID` bigint(16) NOT NULL COMMENT '订单。包括实体商品和虚拟商品的订单',
  `DELIVERY` int(1) DEFAULT NULL COMMENT '送货时间：1: 只工作日送货(双休日，假日不用送); 2: 工作日、双休日、假日均可送货; 3: 只双休日、假日送货(工作日送货)',
  `IS_CONFIRM` int(1) DEFAULT NULL COMMENT '送货前电话确认：0: 否; 1: 是',
  `RECEIVER` varchar(80) DEFAULT NULL COMMENT '收货人姓名',
  `COUNTRY` varchar(40) DEFAULT NULL COMMENT '国家',
  `PROVINCE` varchar(40) DEFAULT NULL COMMENT '省份',
  `CITY` varchar(40) DEFAULT NULL COMMENT '城市',
  `DISTRICT` varchar(40) DEFAULT NULL COMMENT '区或县',
  `STREET` varchar(40) DEFAULT NULL COMMENT '街道或乡镇',
  `ZIP_CODE` varchar(40) DEFAULT NULL COMMENT '邮编',
  `ADDR` varchar(40) DEFAULT NULL COMMENT '具体地址',
  `whole_addr` varchar(300) DEFAULT NULL COMMENT '完整地址  国家  城市  区  街道 门牌号  冗余字段',
  `PHONE` varchar(60) DEFAULT NULL COMMENT '联系电话',
  `FIXED_PHONE` varchar(50) DEFAULT NULL COMMENT '固定电话',
  `DELIVERY_NAME` varchar(300) DEFAULT NULL COMMENT '物流名称',
  `DELIVERY_NO` varchar(300) DEFAULT NULL COMMENT '物流编号',
  `SELF_COLLECT_SITE` varchar(200) DEFAULT NULL COMMENT '商品自提点名称',
  `SELF_COLLECT_SITE_ID` int(11) DEFAULT NULL COMMENT '自提营业厅ID',
  `PAYABLE` int(1) DEFAULT NULL COMMENT '发票抬头：0: 不需要发票；1: 个人；2: 单位',
  `COMPANY` varchar(240) DEFAULT NULL COMMENT '单位名称',
  `CONTENTS` int(2) DEFAULT NULL COMMENT '发票内容：1: 明细；2: 办公用品',
  `IS_PRINT` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '是否已打印发票。0-未打印；1-已打印',
  PRIMARY KEY (`EXTRA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SHOP_ID` int(11) NOT NULL COMMENT '店铺id',
  `CATEGORY_ID` int(11) NOT NULL COMMENT '商品类别',
  `brand_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属品牌',
  `NO` varchar(20) NOT NULL COMMENT '商品编号',
  `TITLE` varchar(100) NOT NULL COMMENT '商品标题',
  `PRICE` float NOT NULL DEFAULT '0' COMMENT '原价格',
  `DISCOUNT_PRICE` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售员价',
  `IMGS` varchar(500) NOT NULL DEFAULT '' COMMENT '商品图片 英文分号 ; 分割   ',
  `TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '录入时间',
  `STATUS` int(11) NOT NULL COMMENT '1：上架 2：下架',
  `TYPE` int(11) NOT NULL DEFAULT '0' COMMENT '0：普通 1：团购  2：抢购',
  `STATUS_ADMIN` int(10) NOT NULL DEFAULT '1' COMMENT '1：正常  2：被后台强制下架',
  `SNAPSHOT_ID` int(10) NOT NULL DEFAULT '0' COMMENT '商品快照  ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_product_extend
-- ----------------------------
DROP TABLE IF EXISTS `t_product_extend`;
CREATE TABLE `t_product_extend` (
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `template_id` int(11) NOT NULL COMMENT '模板id',
  `value` varchar(300) DEFAULT NULL COMMENT '商品对应属性的值',
  PRIMARY KEY (`template_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_product_sku`;
CREATE TABLE `t_product_sku` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格记录id',
  `CATEGORY_ID` int(11) NOT NULL DEFAULT '0' COMMENT '类别Id',
  `PRODUCT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '商品Id',
  `SKU_NO` varchar(50) NOT NULL DEFAULT '' COMMENT '货号',
  `PRICE` float(11,0) NOT NULL DEFAULT '0' COMMENT '商品指定规格的价格',
  `DISCOUNT` float DEFAULT '0' COMMENT '折扣',
  `DISCOUNT_PRICE` float DEFAULT '0' COMMENT '折后价格',
  `STOCK` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `UPPER_LIMIT` int(11) DEFAULT '0' COMMENT '购买上线 包含  0不限制',
  `IMG_INDEX` int(2) DEFAULT '0' COMMENT '货品图片在商品表imgs字段中的位置',
  `SKU_TYPE` int(11) DEFAULT '1' COMMENT '0为赠品；1为普通SKU',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='商品规格表\r\n用于记录商品不同规格项 对应的价格 库存';

-- ----------------------------
-- Table structure for t_product_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `t_product_snapshot`;
CREATE TABLE `t_product_snapshot` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(30) NOT NULL COMMENT '版本号',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '快照生成时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品快照 商品基本信息、扩展信息、规格信息（价格、库存除外）变更时生成快照，进行记录。\r\n以便后续的维权追踪。';

-- ----------------------------
-- Table structure for t_product_tuan
-- ----------------------------
DROP TABLE IF EXISTS `t_product_tuan`;
CREATE TABLE `t_product_tuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `title` varchar(200) NOT NULL COMMENT '团购标题',
  `price` float NOT NULL COMMENT '团购价格',
  `discount` int(11) NOT NULL COMMENT '折扣 0-100直接的整数',
  `start_time` varchar(22) NOT NULL COMMENT '开始时间',
  `end_time` varchar(22) NOT NULL COMMENT '结束时间',
  `sales_volume` int(11) NOT NULL DEFAULT '0' COMMENT '已售数量',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0：存库 1：上架  2：下架 3：删除',
  `limit_num` int(11) DEFAULT NULL,
  `deal_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend_product`;
CREATE TABLE `t_recommend_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `local` int(11) NOT NULL COMMENT '显示位置',
  `order` int(11) NOT NULL COMMENT '指定位置的显示顺序',
  `status` int(11) NOT NULL COMMENT '状态： 1启用  2禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_region
-- ----------------------------
DROP TABLE IF EXISTS `t_region`;
CREATE TABLE `t_region` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `PRENAME` varchar(20) NOT NULL COMMENT '显示名称 中文',
  `CNAME` varchar(20) NOT NULL COMMENT '拼音',
  `AREACODE` int(7) NOT NULL DEFAULT '0' COMMENT '邮编',
  `VERSION` int(11) DEFAULT NULL COMMENT '版本号',
  `GRADE` int(4) NOT NULL COMMENT '级别 ： 1省 2市  3区或县 4街道或乡镇',
  `ORDERNUM` int(11) DEFAULT NULL COMMENT '顺序',
  `ISLEAF` int(4) DEFAULT NULL COMMENT '是否是叶子节点   1：是',
  `PARENTID` bigint(20) NOT NULL DEFAULT '0' COMMENT '父节点id',
  `SHOP_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_region_copy
-- ----------------------------
DROP TABLE IF EXISTS `t_region_copy`;
CREATE TABLE `t_region_copy` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `PRENAME` varchar(20) NOT NULL,
  `CNAME` varchar(20) NOT NULL,
  `AREACODE` int(7) NOT NULL DEFAULT '0',
  `VERSION` int(11) DEFAULT NULL,
  `GRADE` int(4) NOT NULL,
  `ORDERNUM` int(11) DEFAULT NULL,
  `ISLEAF` int(4) DEFAULT NULL,
  `PARENTID` bigint(20) NOT NULL DEFAULT '0',
  `SHOP_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_region_copy1
-- ----------------------------
DROP TABLE IF EXISTS `t_region_copy1`;
CREATE TABLE `t_region_copy1` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `PRENAME` varchar(20) NOT NULL COMMENT '显示名称 中文',
  `CNAME` varchar(20) NOT NULL COMMENT '拼音',
  `AREACODE` int(7) NOT NULL DEFAULT '0' COMMENT '邮编',
  `VERSION` int(11) DEFAULT NULL COMMENT '版本号',
  `GRADE` int(4) NOT NULL COMMENT '级别 ： 1省 2市  3区或县 4街道或乡镇',
  `ORDERNUM` int(11) DEFAULT NULL COMMENT '顺序',
  `ISLEAF` int(4) DEFAULT NULL COMMENT '是否是叶子节点   1：是',
  `PARENTID` bigint(20) NOT NULL DEFAULT '0' COMMENT '父节点id',
  `SHOP_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '资源路径',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sequence
-- ----------------------------
DROP TABLE IF EXISTS `t_sequence`;
CREATE TABLE `t_sequence` (
  `table_name` varchar(50) NOT NULL,
  `current_value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `increment` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_shop
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `name` char(30) NOT NULL,
  `contact` char(30) NOT NULL,
  `phone` char(30) NOT NULL,
  `address` char(200) NOT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1：正常 2：关闭',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_site
-- ----------------------------
DROP TABLE IF EXISTS `t_site`;
CREATE TABLE `t_site` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL COMMENT '分站编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分站名称',
  `status` int(11) NOT NULL COMMENT '1:正常 2：关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sku_value
-- ----------------------------
DROP TABLE IF EXISTS `t_sku_value`;
CREATE TABLE `t_sku_value` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PRODUCT_ID` int(11) NOT NULL COMMENT '商品ID',
  `SKU_ID` int(11) NOT NULL COMMENT '货品主键',
  `TEMPLATE_ID` int(11) NOT NULL COMMENT '规格属性主键',
  `VALUE` varchar(50) NOT NULL DEFAULT '' COMMENT '规则值',
  PRIMARY KEY (`ID`),
  KEY `sku外键` (`SKU_ID`),
  CONSTRAINT `sku外键` FOREIGN KEY (`SKU_ID`) REFERENCES `t_product_sku` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_trade_date_num
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_date_num`;
CREATE TABLE `t_trade_date_num` (
  `trade_name` varchar(50) NOT NULL COMMENT '业务名称',
  `date` int(11) NOT NULL COMMENT '业务发生的日期',
  `current_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trade_name`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_tuan
-- ----------------------------
DROP TABLE IF EXISTS `t_tuan`;
CREATE TABLE `t_tuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属分类',
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `title` varchar(200) NOT NULL COMMENT '团购标题',
  `price` float(11,0) NOT NULL COMMENT '原价格',
  `discount` int(11) NOT NULL DEFAULT '0' COMMENT '折扣 0-100直接的整数',
  `discount_price` float(11,0) NOT NULL COMMENT '折后价格',
  `start_time` varchar(22) NOT NULL COMMENT '开始时间',
  `end_time` varchar(22) NOT NULL COMMENT '结束时间',
  `sale_num` int(11) NOT NULL DEFAULT '0' COMMENT '已售数量',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0：存库 1：上架  2：下架 3：删除',
  `limit_num` int(11) DEFAULT '0' COMMENT '限购量',
  `deal_num` int(11) DEFAULT '0' COMMENT '成团量',
  `images` varchar(500) NOT NULL DEFAULT '' COMMENT '商品图片 英文分号 ; 分割   ',
  `recommend` int(1) NOT NULL DEFAULT '0' COMMENT '1：推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_tuan_category
-- ----------------------------
DROP TABLE IF EXISTS `t_tuan_category`;
CREATE TABLE `t_tuan_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `NAME` varchar(100) NOT NULL COMMENT '类别名称',
  `DESCRIPTION` varchar(200) NOT NULL COMMENT '类别描述',
  `PARENT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '父类别',
  `STATUS` int(11) NOT NULL COMMENT '1：启用   2：禁用',
  `ORDER` int(11) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `ADMIN_ID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_tuan_text
-- ----------------------------
DROP TABLE IF EXISTS `t_tuan_text`;
CREATE TABLE `t_tuan_text` (
  `tuan_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(300) NOT NULL COMMENT '团购副标题',
  `detail` text NOT NULL COMMENT '团购详情',
  PRIMARY KEY (`tuan_id`),
  CONSTRAINT `t_tuan_text_ibfk_1` FOREIGN KEY (`tuan_id`) REFERENCES `t_tuan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) DEFAULT NULL COMMENT '账号名',
  `password` char(20) NOT NULL COMMENT '密码',
  `realname` char(30) DEFAULT NULL COMMENT '真实姓名',
  `phone` char(15) NOT NULL COMMENT '手机',
  `email` char(30) DEFAULT NULL COMMENT '邮箱',
  `address` char(200) DEFAULT NULL COMMENT '地址',
  `status` int(11) DEFAULT NULL COMMENT '1：正常 2：关闭',
  `type` int(11) DEFAULT NULL COMMENT '1： 会员   2：店铺管理员',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '0：普通会员  其他值就是店铺id',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_address
-- ----------------------------
DROP TABLE IF EXISTS `t_user_address`;
CREATE TABLE `t_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country` bigint(11) NOT NULL COMMENT '国家',
  `province` bigint(11) NOT NULL COMMENT '省',
  `city` bigint(11) NOT NULL COMMENT '地级市',
  `district` bigint(11) NOT NULL COMMENT '区、县',
  `street` bigint(11) NOT NULL COMMENT '街道  乡镇',
  `post_code` varchar(10) NOT NULL DEFAULT '' COMMENT '邮编',
  `address` varchar(200) NOT NULL COMMENT '小区 单元  门牌号',
  `receiver` varchar(50) NOT NULL COMMENT '收件人姓名',
  `phone` varchar(20) NOT NULL COMMENT '电话   收件',
  `fixed_phone` varchar(20) NOT NULL COMMENT '固定电话   收件',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认收货地址： 1：是 ',
  `whole_addr` varchar(300) NOT NULL DEFAULT '' COMMENT '完整地址  国家  城市  区  街道 门牌号  冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_rank
-- ----------------------------
DROP TABLE IF EXISTS `t_user_rank`;
CREATE TABLE `t_user_rank` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '会员等级名称',
  `min_point` int(11) NOT NULL COMMENT '本等级会员的最小分边界（含等于）',
  `img` varchar(200) NOT NULL COMMENT '头像',
  `comment` varchar(500) NOT NULL COMMENT '等级说明',
  `discount` int(11) NOT NULL COMMENT '该等级会员享有的折扣',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for call_template_sku
-- ----------------------------
DROP PROCEDURE IF EXISTS `call_template_sku`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `call_template_sku`(IN `categoryId` int,IN `skuId` int)
BEGIN
	#Routine body goes here...

#   获取平台设置的规格值   #
SELECT ID,CATEGORY_ID,NAME,OPTIONS,TYPE,STATUS from t_category_template  where CATEGORY_ID = categoryId and type = 2;

#   获取商家设置的规格值    #
SELECT t.ID,t.CATEGORY_ID,t.NAME,t.TYPE,t.STATUS,ts.OPTIONS  from t_category_template t LEFT JOIN t_category_template_shop ts
ON t.id = ts.TEMPLATE_ID
WHERE t.CATEGORY_ID = categoryId AND type = 3;

#   获取指定sku的规格记录值  #
SELECT sku.ID as SKU_ID,sku.SKU_NO,sku.CATEGORY_ID,sku.PRODUCT_ID,sku.PRICE,sku.STOCK,sku_val.TEMPLATE_ID,sku_val.`VALUE` FROM t_product_sku sku LEFT JOIN t_sku_value sku_val
ON sku.ID = sku_val.SKU_ID
WHERE sku.ID = skuId;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for call_template_skus
-- ----------------------------
DROP PROCEDURE IF EXISTS `call_template_skus`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `call_template_skus`(categoryId INT, productId INT)
BEGIN

select * from t_category_template where category_id = categoryId and type = 2 order by value_order;

select * from t_product_sku where PRODUCT_ID = productId;

select val.*, tem.value_order from t_sku_value val 
INNER JOIN t_category_template tem on val.TEMPLATE_ID = tem.id
where PRODUCT_ID = productId;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextValueOrder
-- ----------------------------
DROP FUNCTION IF EXISTS `nextValueOrder`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nextValueOrder`( type INT, categoryId INT) RETURNS int(11)
BEGIN
DECLARE result INT;
if type=1 then
set result = 0;
return result;
ELSE
select (MAX(value_order)+1) into result  from t_category_template where category_id=categoryId;
set result = IFNULL(result,1);
end if;
RETURN result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for sequence_next_value
-- ----------------------------
DROP FUNCTION IF EXISTS `sequence_next_value`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sequence_next_value`(seq_name VARCHAR(50)) RETURNS bigint(20)
BEGIN  
         DECLARE value BIGINT;

         UPDATE t_sequence  
         SET current_value = current_value + increment  
         WHERE upper(table_name) = upper(seq_name);
				
				 SELECT current_value INTO value
         FROM t_sequence
         WHERE upper(table_name) = upper(seq_name); 

         RETURN value;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for trade_next_value
-- ----------------------------
DROP FUNCTION IF EXISTS `trade_next_value`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `trade_next_value`(trade_name2 VARCHAR(50)) RETURNS bigint(20)
BEGIN  
         DECLARE num int;
				 SET @date2 = date_format(current_timestamp, '%Y%m%d');
         UPDATE t_trade_date_num  
         SET current_num = current_num + 1  
         WHERE upper(trade_name) = upper(trade_name2) and date = @date2;
				 if ROW_COUNT()=1 then
					 SELECT current_num INTO num
					 FROM t_trade_date_num
					 WHERE upper(trade_name) = upper(trade_name2) and date = @date2;
				 ELSE
					INSERT t_trade_date_num(trade_name,date,current_num) VALUES (trade_name2,@date2,1000001);
					SELECT current_num INTO num
					FROM t_trade_date_num
					WHERE upper(trade_name) = upper(trade_name2) and date = @date2;
				end if;
				
				RETURN  @date2*10000000+num;
END
;;
DELIMITER ;
