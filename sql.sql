#生活服务分类表
CREATE TABLE `o2o_category`(
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `parent_id` INT(10) UNSIGNED NOT NULL DEFAULT 0,
    `listorder` INT(8) UNSIGNED NOT NULL DEFAULT 0,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY parent_id(`parent_id`)
)ENGINE INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#城市表
CREATE TABLE `o2o_city`(
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `uname` VARCHAR(50) NOT NULL DEFAULT '',
    `parent_id` INT(10) UNSIGNED NOT NULL DEFAULT 0,
    `listorder` INT(8) UNSIGNED NOT NULL DEFAULT 0,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY parent_id(`parent_id`),
    UNIQUE KEY uname(`uname`)
)ENGINE INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#商圈表
CREATE TABLE `o2o_area`(
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `city_id` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `parent_id` INT(10) UNSIGNED NOT NULL DEFAULT 0,
    `listorder` INT(8) UNSIGNED NOT NULL DEFAULT 0,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY parent_id(`parent_id`),
    KEY city_id(`city_id`)
)ENGINE INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#商户表
CREATE TABLE `o2o_bis`(
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `email` VARCHAR(50) NOT NULL DEFAULT '',
    `logo` VARCHAR(255) NOT NULL DEFAULT '',
    `licence_logo` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '营业执照',
    `description` TEXT NOT NULL,
    `city_id` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `city_path` VARCHAR(50) NOT NULL DEFAULT '',
    `bank_info` VARCHAR(50) NOT NULL DEFAULT '',
    `money` DECIMAL(20,2) NOT NULL DEFAULT '0.00',
    `bank_name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '开户行名称',
    `bank_user` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '开户人',
    `faren` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '法人',
    `faren_tel` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '法人联系方式',
    `listorder` INT(8) UNSIGNED NOT NULL DEFAULT 0,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY NAME(`name`),
    KEY city_id(`city_id`)
)ENGINE INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#商户账号表
CREATE TABLE `o2o_bis_account`(
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(50) NOT NULL DEFAULT '',
    `password` CHAR(32) NOT NULL DEFAULT '',
    `code` VARCHAR(10) NOT NULL DEFAULT '',
    `bis_id` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `last_login_ip` VARCHAR(20) NOT NULL DEFAULT '',
    `last_login_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `is_main` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是总点',
    `listorder` INT(8) UNSIGNED NOT NULL DEFAULT 0,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY username(`username`),
    KEY bis_id(`bis_id`)
)ENGINE INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#商户门店表
CREATE TABLE `o2o_bis_location`(
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `logo` VARCHAR(255) NOT NULL DEFAULT '',
    `address` VARCHAR(255) NOT NULL DEFAULT '',
    `tel` VARCHAR(20) NOT NULL DEFAULT '',
    `contact` VARCHAR(20) NOT NULL DEFAULT '',
    `xpoint` VARCHAR(20)NOT NULL DEFAULT '' COMMENT '经度',
    `ypoint` VARCHAR(20)NOT NULL DEFAULT '' COMMENT '维度',
    `bis_id` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `open_time` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '营业时间',
    `content` TEXT NOT NULL COMMENT '门店介绍',
    `is_main` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是总店',
    `api_address` VARCHAR(255) NOT NULL DEFAULT '',
    `city_id` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `city_path` VARCHAR(50) NOT NULL DEFAULT '',
    `category_id` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `category_path` VARCHAR(50) NOT NULL DEFAULT '',
    `bank_info` VARCHAR(50) NOT NULL DEFAULT '',
    `listorder` INT(8) UNSIGNED NOT NULL DEFAULT 0,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY NAME(`name`),
    KEY city_id(`city_id`),
    KEY bis_id(`bis_id`),
    KEY category_id(`category_id`)
)ENGINE INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#团购商品表
CREATE TABLE `o2o_deal`(
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL DEFAULT '',
    `category_id` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `se_category_id` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二级栏目',
    `bis_id` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `location_ids` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '所属店面',
    `image` VARCHAR(200) NOT NULL DEFAULT '',
    `description` TEXT NOT NULL,
    `start_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `end_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `origin_price` DECIMAL(20,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
    `current_price` DECIMAL(20,2) NOT NULL DEFAULT '0.00' COMMENT '当前价',
    `city_id` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品所属城市',
    `buy_count` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品购买了多少份',
    `total_count` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品总数',
    `coupons_begin_time` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团购券开始时间',
    `coupons_end_time` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团购券结束时间',
    `xpoint` VARCHAR(20)NOT NULL DEFAULT '' COMMENT '经度',
    `ypoint` VARCHAR(20)NOT NULL DEFAULT '' COMMENT '维度',
    `bis_account_id` INT(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家id',
    `balance_price` DECIMAL(20,2) NOT NULL DEFAULT '0.00' COMMENT '结算价',
    `notice` TEXT NOT NULL COMMENT '商品提示',
    `listorder` INT(8) UNSIGNED NOT NULL DEFAULT 0,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY category_id(`category_id`),
    KEY se_category_id(`se_category_id`),
    KEY city_id(`city_id`),
    KEY start_time(`start_time`),
    KEY end_time(`end_time`)
)ENGINE INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#前台客户表
CREATE TABLE `o2o_user`(
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL DEFAULT '',
    `password` CHAR(32) NOT NULL DEFAULT '',
    `code` VARCHAR(10) NOT NULL DEFAULT '',
    `last_login_ip` VARCHAR(20) NOT NULL DEFAULT '',
    `last_login_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `email` VARCHAR(30) NOT NULL DEFAULT '',
    `mobile` VARCHAR(20) NOT NULL DEFAULT '',
    `listorder` INT(8) UNSIGNED NOT NULL DEFAULT 0,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY username(`username`),
    UNIQUE KEY email(`email`)
)ENGINE INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#推荐位表
CREATE TABLE `o2o_featured`(
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    `title` VARCHAR(30) NOT NULL DEFAULT '',
    `image` VARCHAR(255) NOT NULL DEFAULT '',
    `url` VARCHAR(255) NOT NULL DEFAULT '',
    `description` VARCHAR(255) NOT NULL DEFAULT '',
    `listorder` INT(8) UNSIGNED NOT NULL DEFAULT 0,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    `create_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    `update_time` INT(11) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
)ENGINE INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
