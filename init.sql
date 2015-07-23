/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     4/22 15:12:11                                */
/*==============================================================*/


drop table if exists t_sys_dict;
drop table if exists t_sys_func;
drop table if exists t_sys_role;
drop table if exists t_sys_role_func;
drop table if exists t_sys_user;
drop table if exists t_sys_user_group;
drop table if exists t_sys_user_role;

/*==============================================================*/
/* table: t_sys_dict                                            */
/*==============================================================*/
create table t_sys_dict
(
   id                   int not null,
   code                 varchar(45),
   name                 varchar(45),
   type                 varchar(45),
   sort                 int,
   status               int comment '0：禁用；1：正常',
   primary key (id)
);

alter table t_sys_dict comment '配置数据字典';

/*==============================================================*/
/* table: t_sys_func                                            */
/*==============================================================*/
create table t_sys_func
(
   id                   int not null,
   name                 varchar(45),
   sort                 int,
   path                 varchar(512) comment '访问路径',
   pic                  varchar(512),
   pid                  int,
   type                 int comment '1：菜单；2：功能',
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_role                                            */
/*==============================================================*/
create table t_sys_role
(
   id                   int not null,
   name                 varchar(45),
   sort                 int,
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_role_func                                       */
/*==============================================================*/
create table t_sys_role_func
(
   id                   int not null,
   roleid               int,
   funcid               int,
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_user                                            */
/*==============================================================*/
create table t_sys_user
(
   id                   int not null,
   username             varchar(45) comment '用户名-登陆名',
   password             varchar(45) comment '登陆密码',
   nickname             varchar(45) comment '昵称',
   email                varchar(45) comment '电子邮箱',
   phone                varchar(45) comment '手机号码',
   status               int comment '状态：0未激活；1正常；2冻结',
   registerdate         datetime,
   registertype         int comment '注册方式：0管理员添加；1前台注册',
   usertype             int comment '0：普通用户；520：管理员; 999:超级管理员',
   groupid              int,
   primary key (id)
);

alter table t_sys_user comment '用户主表';

/*==============================================================*/
/* table: t_sys_user_group                                      */
/*==============================================================*/
create table t_sys_user_group
(
   id                   int not null,
   name                 varchar(45) comment '用户组名',
   status               int comment '1正常；0禁用',
   sort                 int,
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_user_role                                       */
/*==============================================================*/
create table t_sys_user_role
(
   id                   int not null,
   userid               int,
   roleid               int,
   primary key (id)
);

ALTER TABLE t_sys_dict CHANGE COLUMN id id INT(11) NOT NULL AUTO_INCREMENT  ;
ALTER TABLE t_sys_func CHANGE COLUMN id id INT(11) NOT NULL AUTO_INCREMENT  ;
ALTER TABLE t_sys_role CHANGE COLUMN id id INT(11) NOT NULL AUTO_INCREMENT  ;
ALTER TABLE t_sys_role_func CHANGE COLUMN id id INT(11) NOT NULL AUTO_INCREMENT  ;
ALTER TABLE t_sys_user CHANGE COLUMN id id INT(11) NOT NULL AUTO_INCREMENT  ;
ALTER TABLE t_sys_user_group CHANGE COLUMN id id INT(11) NOT NULL AUTO_INCREMENT  ;
ALTER TABLE t_sys_user_role CHANGE COLUMN id id INT(11) NOT NULL AUTO_INCREMENT  ;



drop table if exists t_tiemline;

/*==============================================================*/
/* table: t_tiemline                                            */
/*==============================================================*/
create table t_timeline
(
   id                   int not null auto_increment,
   type                 int comment '类型：1：sjin的成长；2：sjin于dcc；99：用户记录',
   year                 varchar(45),
   date                 varchar(45),
   txt                  varchar(255),
   version              varchar(45),
   primary key (id)
);

alter table t_tiemline comment '时间轴 主表t_tiemline';

drop table if exists t_timeline_more;

/*==============================================================*/
/* table: t_timeline_more                                       */
/*==============================================================*/
create table t_timeline_more
(
   id                   int not null auto_increment,
   tid                  int,
   txt                  varchar(255),
   sort                 int,
   primary key (id)
);

alter table t_timeline_more comment '时间轴更多说明：t_timeline_more';



CREATE TABLE t_doubleball_record (
  id int(11) NOT NULL AUTO_INCREMENT,
  period int(11) DEFAULT NULL COMMENT '开奖期号',
  value int(11) DEFAULT NULL COMMENT '开奖球号',
  type int(11) DEFAULT NULL COMMENT '1红球；2蓝球',
  PRIMARY KEY (id)
) ENGINE=InnoDB COMMENT = '开奖记录' ;

CREATE TABLE t_doubleball_conjecture (
  id INT NOT NULL AUTO_INCREMENT,
  period INT NULL,
  value INT NULL,
  type INT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  COMMENT = '我的推测';


CREATE TABLE t_doubleball_rule (
id  int NULL AUTO_INCREMENT COMMENT '主键' ,
code  varchar(20) NULL COMMENT '规则编号：如SH1 SL1 等' ,
txt  varchar(1024) NULL COMMENT '规则描述',
PRIMARY KEY (id)
) ENGINE=InnoDB  COMMENT = '杀球规则基础表';

CREATE TABLE t_doubleball_rule_analyze (
id  int NULL AUTO_INCREMENT COMMENT '主键' ,
code  varchar(20) NULL COMMENT '规则编号：如SH1 SL1 等' ,
period  int NULL COMMENT '期号' ,
analyze  varchar(200) NULL COMMENT '分析：多个号码用逗号分隔' ,
result  int NULL COMMENT '结果：1对；0错' ,
PRIMARY KEY (id)
) ENGINE=InnoDB  COMMENT = '杀球规则分析表';

create table t_doubleball_record_feature (
   id                   int not null auto_increment comment '主键',
   period               int comment '开奖期号',
   partition3           varchar(20) comment '1-11、12-22、23-33三个分区的比例；如2-2-2',
   partition4           varchar(20) comment '1-8、9-16、18-25、26-33四个分区的比例；如2-2-2-0',
   partition7           varchar(20) comment '1-5、6-10、11-15、16-20、21-25、26-30、31-33七个分区的比例；如2-2-2-0-0-0-0',
   partition3break      varchar(20) comment '多个用“，”逗号隔开',
   partition4break      varchar(20) comment '多个用“，”逗号隔开',
   partition7break      varchar(20) comment '多个用“，”逗号隔开',
   size                 varchar(10),
   oddeven              varchar(10),
   sum                  int,
   span                 int,
   first                int,
   last                 int,
   primary key (id)
) engine=innodb comment = '开奖记录特征';





