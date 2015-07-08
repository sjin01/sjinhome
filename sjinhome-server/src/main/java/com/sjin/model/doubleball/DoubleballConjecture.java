package com.sjin.model.doubleball;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Description:   t_doubleball_conjecture
 * 创建日期: 7/8  9:51
 *
 id INT NOT NULL AUTO_INCREMENT,
 period INT NULL,
 value INT NULL,
 type INT NULL,
 PRIMARY KEY (id)
 *
 * @author: guanshj QQ: 928990049
 */
public class DoubleballConjecture extends Model<DoubleballConjecture> {

    public static final DoubleballConjecture dao = new DoubleballConjecture();

    /**
     * 普通分页
     */
    public Page<DoubleballConjecture> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_doubleball_conjecture " +
                " order by id desc");
    }
}
