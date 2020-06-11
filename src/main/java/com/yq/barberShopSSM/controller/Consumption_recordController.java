package com.yq.barberShopSSM.controller;

import com.yq.barberShopSSM.pojo.*;
import com.yq.barberShopSSM.service.*;
import com.yq.barberShopSSM.utils.Message;
import com.yq.barberShopSSM.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;

/**
 * create by hyy on 17:36
 */
@RequestMapping("/consumption_records")
@Controller
public class Consumption_recordController {

    @Autowired
    private Consumption_recordService consumption_recordService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private BarberService barberService;
    @Autowired
    private Consumption_serviceService consumption_serviceService;
    @Autowired
    private PointService pointService;

    @RequestMapping("/consumption_recordList")
    public String getConsumption_recordList(HttpServletRequest request){
        List<Consumption_record> consumption_records = consumption_recordService.selectAll();
//        //设置时间格式
        TimeUtils.dealConsumption_recordsTime(consumption_records);
        //处理id对应名称
        dealConsumption_recordsName(consumption_records);

        request.getSession().setAttribute("consumption_records",consumption_records);

        Collections.reverse(consumption_records);//java提供的反转List的类

        int num=consumption_records.size();
        request.getSession().setAttribute("num",num);
        return "consumption_record";
    }


    //进入通过会员添加记录的页面
    @RequestMapping("/consumption_recordsAddByMember")
    public String memberAdd(HttpServletRequest request,Integer id){
        Member member=memberService.selectByPrimaryKey(id);
        request.getSession().setAttribute("memberName",member.getMemberName());

        List<Consumption_service> consumptionService=consumption_serviceService.selectAll();
        request.getSession().setAttribute("consumptionServices",consumptionService);

        List<Barber> barbers = barberService.selectAll();
        request.getSession().setAttribute("barbers",barbers);

        return "consumption_recordsAddByMember";
    }

    @RequestMapping("/add")
    @ResponseBody
    public Message add(Consumption_record consumption_record){
        Message msg=new Message();
        try{
            //存会员id
            int memberid=memberService.selectByName(consumption_record.getMemberName()).getMemberId();
            consumption_record.setMemberId(memberid);

           //存消费项目id
            int consumption_service_id=consumption_serviceService.selectByName(consumption_record.getConsumptionServiceName()).getConsumptionServiceId();
            consumption_record.setconsumptionServiceId(consumption_service_id);

            //存消费金额
            int price=consumption_serviceService.selectByName(consumption_record.getConsumptionServiceName()).getPrice();
            consumption_record.setPrice(price);

            consumption_recordService.add(consumption_record);

            //更新积分数
            Point point=pointService.selectByMember(consumption_record.getMemberId());

            if(point!=null) {
                point.setNum(point.getNum() + price);
                pointService.update(point);
            }



            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }


    //页面传数据
    @RequestMapping("/consumption_recordEdit")
    public String consumption_recordEdit(HttpServletRequest request,Integer id){
        Consumption_record consumption_record=consumption_recordService.selectByPrimaryKey(id);
        request.getSession().setAttribute("consumption_record",consumption_record);

        List<Consumption_service> consumptionService=consumption_serviceService.selectAll();
        request.getSession().setAttribute("consumptionServices",consumptionService);

        List<Barber> barbers = barberService.selectAll();
        request.getSession().setAttribute("barbers",barbers);

        return "consumption_recordEdit";
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Message edit(Consumption_record consumption_record){
        Message msg=new Message();
        try{
            int consumption_serviceId=consumption_serviceService.selectByName(consumption_record.getConsumptionServiceName()).getConsumptionServiceId();
            System.out.println(consumption_serviceId);
            consumption_record.setconsumptionServiceId(consumption_serviceId);
            System.out.println(consumption_record.getconsumptionServiceId());
            consumption_recordService.edit(consumption_record);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }






     public void dealConsumption_recordsName(List<Consumption_record> consumption_records) {
         for (int i = 0; i < consumption_records.size(); i++) {
             //消费项目名称
             Consumption_service consumption_service = consumption_serviceService.selectByPrimaryKey(consumption_records.get(i).getconsumptionServiceId());
             consumption_records.get(i).setConsumptionServiceName(consumption_service.getServiceName());
//            //理发师姓名
             Barber barber = barberService.selectByPrimaryKey(consumption_records.get(i).getBarberId());
             consumption_records.get(i).setBarberName(barber.getBarberName());
             //会员姓名
             Member member = memberService.selectByPrimaryKey(consumption_records.get(i).getMemberId());
             consumption_records.get(i).setMemberName(member.getMemberName());
         }
     }



     //通过会员姓名查找消费记录
     @RequestMapping("/selectByName")
     public String selectByName(HttpServletRequest request,String memberName){

        Member member=memberService.selectByName(memberName);
         List<Consumption_record> consumption_records = consumption_recordService.selectByMemberId(member.getMemberId());
//        //设置时间格式
         TimeUtils.dealConsumption_recordsTime(consumption_records);
         //处理id对应名称
         dealConsumption_recordsName(consumption_records);

         Collections.reverse(consumption_records);
         request.getSession().setAttribute("consumption_records",consumption_records);

         int num=consumption_records.size();
         request.getSession().setAttribute("num",num);
         return "consumption_record";
     }
}
