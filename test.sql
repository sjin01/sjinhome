/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-07-15 16:33:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_doubleball_conjecture
-- ----------------------------
DROP TABLE IF EXISTS t_doubleball_conjecture;
CREATE TABLE t_doubleball_conjecture (
  id int(11) NOT NULL AUTO_INCREMENT,
  period int(11) DEFAULT NULL,
  value int(11) DEFAULT NULL,
  type int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的推测';

-- ----------------------------
-- Records of t_doubleball_conjecture
-- ----------------------------

-- ----------------------------
-- Table structure for t_doubleball_record
-- ----------------------------
DROP TABLE IF EXISTS t_doubleball_record;
CREATE TABLE t_doubleball_record (
  id int(11) NOT NULL AUTO_INCREMENT,
  period int(11) DEFAULT NULL COMMENT '开奖期号',
  value int(11) DEFAULT NULL COMMENT '开奖球号',
  type int(11) DEFAULT NULL COMMENT '1红球；2蓝球',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COMMENT='开奖记录';

-- ----------------------------
-- Records of t_doubleball_record
-- ----------------------------
INSERT INTO t_doubleball_record VALUES ('92', '2014009', '1', '11');
INSERT INTO t_doubleball_record VALUES ('93', '2014009', '3', '12');
INSERT INTO t_doubleball_record VALUES ('94', '2014009', '22', '13');
INSERT INTO t_doubleball_record VALUES ('95', '2014009', '4', '14');
INSERT INTO t_doubleball_record VALUES ('96', '2014009', '5', '15');
INSERT INTO t_doubleball_record VALUES ('97', '2014009', '16', '16');
INSERT INTO t_doubleball_record VALUES ('98', '2014009', '12', '2');
INSERT INTO t_doubleball_record VALUES ('127', '2014011', '11', '11');
INSERT INTO t_doubleball_record VALUES ('128', '2014011', '22', '12');
INSERT INTO t_doubleball_record VALUES ('129', '2014011', '3', '13');
INSERT INTO t_doubleball_record VALUES ('130', '2014011', '4', '14');
INSERT INTO t_doubleball_record VALUES ('131', '2014011', '5', '15');
INSERT INTO t_doubleball_record VALUES ('132', '2014011', '6', '16');
INSERT INTO t_doubleball_record VALUES ('133', '2014011', '5', '2');
INSERT INTO t_doubleball_record VALUES ('141', '2014010', '12', '11');
INSERT INTO t_doubleball_record VALUES ('142', '2014010', '13', '12');
INSERT INTO t_doubleball_record VALUES ('143', '2014010', '2', '13');
INSERT INTO t_doubleball_record VALUES ('144', '2014010', '24', '14');
INSERT INTO t_doubleball_record VALUES ('145', '2014010', '25', '15');
INSERT INTO t_doubleball_record VALUES ('146', '2014010', '3', '16');
INSERT INTO t_doubleball_record VALUES ('147', '2014010', '16', '2');

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS t_sys_dict;
CREATE TABLE t_sys_dict (
  id int(11) NOT NULL AUTO_INCREMENT,
  code varchar(45) DEFAULT NULL,
  name varchar(45) DEFAULT NULL,
  type varchar(45) DEFAULT NULL,
  sort int(11) DEFAULT NULL,
  status int(11) DEFAULT NULL COMMENT '0：禁用；1：正常',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置数据字典';

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_func
-- ----------------------------
DROP TABLE IF EXISTS t_sys_func;
CREATE TABLE t_sys_func (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(45) DEFAULT NULL,
  sort int(11) DEFAULT NULL,
  path varchar(512) DEFAULT NULL COMMENT '访问路径',
  pic varchar(512) DEFAULT NULL,
  pid int(11) DEFAULT NULL,
  type int(11) DEFAULT NULL COMMENT '1：菜单；2：功能',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_func
-- ----------------------------
INSERT INTO t_sys_func VALUES ('10', '系统管理', '1', '/', 'fa-cogs', '0', '1');
INSERT INTO t_sys_func VALUES ('11', '用户管理', '2', '/', 'fa-user', '0', '1');
INSERT INTO t_sys_func VALUES ('12', '双色球分析', '3', '/', 'fa-trophy', '0', '1');
INSERT INTO t_sys_func VALUES ('13', '功能菜单', '1', '/manage/func', null, '10', '1');
INSERT INTO t_sys_func VALUES ('14', '数据字典', '2', '/manage/dict', null, '10', '1');
INSERT INTO t_sys_func VALUES ('15', '用户管理', '1', '/manage/user', null, '11', '1');
INSERT INTO t_sys_func VALUES ('16', '用户组管理', '2', '/manage/usergroup', null, '11', '1');
INSERT INTO t_sys_func VALUES ('17', '历史记录', '1', '/manage/ssq/record', null, '12', '1');
INSERT INTO t_sys_func VALUES ('18', '分析', '2', '/manage/ssq/analyze', null, '12', '1');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS t_sys_role;
CREATE TABLE t_sys_role (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(45) DEFAULT NULL,
  sort int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_role_func
-- ----------------------------
DROP TABLE IF EXISTS t_sys_role_func;
CREATE TABLE t_sys_role_func (
  id int(11) NOT NULL,
  roleid int(11) DEFAULT NULL,
  funcid int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role_func
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS t_sys_user;
CREATE TABLE t_sys_user (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) DEFAULT NULL COMMENT '用户名-登陆名',
  password varchar(45) DEFAULT NULL COMMENT '登陆密码',
  nickname varchar(45) DEFAULT NULL COMMENT '昵称',
  email varchar(45) DEFAULT NULL COMMENT '电子邮箱',
  phone varchar(45) DEFAULT NULL COMMENT '手机号码',
  status int(11) DEFAULT NULL COMMENT '状态：0未激活；1正常；2冻结',
  registerdate datetime DEFAULT NULL,
  registertype int(11) DEFAULT NULL COMMENT '注册方式：0管理员添加；1前台注册',
  usertype int(11) DEFAULT NULL COMMENT '1：普通用户；0：管理员',
  groupid int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO t_sys_user VALUES ('1', 'admin', 'zxc', 'S.Jin.SuperAdmin', '928990049@qq.com', '15576652266', '1', '2015-02-08 00:00:00', '0', '999', null);
INSERT INTO t_sys_user VALUES ('2', 'guanshj', '202129', 'S.Jin.Admin', 'xiao_wen202129@126.com', '15576652266', '1', '2015-05-06 09:25:26', '0', '520', null);
INSERT INTO t_sys_user VALUES ('3', 'sjin', '202129', 'S.Jin', 'xiao_wen202129@163.com', '15576652266', '1', '2015-07-07 15:18:52', '0', '0', null);

-- ----------------------------
-- Table structure for t_sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS t_sys_user_group;
CREATE TABLE t_sys_user_group (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(45) DEFAULT NULL COMMENT '用户组名',
  status int(11) DEFAULT NULL COMMENT '1正常；0禁用',
  sort int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user_group
-- ----------------------------
INSERT INTO t_sys_user_group VALUES ('10', '66', '1', '6');
INSERT INTO t_sys_user_group VALUES ('11', '123123', '1', '123123123');
INSERT INTO t_sys_user_group VALUES ('12', '12', '1', '12');
INSERT INTO t_sys_user_group VALUES ('14', '8', '1', '9');
INSERT INTO t_sys_user_group VALUES ('15', '77', '1', '77');
INSERT INTO t_sys_user_group VALUES ('16', '123', '1', '123');
INSERT INTO t_sys_user_group VALUES ('17', '普通用户', '1', '1');
INSERT INTO t_sys_user_group VALUES ('19', '1', '1', '1');

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS t_sys_user_role;
CREATE TABLE t_sys_user_role (
  id int(11) NOT NULL AUTO_INCREMENT,
  userid int(11) DEFAULT NULL,
  roleid int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_timeline
-- ----------------------------
DROP TABLE IF EXISTS t_timeline;
CREATE TABLE t_timeline (
  id int(11) NOT NULL AUTO_INCREMENT,
  type int(11) DEFAULT NULL COMMENT '类型：1：sjin的成长；2：sjin于dcc；99：用户记录',
  year varchar(45) DEFAULT NULL,
  date varchar(45) DEFAULT NULL,
  txt varchar(255) DEFAULT NULL,
  version varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='时间轴 主表t_timeline';

-- ----------------------------
-- Records of t_timeline
-- ----------------------------
INSERT INTO t_timeline VALUES ('1', '1', '1988 以前', null, '这个世界上还没有S.Jin', '');
INSERT INTO t_timeline VALUES ('2', '1', '1989', null, '不知道从什么时候出现在妈妈肚子里', null);
INSERT INTO t_timeline VALUES ('3', '1', '1990', '3.15', '终于，来到这世界上', null);
INSERT INTO t_timeline VALUES ('4', '1', '1990', '4.15', '满月', null);

-- ----------------------------
-- Table structure for t_timeline_more
-- ----------------------------
DROP TABLE IF EXISTS t_timeline_more;
CREATE TABLE t_timeline_more (
  id int(11) NOT NULL AUTO_INCREMENT,
  tid int(11) DEFAULT NULL,
  txt varchar(255) DEFAULT NULL,
  sort int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='时间轴更多说明：t_timeline_more';

-- ----------------------------
-- Records of t_timeline_more
-- ----------------------------
INSERT INTO t_timeline_more VALUES ('1', '3', '湖南长沙芙蓉区某医院', '1');
INSERT INTO t_timeline_more VALUES ('2', '3', '早上8点半到9点之间', '2');
INSERT INTO t_timeline_more VALUES ('3', '2', '你知道，这通常充满了意外', '1');
INSERT INTO t_timeline_more VALUES ('4', '4', '呆萌一个', '1');


