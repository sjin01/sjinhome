package com.sjin.model.doubleball;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Description:   t_doubleball_rule
 * 创建日期: 7/15  16:21
 *
 id  int NULL AUTO_INCREMENT COMMENT '主键' ,
 code  varchar(20) NULL COMMENT '规则编号：如SH1 SL1 等' ,
 txt  varchar(1024) NULL COMMENT '规则描述',

 * @author: guanshj QQ: 928990049
 */
public class DoubleballRule extends Model<DoubleballRule> {

    public static final DoubleballRule dao = new DoubleballRule();

    /**
     * 普通分页
     */
    public Page<DoubleballRule> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_doubleball_rule " +
                " order by id desc");
    }
}
