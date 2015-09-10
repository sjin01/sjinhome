package com.sjin.enums.doubleball;

/**
 * @Description :  双色球分析规则枚举
 * @Author : guanshj | 928990049 | shijing.guan@china.zhaogang.com
 * @Date : 2015/9/9
 */
public enum AnalyzeEnum {
    /**
     * code 规则： 1001 杀红球； 2001 求红球；3001杀蓝球；4001求蓝球
     */
    SH1(1001, "杀红公式1", "当期开奖号码大小顺序第一位与第六位的差，计算的结果在下一期有可能不出"),
    SH2(1002, "杀红公式2", "当期开奖号码大小顺序第二位与第三位的差，计算的结果在下一期有可能不出"),
    SH3(1003, "杀红公式3", "当期开奖号码大小顺序第二位与第五位的差，计算的结果在下一期有可能不出"),
    SH4(1004, "杀红公式4", "当期开奖号码大小顺序第一位乘4再减掉2，计算的结果在下一期有可能不出"),
    SH5(1005, "杀红公式5", "当期开奖号码大小顺序期开第一位加当奖的蓝号，计算的结果再乘3后，所得的号码在下一期有可能不出"),
    SH6(1006, "杀红公式6", "当期开奖号码大小顺序第一位加09，计算的结果在下一期有可能不出"),
    SH7(1007, "杀红公式7", "当期开奖号码大小顺序第二位加05，计算的结果在下一期有可能不出"),
    SH8(1008, "杀红公式8", "当期开奖号码大小顺序第三位加04，计算的结果在下一期有可能不出"),
    SH9(1009, "杀红公式9", "当期开奖号码大小顺序第三位加07，计算的结果在下一期有可能不出"),
    SH10(1010, "杀红公式10", "当期开奖号码大小顺序第六位加04，计算的结果在下一期有可能不出"),
    SH11(1011, "杀红公式11", "当期开奖号码大小顺序第四位与第五位的差，加当期的蓝号，再加01，计算的结果在下一期有可能不出"),
    SH12(1012, "杀红公式12", "当期开奖号码出号顺序第一位与第二位的和，计算的结果在下一期有可能不出"),
    SH13(1013, "杀红公式13", "当期开奖号码出号顺序第二位与第三位的差，计算的结果在下一期有可能不出"),
    SH14(1014, "杀红公式14", "当期开奖号码出号顺序第三位与第五位的差，计算的结果在下一期有可能不出"),
    SH15(1015, "杀红公式15", "当期开奖号码出号顺序首尾的差，加当期开奖的蓝号，再减去03，计算的结果在下一期有可能不出"),
    SH16(1016, "杀红公式16", "当期开奖号码出号顺序第一位与第三位的差，加当期开奖的蓝号，再加02，计算的结果在下一期有可能不出"),
    SH17(1017, "杀红公式17", "当期开奖号码出号顺序一位，二位，三位相加的和，加当期开奖的蓝号，再减去01，计算的结果在下一期有可能不出"),
    SH18(1018, "杀红公式18", "当期开奖的蓝号，加当期开奖号码大小顺序第一位，计算的结果在下一期有可能不出"),
    SH19(1019, "杀红公式19", "当期开奖的蓝号，加当期开奖号码大小顺序第二位，再减去01，计算的结果在下一期有可能不出"),
    SH20(1020, "杀红公式20", "当期开奖的蓝号，减当期开奖号码大小顺序第四位，再加上01，计算的结果在下一期有可能不出"),
    SH21(1021, "杀红公式21", "当期开奖的蓝号，减当期开奖号码大小顺序第五位，计算的结果在下一期有可能不出"),
    SH22(1022, "杀红公式22", "当期开奖的蓝号，乘当期开奖号码大小顺序第一位，计算的结果在下一期有可能不出"),
    SH23(1023, "杀红公式23", "当期开奖的蓝号，加+07，计算的结果在下一期有可能不出"),
    SH24(1024, "杀红公式24", "当期开奖的蓝号，加+09，计算的结果在下一期有可能不出"),
    SH25(1025, "杀红公式25", "当期开奖的蓝号，乘05加+02，计算的结果在下一期有可能不出"),
    SH26(1026, "杀红公式26", "当期开奖的蓝号，如为偶数时，乘上2，再加02，计算的结果在下一期有可能不出;当期开奖的蓝号，如为奇数时，乘上5，再加+02，计算的结果在下一期有可能不出"),
    SH27(1027, "杀红公式27", "开奖红号按从小到大排序(第三位+第六位)除以33的余数+14,如果结果大于33,就减去33"),
    SH28(1028, "杀红公式28", "上期**（红1位+红3位+红5位）/2"),
    SH29(1029, "杀红公式29", "上期**  红6位减蓝1位"),
    SH30(1030, "杀红公式30", "上期** 红1位*3/2"),
    SH31(1031, "杀红公式31", "上期* 红1位尾加上期红2位尾"),

    SL1(3001, "杀蓝公式1", "用15减去上期蓝球号码，得出的数就是下期要杀的蓝号尾数"),
    SL2(3002, "杀蓝公式2", "用19减上期蓝号得出的数即为下期要杀的尾数"),
    SL3(3003, "杀蓝公式3", "用21减上期蓝号得出的数就是下期要杀的尾数"),
    SL4(3004, "杀蓝公式4", "用上两期蓝号的头和尾相加的数即为下期要杀的蓝号尾数"),
    SL5(3005, "杀蓝公式5", "用上两期蓝号的尾和头相加的数即为下期要杀的尾数"),
    SL6(3006, "杀蓝公式6", "用上二期蓝号尾相加得出的数就是下期要杀的尾数"),
    SL7(3007, "杀蓝公式7", "用上期蓝号尾与隔一期蓝号尾相加得出的数即为下期要杀的尾数"),
    SL8(3008, "杀蓝公式8", "用上期蓝号乘以2得出的数即为下期要杀的尾数"),
    SL9(3009, "杀蓝公式9", "用上期蓝号尾乘4得出的数即是下期要杀的尾数"),
    SL10(3010, "杀蓝公式10", "用上期蓝号加7或减7，注意蓝号大于14则减7，小于14则加7，得出的数即为下期要杀的尾数"),
    SL11(3011, "杀蓝公式11", "用上期蓝号加2得出的数即为下期要杀的蓝号尾数"),
    SL12(3012, "杀蓝公式12", "用上期蓝号加6等于的数就是下期蓝号要杀的尾数");

    private Integer code;   // 分析规则代码
    private String title;   // 分析规则标题
    private String txt;     // 分析规则解释

    private AnalyzeEnum(Integer code,String title,String txt){
        this.code = code;
        this.title = title;
        this.txt = txt;
    }

    public static AnalyzeEnum get(Integer code){
        for(AnalyzeEnum enumItem : AnalyzeEnum.values()){
            if(enumItem.getCode().equals(code)) return enumItem;
        }
        return null;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }
}
