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
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;

/**
 * create by hyy on 17:11
 */
@RequestMapping("/members")
@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private PointService pointService;
    @Autowired
    private GiftService giftService;
    @Autowired
    private Consumption_recordService consumption_recordService;
    @Autowired
    private BarberService barberService;
    @Autowired
    private Consumption_serviceService consumption_serviceService;
    @RequestMapping("/login")
    public String login(String member_name, String password, HttpServletRequest request){
        Member member = memberService.login(member_name, password);
        if (member!=null){

            //初始化主页面数据
            request.getSession().setAttribute("member_name",member_name);
            return "user";
        }else {
            request.setAttribute("msg","用户名或密码错误");
            return "member_login";
        }

    }

    @RequestMapping("/memberList")
    public String getMemberList(HttpServletRequest request){
        List<Member> members = memberService.selectAll();
        TimeUtils.deal_birthday(members);
        request.getSession().setAttribute("members",members);

        int num=members.size();
        request.getSession().setAttribute("num",num);
        return "member";
    }

    //注册
    @RequestMapping("/add")
    @ResponseBody
    public Message add(Member member, String birth) {
        Message msg=new Message();
        Member mem=memberService.selectByName(member.getMemberName());
        if (mem!=null) {
//            request.setAttribute("msg","用户名已经存在");
            msg.setMsg("be");
            return msg;
        } else {
            member.setBirthday(TimeUtils.stringTodate(birth));
            memberService.add(member);
            Member m = memberService.selectByName(member.getMemberName());

            //增加对应的一个积分表
            Point point = new Point();
            point.setNum(0);
            point.setMemberId(m.getMemberId());
            pointService.add(point);
            //       msg.setMsg("success");
            //      return msg;
//            request.getSession().setAttribute("msg", "注册成功");
            msg.setMsg("success");
            return msg;
        }
    }

//    是否存在此会员姓名
    @RequestMapping("/selectByName")
    public Message selectByName(String memberName){
        Message msg=new Message();
        Member member=memberService.selectByName(memberName);
        if (member!=null){
            msg.setMsg("ununique");
        }
        else {msg.setMsg("unique");}
        return msg;
    }


    //会员是否存在
    @RequestMapping("/memberExist")
    @ResponseBody
    public Message memberExist(String memberName) {
        Message msg = new Message();
        Member mem = memberService.selectByName(memberName);
        if (mem != null) {
//            request.setAttribute("msg","用户名已经存在");
            msg.setMsg("be");
        }
        return msg;
    }

    //查找会员
    @RequestMapping("/selectByMemberName")
    public String selectByMemberName(HttpServletRequest request,String memberName){
        List<Member> members = memberService.selectByMemberName(memberName);
        TimeUtils.deal_birthday(members);
        request.getSession().setAttribute("members",members);

        int num=members.size();
        request.getSession().setAttribute("num",num);
        return "member";
    }

    //用户  个人信息
    @RequestMapping("/information")
    public String information(HttpServletRequest request,String memberName){
        Member member = memberService.selectByName(memberName);
        TimeUtils.deal_birthday_member(member);
        request.getSession().setAttribute("member",member);

        List<Consumption_record> consumption_records = consumption_recordService.selectByMemberId(member.getMemberId());
//        //设置时间格式
        TimeUtils.dealConsumption_recordsTime(consumption_records);
        //处理id对应名称
        dealConsumption_recordsName(consumption_records);

        Collections.reverse(consumption_records);
        request.getSession().setAttribute("consumption_records",consumption_records);

        int num=consumption_records.size();
        request.getSession().setAttribute("num",num);
        return "user_information";
    }

    @RequestMapping("/informationEdit")
    public String barberEdit(HttpServletRequest request,Integer id){

        Member member= memberService.selectByPrimaryKey(id);
        member=TimeUtils.deal_birthday_member(member);
        member.setAge(TimeUtils.dateTostring(member.getBirthday()));
        request.getSession().setAttribute("member",member);
        return "informationEdit";
    }

    //会员修改个人信息
    @RequestMapping("/edit")
    @ResponseBody
    public Message edit(Member member, String birth, HttpServletRequest request, HttpServletResponse response) {

        Message msg=new Message();
            Member mem=memberService.selectByName(member.getMemberName());
            member.setMemberId(mem.getMemberId());
            member.setBirthday(TimeUtils.stringTodate(birth));
            memberService.edit(member);
            msg.setMsg("success");
//            request.getSession().setAttribute("msg", "修改成功！");

//        TimeUtils.deal_birthday_member(member);
//        request.getSession().setAttribute("member",member);
//
//        List<Consumption_record> consumption_records = consumption_recordService.selectByMemberId(member.getMemberId());
////        //设置时间格式
//        TimeUtils.dealConsumption_recordsTime(consumption_records);
//        //处理id对应名称
//        dealConsumption_recordsName(consumption_records);
//
//        Collections.reverse(consumption_records);
//        request.getSession().setAttribute("consumption_records",consumption_records);
//
//        int num=consumption_records.size();
//        request.getSession().setAttribute("num",num);
//
//            return "user_information";
        return msg;

    }


    //积分商城显示页面
    @RequestMapping("/pointShop")
    public String pointShop(HttpServletRequest request,String memberName){
        Member member = memberService.selectByName(memberName);
        Point point=pointService.selectByMember(member.getMemberId());
        request.getSession().setAttribute("point",point);

        List<Gift> gifts=giftService.selectByState();//显示状态为1的
        request.getSession().setAttribute("gifts",gifts);

        return "pointShop1";
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

}
