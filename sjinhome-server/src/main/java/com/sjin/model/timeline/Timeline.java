package com.sjin.model.timeline;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Description: 时间轴 Model 类
 * 创建日期: 6/11  14:17
 *
 *  t_timeline
 *
 ID                   INT NOT NULL AUTO_INCREMENT,
 TYPE                 INT COMMENT '类型：1：sjin的成长；2：sjin于dcc；99：用户记录',
 YEAR                 VARCHAR(45),
 DATE                 VARCHAR(45),
 TXT                  VARCHAR(255),
 VERSION              VARCHAR(45),
 PRIMARY KEY (ID)

 *
 * @author: guanshj QQ: 928990049
 */
public class Timeline extends Model<Timeline> {

    public static final Timeline dao = new Timeline();

    public Page<Timeline> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_timeline order by sort asc");
    }

    /**
     *  根据类型， 查询时间轴的 年份 （主干）
     * @param type
     * @return
     */
    public List<Timeline> selectYearsByType (Integer type){
        String sql = "select year from t_timeline where type = ? group by year order by year desc ";
        return dao.find(sql, type);
    }

    /**
     * 根据年份查询数据
     * @param year
     * @param type
     * @return
     */
    public List<Timeline> selectDataByYear (String year , Integer type){
        String sql = "select * from t_timeline t where t.year = ? and type = ? order by date desc";
        return dao.find( sql ,year, type);
    }
}
