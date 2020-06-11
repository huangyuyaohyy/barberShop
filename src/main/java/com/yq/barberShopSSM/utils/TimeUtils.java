package com.yq.barberShopSSM.utils;

import com.yq.barberShopSSM.pojo.Barber;
import com.yq.barberShopSSM.pojo.Consumption_record;
import com.yq.barberShopSSM.pojo.Member;
import com.yq.barberShopSSM.pojo.Point_gift;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * create by hyy on 17:24
 */
public class TimeUtils {

    public static List<Consumption_record> dealConsumption_recordsTime(List<Consumption_record> consumption_records){
        for (int i = 0; i < consumption_records.size(); i++) {
            //拿到时间进行设置
            String date=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(consumption_records.get(i).getConsumptionTime());
            consumption_records.get(i).setTime(date);
        }
        return consumption_records;
    }

    public static List<Point_gift> dealPoint_giftsTime(List<Point_gift> point_gifts){
        for (int i = 0; i < point_gifts.size(); i++) {
            //拿到时间进行设置
            String date=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(point_gifts.get(i).getDealTime());
            point_gifts.get(i).setDeal(date);
            if(point_gifts.get(i).getFactTime()!=null) {
                String date1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(point_gifts.get(i).getFactTime());
                point_gifts.get(i).setFact(date1);
            }
        }
        return point_gifts;
    }

    public static List<Member> deal_birthday(List<Member> memberList){
        Calendar cal = Calendar.getInstance();
        int yearNow = cal.get(Calendar.YEAR);  //当前年份
        int monthNow = cal.get(Calendar.MONTH);  //当前月份
        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); //当前日期
        for (int i = 0; i < memberList.size(); i++) {
            if (cal.before(memberList.get(i).getBirthday())) { //出生日期晚于当前时间，无法计算
                memberList.get(i).setAge("信息有误");
            }

            cal.setTime(memberList.get(i).getBirthday());
            int yearBirth = cal.get(Calendar.YEAR);
            int monthBirth = cal.get(Calendar.MONTH);
            int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);
            int age = yearNow - yearBirth;   //计算整岁数
            if (monthNow <= monthBirth) {
                if (monthNow == monthBirth) {
                    if (dayOfMonthNow < dayOfMonthBirth) age--;//当前日期在生日之前，年龄减一
                } else {
                    age--;//当前月份在生日之前，年龄减一
                }
            }
            memberList.get(i).setAge(Integer.toString(age));
        }

        return  memberList;
    }

    public static Member deal_birthday_member(Member member){
        Calendar cal = Calendar.getInstance();
        int yearNow = cal.get(Calendar.YEAR);  //当前年份
        int monthNow = cal.get(Calendar.MONTH);  //当前月份
        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); //当前日期

            if (cal.before(member.getBirthday())) { //出生日期晚于当前时间，无法计算
                member.setAge("信息有误");
            }

            cal.setTime(member.getBirthday());
            int yearBirth = cal.get(Calendar.YEAR);
            int monthBirth = cal.get(Calendar.MONTH);
            int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);
            int age = yearNow - yearBirth;   //计算整岁数
            if (monthNow <= monthBirth) {
                if (monthNow == monthBirth) {
                    if (dayOfMonthNow < dayOfMonthBirth) age--;//当前日期在生日之前，年龄减一
                } else {
                    age--;//当前月份在生日之前，年龄减一
                }
            }
        member.setAge(Integer.toString(age));


        return  member;
    }
    public static List<Barber> deal_birthday_barbers(List<Barber> barberList){
        Calendar cal = Calendar.getInstance();
        int yearNow = cal.get(Calendar.YEAR);  //当前年份
        int monthNow = cal.get(Calendar.MONTH);  //当前月份
        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); //当前日期
        for (int i = 0; i < barberList.size(); i++) {
            if (barberList.get(i).getBirthday() != null) {
                if (cal.before(barberList.get(i).getBirthday())) { //出生日期晚于当前时间，无法计算
                    barberList.get(i).setAge("信息有误");
                }
                else {
                    cal.setTime(barberList.get(i).getBirthday());
                    int yearBirth = cal.get(Calendar.YEAR);
                    int monthBirth = cal.get(Calendar.MONTH);
                    int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);
                    int age = yearNow - yearBirth;   //计算整岁数
                    if (monthNow <= monthBirth) {
                        if (monthNow == monthBirth) {
                            if (dayOfMonthNow < dayOfMonthBirth) age--;//当前日期在生日之前，年龄减一
                        } else {
                            age--;//当前月份在生日之前，年龄减一
                        }
                    }
                    barberList.get(i).setAge(Integer.toString(age));
                }
            }

        }
        return  barberList;
    }

    public static Barber deal_birthday_barber(Barber barber) {
        Calendar cal = Calendar.getInstance();
        int yearNow = cal.get(Calendar.YEAR);  //当前年份
        int monthNow = cal.get(Calendar.MONTH);  //当前月份
        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); //当前日期
        if (barber.getBirthday() != null) {
            if (cal.before(barber.getBirthday())) { //出生日期晚于当前时间，无法计算
                barber.setAge("信息有误");
            } else {
                cal.setTime(barber.getBirthday());
                int yearBirth = cal.get(Calendar.YEAR);
                int monthBirth = cal.get(Calendar.MONTH);
                int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);
                int age = yearNow - yearBirth;   //计算整岁数
                if (monthNow <= monthBirth) {
                    if (monthNow == monthBirth) {
                        if (dayOfMonthNow < dayOfMonthBirth) age--;//当前日期在生日之前，年龄减一
                    } else {
                        age--;//当前月份在生日之前，年龄减一
                    }
                }
                barber.setAge(Integer.toString(age));
            }
        }


        return barber;
    }



   public static String dateTostring(Date birthday){
        if(birthday!=null&&!birthday.equals("")) {
            String date = new SimpleDateFormat("yyyy-MM-dd").format(birthday);
            return date;
        }
        else return null;
   }

    public static Date stringTodate(String birth){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date time;
        try {
            time = formatter.parse(birth);
            return time;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }

    }
}
