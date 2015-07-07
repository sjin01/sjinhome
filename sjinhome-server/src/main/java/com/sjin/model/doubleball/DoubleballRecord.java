package com.sjin.model.doubleball;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.sjin.constant.doubleball.DoubleBallConstant;
import com.sjin.enums.doubleball.BallType;
import com.sjin.vo.doubleball.DoubleBallVo;

import java.util.List;

/**
 * Description:
 * 创建日期: 7/6  16:12
 *
 * t_doubleball_record
 *
 id int(11) NOT NULL AUTO_INCREMENT,
 period int(11) DEFAULT NULL COMMENT '开奖期号',
 value int(11) DEFAULT NULL COMMENT '开奖球号',
 type int(11) DEFAULT NULL COMMENT '1红球；2蓝球',
 PRIMARY KEY (id)

 * @author: guanshj QQ: 928990049
 */
public class DoubleballRecord extends Model<DoubleballRecord> {

    public static final DoubleballRecord dao = new DoubleballRecord();

    /**
     * 普通分页
     */
    public Page<DoubleballRecord> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_doubleball_record " +
                " order by id desc");
    }

    /**
     * 获取数据
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<Record> getRecord(int pageNumber, int pageSize) {
        String sqlstr = "select period , max(case type when 11 then value else null end) redBall1," +
                "max(case type when 12 then value else null end) redBall2, " +
                "max(case type when 13 then value else null end) redBall3, " +
                "max(case type when 14 then value else null end) redBall4, " +
                "max(case type when 15 then value else null end) redBall5, " +
                "max(case type when 16 then value else null end) redBall6, " +
                "max(case type when 2 then value else null end) blueBall " ;

        String sqlstr2 = " from t_doubleball_record group by period order by period desc";
        return Db.paginate(pageNumber,pageSize , sqlstr , sqlstr2 );
    }

    /**
     * 根据期号删除 开奖数据
     * @param period
     */
    public void deleteByPeriod (int period){
        Db.update("delete from t_doubleball_record where period = " + period);
    }

    /**
     * 保存 开奖记录
     * @param period  期号
     * @param redBall1 红球
     * @param redBall2
     * @param redBall3
     * @param redBall4
     * @param redBall5
     * @param redBall6
     * @param blueBall 蓝球
     * @param flag 状态 1：新增；2：修改
     * @throws Exception
     */
    public void saveDoubleBallRecord (Integer period, Integer redBall1, Integer redBall2,
                                      Integer redBall3, Integer redBall4, Integer redBall5,
                                      Integer redBall6, Integer blueBall ,String flag) throws Exception {
        // step1 : validate data
        if (period == null || redBall1 == null || redBall2 == null || redBall3 == null || redBall4 == null || redBall5 == null || redBall6 == null || blueBall == null) {
            System.out.println("参数不正确");
            throw new Exception();
        }

        if(flag.equals(DoubleBallConstant.FLAG_UPDATE)){
            // 清理数据
            deleteByPeriod(period);
        }

        // step2 : 保存 数据
        //红球1
        DoubleballRecord redBall1_Record = new DoubleballRecord();
        redBall1_Record.set("period", period);
        redBall1_Record.set("value", redBall1);
        redBall1_Record.set("type", BallType.RED1.getCode());

        redBall1_Record.save();


        //红球2
        DoubleballRecord redBall2_Record = new DoubleballRecord();
        redBall2_Record.set("period", period);
        redBall2_Record.set("value", redBall2);
        redBall2_Record.set("type", BallType.RED2.getCode());

        redBall2_Record.save();

        //红球3
        DoubleballRecord redBall3_Record = new DoubleballRecord();
        redBall3_Record.set("period", period);
        redBall3_Record.set("value", redBall3);
        redBall3_Record.set("type", BallType.RED3.getCode());

        redBall3_Record.save();

        //红球4
        DoubleballRecord redBall4_Record = new DoubleballRecord();
        redBall4_Record.set("period", period);
        redBall4_Record.set("value", redBall4);
        redBall4_Record.set("type", BallType.RED4.getCode());

        redBall4_Record.save();

        //红球5
        DoubleballRecord redBall5_Record = new DoubleballRecord();
        redBall5_Record.set("period", period);
        redBall5_Record.set("value", redBall5);
        redBall5_Record.set("type", BallType.RED5.getCode());

        redBall5_Record.save();

        //红球6
        DoubleballRecord redBall6_Record = new DoubleballRecord();
        redBall6_Record.set("period", period);
        redBall6_Record.set("value", redBall6);
        redBall6_Record.set("type", BallType.RED6.getCode());

        redBall6_Record.save();

        // 蓝球
        DoubleballRecord blueBall_Record = new DoubleballRecord();
        blueBall_Record.set("period", period);
        blueBall_Record.set("value", blueBall);
        blueBall_Record.set("type",BallType.BLUE.getCode());

        blueBall_Record.save();
    }
}
