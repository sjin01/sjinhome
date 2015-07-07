package com.sjin.controllers.manage.ssq;

import com.jfinal.core.Controller;
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

public class SsqController extends Controller {

    public void index (){
        redirect("/manage/ssq/record");
    }

    public void record () {
        String page = getPara("page");
        setAttr("record" , DoubleballRecord.dao.getRecord( StringUtils.isEmpty(page) ? 1: Integer.parseInt(page), 20) );
        render("record.html");
    }

    public void add (){
        render("_add.html");
    }

}
