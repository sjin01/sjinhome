drop table if exists t_timeline;

/*==============================================================*/
/* table: t_timeline                                            */
/*==============================================================*/
create table t_timeline
(
   id                   int(11) not null auto_increment,
   type                 tinyint(4) comment '类型：1：sjin的成长；2：sjin于dcc；99：用户记录',
   year                 varchar(64),
   date                 varchar(64),
   txt                  varchar(512),
   version              varchar(64),
   primary key (id)
);

alter table t_timeline comment '时间轴 主表t_timeline';


drop table if exists t_timeline_more;

/*==============================================================*/
/* table: t_timeline_more                                       */
/*==============================================================*/
create table t_timeline_more
(
   id                   int(11) not null auto_increment,
   tid                  int(11),
   txt                  varchar(512),
   sort                 int(11),
   primary key (id)
);

alter table t_timeline_more comment '时间轴更多说明：t_timeline_more';



insert into t_timeline values ('1', '1', '1988 以前', null, '这个世界上还没有s.jin', '');
insert into t_timeline values ('2', '1', '1989', null, '不知道从什么时候出现在妈妈肚子里', null);
insert into t_timeline values ('3', '1', '1990', '3.15', '终于，来到这世界上', null);
insert into t_timeline values ('4', '1', '1990', '4.15', '满月', null);

insert into t_timeline_more values ('1', '3', '湖南长沙芙蓉区某医院', '1');
insert into t_timeline_more values ('2', '3', '早上8点半到9点之间', '2');
insert into t_timeline_more values ('3', '2', '你知道，这通常充满了意外', '1');
insert into t_timeline_more values ('4', '4', '呆萌一个', '1');


drop table if exists t_doubleball_conjecture;

drop table if exists t_doubleball_record;

drop table if exists t_doubleball_record_feature;

drop table if exists t_doubleball_rule;

drop table if exists t_doubleball_rule_analyze;

drop table if exists t_sys_dict;

drop table if exists t_sys_func;

drop table if exists t_sys_role;

drop table if exists t_sys_role_func;

drop table if exists t_sys_user;

drop table if exists t_sys_user_group;

drop table if exists t_sys_user_role;

/*==============================================================*/
/* table: t_doubleball_conjecture                               */
/*==============================================================*/
create table t_doubleball_conjecture
(
   id                   int(11) not null auto_increment,
   period               int(11) comment '开奖期号',
   value                int(11) comment '开奖球号',
   type                 tinyint(4) comment '1红球；2蓝球',
   primary key (id)
);

alter table t_doubleball_conjecture comment '我的推测';

/*==============================================================*/
/* table: t_doubleball_record                                   */
/*==============================================================*/
create table t_doubleball_record
(
   id                   int(11) not null auto_increment,
   period               int(11) comment '开奖期号',
   value                int(11) comment '开奖球号',
   type                 tinyint(4) comment '1红球；2蓝球',
   primary key (id)
);

alter table t_doubleball_record comment '开奖记录';

/*==============================================================*/
/* table: t_doubleball_record_feature                           */
/*==============================================================*/
create table t_doubleball_record_feature
(
   id                   int(11) not null auto_increment comment '主键',
   period               int(11) comment '开奖期号',
   partition3           varchar(64) comment '1-11、12-22、23-33三个分区的比例；如2-2-2',
   partition4           varchar(64) comment '1-8、9-16、18-25、26-33四个分区的比例；如2-2-2-0',
   partition7           varchar(64) comment '1-5、6-10、11-15、16-20、21-25、26-30、31-33七个分区的比例；如2-2-2-0-0-0-0',
   partition3break      varchar(64) comment '多个用“，”逗号隔开',
   partition4break      varchar(64) comment '多个用“，”逗号隔开',
   partition7break      varchar(64) comment '多个用“，”逗号隔开',
   size                 varchar(64),
   oddeven              varchar(64),
   sum                  int(11),
   span                 int(11),
   first                int(11),
   last                 int(11),
   primary key (id)
);

alter table t_doubleball_record_feature comment '开奖记录特征';

/*==============================================================*/
/* table: t_doubleball_rule                                     */
/*==============================================================*/
create table t_doubleball_rule
(
   id                   int(11) not null auto_increment comment '主键',
   code                 varchar(64) comment '规则编号：如sh1、sh2 ，sl1、sl2 等',
   txt                  varchar(1024),
   primary key (id)
);

alter table t_doubleball_rule comment '杀球规则基础表';

/*==============================================================*/
/* table: t_doubleball_rule_analyze                             */
/*==============================================================*/
create table t_doubleball_rule_analyze
(
   id                   int(11) not null auto_increment,
   code                 varchar(64) comment '规则编号：如sh1 sl1 等',
   period               int(11) comment '期号',
   sys_analyze          varchar(512) comment '分析：多个号码用逗号分隔',
   result               tinyint(4) comment '结果：1对；0错',
   primary key (id)
);

alter table t_doubleball_rule_analyze comment '杀球规则分析表';

/*==============================================================*/
/* table: t_sys_dict                                            */
/*==============================================================*/
create table t_sys_dict
(
   id                   int(11) not null auto_increment,
   code                 varchar(64),
   name                 varchar(64),
   type                 varchar(64),
   sort                 int(11),
   status               tinyint(1) comment '0：禁用；1：正常',
   primary key (id)
);

alter table t_sys_dict comment '配置数据字典';

/*==============================================================*/
/* table: t_sys_func                                            */
/*==============================================================*/
create table t_sys_func
(
   id                   int(11) not null auto_increment,
   name                 varchar(32),
   sort                 int(11),
   path                 varchar(512) comment '访问路径',
   pic                  varchar(512),
   pid                  int(11),
   type                 tinyint(4) comment '1：菜单；2：功能',
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_role                                            */
/*==============================================================*/
create table t_sys_role
(
   id                   int(11) not null auto_increment,
   name                 varchar(32),
   sort                 int(11),
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_role_func                                       */
/*==============================================================*/
create table t_sys_role_func
(
   id                   int(11) not null auto_increment,
   roleid               int(11),
   funcid               int(11),
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_user                                            */
/*==============================================================*/
create table t_sys_user
(
   id                   int(11) not null auto_increment,
   username             varchar(64) comment '用户名-登陆名',
   password             varchar(64) comment '登陆密码',
   nickname             varchar(64) comment '昵称',
   email                varchar(64) comment '电子邮箱',
   phone                varchar(64) comment '手机号码',
   status               tinyint(1) comment '状态：0未激活；1正常；2冻结',
   registerdate         datetime,
   registertype         tinyint(4) comment '注册方式：0管理员添加；1前台注册',
   usertype             int(11) comment '1：普通用户；0：管理员',
   groupid              int(11),
   primary key (id)
);

alter table t_sys_user comment '用户主表';

/*==============================================================*/
/* table: t_sys_user_group                                      */
/*==============================================================*/
create table t_sys_user_group
(
   id                   int(11) not null auto_increment,
   name                 varchar(64) comment '用户组名',
   status               tinyint(1) comment '1正常；0禁用',
   sort                 int(11),
   primary key (id)
);

/*==============================================================*/
/* table: t_sys_user_role                                       */
/*==============================================================*/
create table t_sys_user_role
(
   id                   int(11) not null auto_increment,
   userid               int(11),
   roleid               int(11),
   primary key (id)
);



insert into t_sys_func values ('10', '系统管理', '1', '/', 'fa-cogs', '0', '1');
insert into t_sys_func values ('11', '用户管理', '2', '/', 'fa-user', '0', '1');
insert into t_sys_func values ('12', '双色球分析', '3', '/', 'fa-trophy', '0', '1');
insert into t_sys_func values ('13', '功能菜单', '1', '/manage/func', null, '10', '1');
insert into t_sys_func values ('14', '数据字典', '2', '/manage/dict', null, '10', '1');
insert into t_sys_func values ('15', '用户管理', '1', '/manage/user', null, '11', '1');
insert into t_sys_func values ('16', '用户组管理', '2', '/manage/usergroup', null, '11', '1');
insert into t_sys_func values ('17', '历史记录', '1', '/manage/ssq/record', null, '12', '1');
insert into t_sys_func values ('18', '分析', '2', '/manage/ssq/analyze', null, '12', '1');

insert into t_sys_user values ('1', 'admin', 'zxc', 's.jin.superadmin', '928990049@qq.com', '15576652266', '1', '2015-02-08 00:00:00', '0', '999', null);
insert into t_sys_user values ('2', 'guanshj', '202129', 's.jin.admin', 'xiao_wen202129@126.com', '15576652266', '1', '2015-05-06 09:25:26', '0', '520', null);
insert into t_sys_user values ('3', 'sjin', '202129', 's.jin', 'xiao_wen202129@163.com', '15576652266', '1', '2015-07-07 15:18:52', '0', '0', null);


insert into t_sys_user_group values ('1', '普通用户', '1', '1');


