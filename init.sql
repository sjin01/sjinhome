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
   name                 int comment '用户组名',
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


