-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 09 月 25 日 08:23
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `innovative_pro_db`
--
CREATE DATABASE IF NOT EXISTS `innovative_pro_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `innovative_pro_db`;

-- --------------------------------------------------------

--
-- 表的结构 `affair_pro_flow_t`
--

CREATE TABLE IF NOT EXISTS `affair_pro_flow_t` (
  `a_id` bigint(20) NOT NULL,
  `a_name` varchar(128) NOT NULL,
  `clas` varchar(64) DEFAULT NULL COMMENT '事务类字段',
  `step` int(11) NOT NULL DEFAULT '0',
  `step_name` varchar(32) DEFAULT NULL COMMENT '处理步骤名称',
  `people` varchar(256) DEFAULT NULL,
  `weight` varchar(128) DEFAULT NULL,
  `st` bigint(20) DEFAULT NULL,
  `et` bigint(20) DEFAULT NULL,
  `pro_t` varchar(32) DEFAULT 'now',
  `pass` varchar(64) DEFAULT 'd',
  `res_fb` varchar(128) DEFAULT 'd',
  `message` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`a_id`,`step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `affair_pro_t`
--

CREATE TABLE IF NOT EXISTS `affair_pro_t` (
  `id` bigint(20) NOT NULL,
  `o_id` bigint(20) NOT NULL,
  `a_id` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `proposer` bigint(20) NOT NULL,
  `processor` bigint(20) NOT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `rec_t` bigint(20) NOT NULL,
  `end_t` bigint(20) NOT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  `res` enum('pass','refuse','none') NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `affair_t`
--

CREATE TABLE IF NOT EXISTS `affair_t` (
  `id` bigint(20) NOT NULL,
  `a_id` bigint(20) NOT NULL,
  `apply_t` bigint(20) NOT NULL,
  `proposer` bigint(20) NOT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `res` varchar(32) NOT NULL,
  `r_t` bigint(20) NOT NULL,
  `att_path` varchar(128) DEFAULT NULL COMMENT '附件字段',
  `step_name` varchar(32) DEFAULT NULL COMMENT '当前所处阶段名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `field_info_t`
--

CREATE TABLE IF NOT EXISTS `field_info_t` (
  `id` int(11) NOT NULL,
  `com` varchar(64) NOT NULL,
  `campus` varchar(64) NOT NULL,
  `buliding` varchar(64) NOT NULL,
  `room` varchar(32) NOT NULL,
  `acc` int(11) DEFAULT NULL,
  `rek` varchar(256) DEFAULT NULL,
  `close` varchar(64) DEFAULT NULL,
  `map` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `field_use_t`
--

CREATE TABLE IF NOT EXISTS `field_use_t` (
  `id` int(11) NOT NULL,
  `time` varchar(64) DEFAULT NULL,
  `date` bigint(20) NOT NULL,
  `proposer` bigint(20) NOT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `state` enum('volid','valid') NOT NULL DEFAULT 'valid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `message_t`
--

CREATE TABLE IF NOT EXISTS `message_t` (
  `m_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sendTime` datetime DEFAULT NULL,
  `sender` bigint(20) NOT NULL,
  `reciver` bigint(20) NOT NULL,
  `message` varchar(3000) NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_id`),
  KEY `flag` (`flag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `news_t`
--

CREATE TABLE IF NOT EXISTS `news_t` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title1` varchar(140) NOT NULL,
  `title2` varchar(150) DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `publicer` varchar(60) NOT NULL COMMENT '发布人email',
  `public_t` datetime DEFAULT NULL,
  `submit_p` varchar(60) NOT NULL COMMENT '新闻作者email',
  `submit_t` datetime NOT NULL,
  `top_s` datetime DEFAULT NULL COMMENT '置顶起始时间，空表示不置顶',
  `top_e` datetime DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '0',
  `col` varchar(20) NOT NULL COMMENT '新闻发布栏目',
  `titile_image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `p_info_t`
--

CREATE TABLE IF NOT EXISTS `p_info_t` (
  `u_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `sex` enum('M','F') NOT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `sid` char(16) DEFAULT NULL,
  `major` char(64) DEFAULT NULL,
  `id` char(19) DEFAULT NULL,
  `com` varchar(64) DEFAULT NULL,
  `email` char(64) NOT NULL,
  `password` char(128) NOT NULL,
  `identity` enum('root','admin','member','chief','individual','expert','investor','tutor') NOT NULL DEFAULT 'individual',
  `reg_t` double NOT NULL,
  `state` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `active_key` varchar(128) NOT NULL COMMENT '激活码',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `race_t`
--

CREATE TABLE IF NOT EXISTS `race_t` (
  `race_id` varchar(32) NOT NULL COMMENT '比赛ID，race_xxx 为格式',
  `name` char(64) NOT NULL COMMENT '比赛名称',
  `r_st` bigint(20) NOT NULL COMMENT '比赛开始时间，时间戳',
  `r_et` bigint(20) NOT NULL COMMENT '比赛结束时间，时间戳',
  `banner_path` char(128) DEFAULT NULL COMMENT 'banner 路径',
  `template` char(128) DEFAULT NULL COMMENT '比赛宣传页模板路径',
  `s_st` bigint(20) NOT NULL COMMENT '报名开始时间，时间戳',
  `s_et` bigint(20) NOT NULL COMMENT '报名结束时间，时间戳',
  `rule_path` char(128) DEFAULT NULL COMMENT '比赛规则文件路径',
  `class` varchar(1024) DEFAULT NULL COMMENT '分组，JSON格式',
  `review` varchar(1024) DEFAULT NULL COMMENT '评委，JSON格式',
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0-未发布，1-发布，2-撤销',
  PRIMARY KEY (`race_id`),
  UNIQUE KEY `race_id` (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `team_info_t`
--

CREATE TABLE IF NOT EXISTS `team_info_t` (
  `t_id` char(19) NOT NULL,
  `t_name` char(64) NOT NULL,
  `reg_t` double NOT NULL,
  `chief` bigint(20) NOT NULL,
  `state` enum('disband','active','ban') NOT NULL DEFAULT 'active',
  `company` varchar(128) DEFAULT NULL COMMENT '是否成立公司字段',
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `t_id` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `team_mem_t`
--

CREATE TABLE IF NOT EXISTS `team_mem_t` (
  `t_id` char(19) NOT NULL,
  `m_id` bigint(20) NOT NULL,
  `state` enum('in','remove') NOT NULL DEFAULT 'in',
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `t_id` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
