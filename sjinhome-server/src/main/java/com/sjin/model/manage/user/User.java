package com.sjin.model.manage.user;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 4/1  10:23
 *
 * @author: guanshj QQ: 928990049
 *
 * User -
 * 数据库名 t_sys_user
 * 数据库结构
id	int	11	0	0	-1	0	0	0		0	id				-1	0
username	varchar	45	0	-1	0	0	0	0		0	登录名	utf8	utf8_general_ci		0	0
password	varchar	45	0	-1	0	0	0	0		0	登陆密码	utf8	utf8_general_ci		0	0
nickname	varchar	45	0	-1	0	0	0	0		0	姓名或昵称	utf8	utf8_general_ci		0	0
email	varchar	45	0	-1	0	0	0	0		0		utf8	utf8_general_ci		0	0
phone	varchar	45	0	-1	0	0	0	0		0		utf8	utf8_general_ci		0	0
status	int	11	0	-1	0	0	0	0		0	状态：1正常；2冻结				0	0
registerdate	datetime	0	0	-1	0	0	0	0		0	注册日期				0	0
 *
 */

public class User extends Model<User> {
    public static final User dao = new User();

    private String username2;

    /**
     * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
     */
    public Page<User> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_sys_user order by id asc");
    }
}
