package com.sjin.controllers.manage.ssq;

import com.jfinal.core.Controller;
import com.sjin.base.BaseController;
import com.sjin.constant.SysConstant;
import com.sjin.constant.doubleball.DoubleBallConstant;
import com.sjin.model.doubleball.DoubleballRecord;
import org.apache.commons.lang.StringUtils;

/**
 * Description:   双色球分析  -----  开奖记录
 * 创建日期: 7/6  11:49
 *
 *                          _oo0oo_
 *                         o8888888o
 *                         88" . "88
 *                         (| -_- |)
 *                         0\  =  /0
 *                       ___/'---'\___
 *                     .' \\|     |// '.
 *                    / \\|||  :  |||// \
 *                   / _||||| -:- |||||_ \
 *                  |   | \\\  -  /// |   |
 *                  | \_|  ''\---/''  |_/ |
 *                  \  .-\__  '-'  __/-.  /
 *               ____'. .'  /--.--\  '. .'____
 *            .""  '<  `.___\_<|>_/___.'  >'  "".
 *           | | :   `_ \`.;`\ _ /`;.`/ _'   : | |
 *           \  \  `_.   \_ __\ /__ _/   ._'  /  /
 *       =====`-._____`.___ \_____/ ___.`_____.-`=====
 *                          '=---='
 *
 *       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 *                     佛祖保佑   中500万
 *
 * @author: guanshj QQ: 928990049
 */

public class SsqController extends BaseController {

    public void index (){
        redirect("/manage/ssq/record");
    }

    public void record () {
        String page = getPara("page");
        setAttr("record" , DoubleballRecord.dao.getRecord( StringUtils.isEmpty(page) ? 1: Integer.parseInt(page), 1) );
        render("record.html");
    }

    public void recordDatatable() {
        Integer iDisplayStart = getParaToInt("iDisplayStart");
        Integer pagesize = getParaToInt("iDisplayLength");

        if(iDisplayStart == null || iDisplayStart==0) iDisplayStart = 0;
        if(pagesize == null || pagesize==0) pagesize = SysConstant.MANAGE_PAGESIZE;

        int page = iDisplayStart / pagesize + 1;

        renderJson(
                getSuccessResultMapDataTable(
                        DoubleballRecord.dao.getRecord(page, pagesize), getPara("sEcho")
                )
        );
    }

    public void add (){
        render("_add.html");
    }

    public void save () throws Exception {
        String period = getPara("period");
        String redBall1 = getPara("redBall1");
        String redBall2 = getPara("redBall2");
        String redBall3 = getPara("redBall3");
        String redBall4 = getPara("redBall4");
        String redBall5 = getPara("redBall5");
        String redBall6 = getPara("redBall6");
        String blueBall = getPara("blueBall");

        DoubleballRecord.dao.saveDoubleBallRecord(Integer.parseInt(period) ,Integer.parseInt(redBall1),Integer.parseInt(redBall2),
                Integer.parseInt(redBall3),Integer.parseInt(redBall4),Integer.parseInt(redBall5),Integer.parseInt(redBall6)
                ,Integer.parseInt(blueBall) , DoubleBallConstant.FLAG_INSERT );

//        redirect("/manage/ssq/record");
        renderJson(getSuccessfulResultMap());
    }

    public void delete (){
        DoubleballRecord.dao.deleteByPeriod( getParaToInt("period"));
        redirect("/manage/ssq/record");
    }
    public void deleteList(){
        String idsStr = getPara("ids");
        DoubleballRecord.dao.deleteByPeriod(idsStr);
        renderJson(getSuccessfulResultMap());
    }

}
