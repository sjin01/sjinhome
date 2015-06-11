package com.sjin.model.timeline;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Description: 时间轴更多描述
 * 创建日期: 6/11  14:17
 *
 * t_timeline_more
 *
 ID                   INT NOT NULL AUTO_INCREMENT,
 TID                  INT,
 TXT                  VARCHAR(255),
 SORT                 INT,

 * @author: guanshj QQ: 928990049
 */
public class TimelineMore extends Model<TimelineMore> {

    public static final TimelineMore dao = new TimelineMore();
    public Page<TimelineMore> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_timeline_more order by sort asc");
    }

    /**
     * 根据tid 查询数据
     * @param tid
     * @return
     */
    public List<TimelineMore> selectByTid (Integer tid){
        return dao.find("select * from t_timeline_more tm where tm.TID = ? order by sort " , tid);
    }
}
