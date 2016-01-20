DROP TABLE IF EXISTS T_TIMELINE;

/*==============================================================*/
/* Table: T_TIMELINE                                            */
/*==============================================================*/
CREATE TABLE T_TIMELINE
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   TYPE                 TINYINT(4) COMMENT '类型：1：sjin的成长；2：sjin于dcc；99：用户记录',
   YEAR                 VARCHAR(64),
   DATE                 VARCHAR(64),
   TXT                  VARCHAR(512),
   VERSION              VARCHAR(64),
   PRIMARY KEY (ID)
);

ALTER TABLE T_TIMELINE COMMENT '时间轴 主表t_timeline';


DROP TABLE IF EXISTS T_TIMELINE_MORE;

/*==============================================================*/
/* Table: T_TIMELINE_MORE                                       */
/*==============================================================*/
CREATE TABLE T_TIMELINE_MORE
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   TID                  INT(11),
   TXT                  VARCHAR(512),
   SORT                 INT(11),
   PRIMARY KEY (ID)
);

ALTER TABLE T_TIMELINE_MORE COMMENT '时间轴更多说明：t_timeline_more';



INSERT INTO t_timeline VALUES ('1', '1', '1988 以前', null, '这个世界上还没有S.Jin', '');
INSERT INTO t_timeline VALUES ('2', '1', '1989', null, '不知道从什么时候出现在妈妈肚子里', null);
INSERT INTO t_timeline VALUES ('3', '1', '1990', '3.15', '终于，来到这世界上', null);
INSERT INTO t_timeline VALUES ('4', '1', '1990', '4.15', '满月', null);

INSERT INTO t_timeline_more VALUES ('1', '3', '湖南长沙芙蓉区某医院', '1');
INSERT INTO t_timeline_more VALUES ('2', '3', '早上8点半到9点之间', '2');
INSERT INTO t_timeline_more VALUES ('3', '2', '你知道，这通常充满了意外', '1');
INSERT INTO t_timeline_more VALUES ('4', '4', '呆萌一个', '1');


DROP TABLE IF EXISTS T_DOUBLEBALL_CONJECTURE;

DROP TABLE IF EXISTS T_DOUBLEBALL_RECORD;

DROP TABLE IF EXISTS T_DOUBLEBALL_RECORD_FEATURE;

DROP TABLE IF EXISTS T_DOUBLEBALL_RULE;

DROP TABLE IF EXISTS T_DOUBLEBALL_RULE_ANALYZE;

DROP TABLE IF EXISTS T_SYS_DICT;

DROP TABLE IF EXISTS T_SYS_FUNC;

DROP TABLE IF EXISTS T_SYS_ROLE;

DROP TABLE IF EXISTS T_SYS_ROLE_FUNC;

DROP TABLE IF EXISTS T_SYS_USER;

DROP TABLE IF EXISTS T_SYS_USER_GROUP;

DROP TABLE IF EXISTS T_SYS_USER_ROLE;

/*==============================================================*/
/* Table: T_DOUBLEBALL_CONJECTURE                               */
/*==============================================================*/
CREATE TABLE T_DOUBLEBALL_CONJECTURE
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   PERIOD               INT(11) COMMENT '开奖期号',
   VALUE                INT(11) COMMENT '开奖球号',
   TYPE                 TINYINT(4) COMMENT '1红球；2蓝球',
   PRIMARY KEY (ID)
);

ALTER TABLE T_DOUBLEBALL_CONJECTURE COMMENT '我的推测';

/*==============================================================*/
/* Table: T_DOUBLEBALL_RECORD                                   */
/*==============================================================*/
CREATE TABLE T_DOUBLEBALL_RECORD
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   PERIOD               INT(11) COMMENT '开奖期号',
   VALUE                INT(11) COMMENT '开奖球号',
   TYPE                 TINYINT(4) COMMENT '1红球；2蓝球',
   PRIMARY KEY (ID)
);

ALTER TABLE T_DOUBLEBALL_RECORD COMMENT '开奖记录';

/*==============================================================*/
/* Table: T_DOUBLEBALL_RECORD_FEATURE                           */
/*==============================================================*/
CREATE TABLE T_DOUBLEBALL_RECORD_FEATURE
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
   PERIOD               INT(11) COMMENT '开奖期号',
   PARTITION3           VARCHAR(64) COMMENT '1-11、12-22、23-33三个分区的比例；如2-2-2',
   PARTITION4           VARCHAR(64) COMMENT '1-8、9-16、18-25、26-33四个分区的比例；如2-2-2-0',
   PARTITION7           VARCHAR(64) COMMENT '1-5、6-10、11-15、16-20、21-25、26-30、31-33七个分区的比例；如2-2-2-0-0-0-0',
   PARTITION3BREAK      VARCHAR(64) COMMENT '多个用“，”逗号隔开',
   PARTITION4BREAK      VARCHAR(64) COMMENT '多个用“，”逗号隔开',
   PARTITION7BREAK      VARCHAR(64) COMMENT '多个用“，”逗号隔开',
   SIZE                 VARCHAR(64),
   ODDEVEN              VARCHAR(64),
   SUM                  INT(11),
   SPAN                 INT(11),
   FIRST                INT(11),
   LAST                 INT(11),
   PRIMARY KEY (ID)
);

ALTER TABLE T_DOUBLEBALL_RECORD_FEATURE COMMENT '开奖记录特征';

/*==============================================================*/
/* Table: T_DOUBLEBALL_RULE                                     */
/*==============================================================*/
CREATE TABLE T_DOUBLEBALL_RULE
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
   CODE                 VARCHAR(64) COMMENT '规则编号：如SH1、SH2 ，SL1、SL2 等',
   TXT                  VARCHAR(1024),
   PRIMARY KEY (ID)
);

ALTER TABLE T_DOUBLEBALL_RULE COMMENT '杀球规则基础表';

/*==============================================================*/
/* Table: T_DOUBLEBALL_RULE_ANALYZE                             */
/*==============================================================*/
CREATE TABLE T_DOUBLEBALL_RULE_ANALYZE
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   CODE                 VARCHAR(64) COMMENT '规则编号：如SH1 SL1 等',
   PERIOD               INT(11) COMMENT '期号',
   SYS_ANALYZE          VARCHAR(512) COMMENT '分析：多个号码用逗号分隔',
   RESULT               TINYINT(4) COMMENT '结果：1对；0错',
   PRIMARY KEY (ID)
);

ALTER TABLE T_DOUBLEBALL_RULE_ANALYZE COMMENT '杀球规则分析表';

/*==============================================================*/
/* Table: T_SYS_DICT                                            */
/*==============================================================*/
CREATE TABLE T_SYS_DICT
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   CODE                 VARCHAR(64),
   NAME                 VARCHAR(64),
   TYPE                 VARCHAR(64),
   SORT                 INT(11),
   STATUS               TINYINT(1) COMMENT '0：禁用；1：正常',
   PRIMARY KEY (ID)
);

ALTER TABLE T_SYS_DICT COMMENT '配置数据字典';

/*==============================================================*/
/* Table: T_SYS_FUNC                                            */
/*==============================================================*/
CREATE TABLE T_SYS_FUNC
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   NAME                 VARCHAR(32),
   SORT                 INT(11),
   PATH                 VARCHAR(512) COMMENT '访问路径',
   PIC                  VARCHAR(512),
   PID                  INT(11),
   TYPE                 TINYINT(4) COMMENT '1：菜单；2：功能',
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: T_SYS_ROLE                                            */
/*==============================================================*/
CREATE TABLE T_SYS_ROLE
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   NAME                 VARCHAR(32),
   SORT                 INT(11),
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: T_SYS_ROLE_FUNC                                       */
/*==============================================================*/
CREATE TABLE T_SYS_ROLE_FUNC
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   ROLEID               INT(11),
   FUNCID               INT(11),
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: T_SYS_USER                                            */
/*==============================================================*/
CREATE TABLE T_SYS_USER
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   USERNAME             VARCHAR(64) COMMENT '用户名-登陆名',
   PASSWORD             VARCHAR(64) COMMENT '登陆密码',
   NICKNAME             VARCHAR(64) COMMENT '昵称',
   EMAIL                VARCHAR(64) COMMENT '电子邮箱',
   PHONE                VARCHAR(64) COMMENT '手机号码',
   STATUS               TINYINT(1) COMMENT '状态：0未激活；1正常；2冻结',
   REGISTERDATE         DATETIME,
   REGISTERTYPE         TINYINT(4) COMMENT '注册方式：0管理员添加；1前台注册',
   USERTYPE             INT(11) COMMENT '1：普通用户；0：管理员',
   GROUPID              INT(11),
   PRIMARY KEY (ID)
);

ALTER TABLE T_SYS_USER COMMENT '用户主表';

/*==============================================================*/
/* Table: T_SYS_USER_GROUP                                      */
/*==============================================================*/
CREATE TABLE T_SYS_USER_GROUP
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   NAME                 VARCHAR(64) COMMENT '用户组名',
   STATUS               TINYINT(1) COMMENT '1正常；0禁用',
   SORT                 INT(11),
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: T_SYS_USER_ROLE                                       */
/*==============================================================*/
CREATE TABLE T_SYS_USER_ROLE
(
   ID                   INT(11) NOT NULL AUTO_INCREMENT,
   USERID               INT(11),
   ROLEID               INT(11),
   PRIMARY KEY (ID)
);



INSERT INTO t_sys_func VALUES ('10', '系统管理', '1', '/', 'fa-cogs', '0', '1');
INSERT INTO t_sys_func VALUES ('11', '用户管理', '2', '/', 'fa-user', '0', '1');
INSERT INTO t_sys_func VALUES ('12', '双色球分析', '3', '/', 'fa-trophy', '0', '1');
INSERT INTO t_sys_func VALUES ('13', '功能菜单', '1', '/manage/func', null, '10', '1');
INSERT INTO t_sys_func VALUES ('14', '数据字典', '2', '/manage/dict', null, '10', '1');
INSERT INTO t_sys_func VALUES ('15', '用户管理', '1', '/manage/user', null, '11', '1');
INSERT INTO t_sys_func VALUES ('16', '用户组管理', '2', '/manage/usergroup', null, '11', '1');
INSERT INTO t_sys_func VALUES ('17', '历史记录', '1', '/manage/ssq/record', null, '12', '1');
INSERT INTO t_sys_func VALUES ('18', '分析', '2', '/manage/ssq/analyze', null, '12', '1');

INSERT INTO t_sys_user VALUES ('1', 'admin', 'zxc', 'S.Jin.SuperAdmin', '928990049@qq.com', '15576652266', '1', '2015-02-08 00:00:00', '0', '999', null);
INSERT INTO t_sys_user VALUES ('2', 'guanshj', '202129', 'S.Jin.Admin', 'xiao_wen202129@126.com', '15576652266', '1', '2015-05-06 09:25:26', '0', '520', null);
INSERT INTO t_sys_user VALUES ('3', 'sjin', '202129', 'S.Jin', 'xiao_wen202129@163.com', '15576652266', '1', '2015-07-07 15:18:52', '0', '0', null);


INSERT INTO t_sys_user_group VALUES ('1', '普通用户', '1', '1');


