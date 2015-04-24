package com.sjin.model.manage;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * 用户
 * 数据库名 t_sys_user

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
 *
 */

public class User extends Model<User> {
    public static final User dao = new User();
    /**
     * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
     */
    public Page<User> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_sys_user order by registerdate,id desc");
    }

    /* 登陆方法 true 成功*/
    public User login (String username , String password){

        if(username.isEmpty() || password.isEmpty()) return null;

        List<User> list = User.dao.find("select * from t_sys_user where username ='" + username + "' and password ='" + password+"' ");
        if(list == null || list.isEmpty()){
            return null;
        }else{
            return list.get(0);
        }
    }
}
