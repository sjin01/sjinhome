package com.sjin.model.manage;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 功能  t_sys_func
 *
     id                   int not null,
     name                 varchar(45),
     sort                 int,
     path                 varchar(512) comment '访问路径',
     pic                  varchar(512),
     pid                  int,
     type                 int comment '1：菜单；2：功能',
     primary key (id)
 *
 * @author: guanshj QQ: 928990049
 */
public class Func extends Model<Func>{

    public static final Func dao = new Func();

    /**
     * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
     */
    public Page<Func> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_sys_func order by sort asc");
    }
}
