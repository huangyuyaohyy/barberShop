package com.yq.barberShopSSM.controller;

import com.yq.barberShopSSM.pojo.Gift;
import com.yq.barberShopSSM.pojo.Member;
import com.yq.barberShopSSM.pojo.Point;
import com.yq.barberShopSSM.pojo.Point_gift;
import com.yq.barberShopSSM.service.GiftService;
import com.yq.barberShopSSM.service.MemberService;
import com.yq.barberShopSSM.service.PointService;
import com.yq.barberShopSSM.service.Point_giftService;
import com.yq.barberShopSSM.utils.Message;
import com.yq.barberShopSSM.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * create by hyy on 16:59
 */
@RequestMapping("/point_gifts")
@Controller
public class Point_giftController {
    @Autowired
    private Point_giftService point_giftService;
    @Autowired
    private GiftService giftService;
    @Autowired
    private PointService pointService;
    @Autowired
    private MemberService memberService;
    //已兑换信息页面
    @RequestMapping("/point_giftList")//返回已兑换记录
    public String getPoint_giftList(HttpServletRequest request){
        List<Point_gift> point_gifts = point_giftService.selectByState(1);
        //设置时间格式
        TimeUtils.dealPoint_giftsTime(point_gifts);

        //找到对应名称
        point_gifts =dealName(point_gifts);

        Collections.reverse(point_gifts);
        request.getSession().setAttribute("point_gifts",point_gifts);
        int num=point_gifts.size();
        request.getSession().setAttribute("num",num);
        return "point_gifts";
    }
    //未兑换信息页面
    @RequestMapping("/excahnge_deal")
    public String getExcahnge_deal(HttpServletRequest request){
        List<Point_gift> point_gifts = point_giftService.selectByState(0);
        //设置时间格式
        TimeUtils.dealPoint_giftsTime(point_gifts);
        //找到对应名称
        point_gifts =dealName(point_gifts);

        request.getSession().setAttribute("point_gifts",point_gifts);

        int num=point_gifts.size();
        request.getSession().setAttribute("num",num);
        return "excahnge_deal";
    }


    @RequestMapping("dealToFact")
    @ResponseBody
    public Message dealToFact(HttpServletRequest request,Integer pointGiftId){
        Message msg=new Message();
        Point_gift point_gift=point_giftService.selectByPrimaryKey(pointGiftId);

        point_giftService.updateState(point_gift);

//        request.getSession().setAttribute("msg","领取成功！");
        msg.setMsg("success");
//        return getPoint_giftList(request);
        return msg;
    }

    @RequestMapping("/exchange")
    @ResponseBody
    public Message getPoint_giftList(Integer giftId, Integer pointId){

        Message message=new Message();
        Gift gift=giftService.selectByPrimaryKey(giftId);
        Point point=pointService.selectByPrimaryKey(pointId);

        if(point.getNum()<gift.getExchangePoint()){//积分不够
            message.setMsg("pointNo");
        }
        //礼品数量小于1
        else if(gift.getNum()<1){
            message.setMsg("NumNo");
        }
        else {
            //添加兑换记录
            Point_gift point_gift=new Point_gift();
            point_gift.setMemberId(point.getMemberId());
            point_gift.setGiftId(giftId);
            point_giftService.add(point_gift);

            //减少积分数
            point.setNum(point.getNum()-gift.getExchangePoint());
            pointService.update(point);

            //更新礼品数量
            gift.setNum(gift.getNum()-1);
            giftService.update(gift);


            message.setMsg("success");
            String memberName=memberService.selectByPrimaryKey(point.getMemberId()).getMemberName();
            message.setPara(memberName);
        }
        return message;
    }

    @RequestMapping("memberGifts")
    public String memberGifts(HttpServletRequest request,Integer pointId){
        Member member=memberService.selectByPrimaryKey(pointService.selectByPrimaryKey(pointId).getMemberId());
        List<Point_gift> point_gifts=point_giftService.selectByMember(member.getMemberId());

        //设置时间格式
        TimeUtils.dealPoint_giftsTime(point_gifts);

        //找到对应名称
        point_gifts =dealName(point_gifts);

        request.getSession().setAttribute("point_gifts",point_gifts);
        return "memberGifts";
    }

    //找到对应名称
    private List<Point_gift> dealName(List<Point_gift> point_gifts) {
        for (int i = 0; i < point_gifts.size(); i++) {
            //会员姓名
            Member member = memberService.selectByPrimaryKey(point_gifts.get(i).getMemberId());
            point_gifts.get(i).setMemberName(member.getMemberName());

            //礼品名称
            Gift gift=giftService.selectByPrimaryKey(point_gifts.get(i).getGiftId());
            point_gifts.get(i).setGiftName(gift.getGiftName());

            //状态
            if(point_gifts.get(i).getState()==0){
                point_gifts.get(i).setStateName("未到店领取");
            }
            else {
                point_gifts.get(i).setStateName("已到店领取");
            }
        }
        return point_gifts;
    }

    //查找状态为兑换的记录
    @RequestMapping("selectByNameOne")
    public String selectByNameOne(HttpServletRequest request,String memberName){
        List<Point_gift> point_gifts = point_giftService.selectByMember(memberService.selectByName(memberName).getMemberId());
        List<Point_gift> new_point_gifts=new ArrayList<Point_gift>();
        for(int i=0;i<point_gifts.size();i++){
            if(point_gifts.get(i).getState()==1){
                new_point_gifts.add(point_gifts.get(i));
            }
        }
        //设置时间格式
        TimeUtils.dealPoint_giftsTime(new_point_gifts);

        //找到对应名称
        point_gifts =dealName(new_point_gifts);

        request.getSession().setAttribute("point_gifts",new_point_gifts);
        int num=point_gifts.size();
        request.getSession().setAttribute("num",num);
        return "point_gifts";
    }

    //查找状态为未兑换的记录
    @RequestMapping("selectByNameZore")
    public String selectByNameZore(HttpServletRequest request,String memberName){
        List<Point_gift> point_gifts = point_giftService.selectByMember(memberService.selectByName(memberName).getMemberId());
        List<Point_gift> new_point_gifts=new ArrayList<Point_gift>();
        for(int i=0;i<point_gifts.size();i++){
            if(point_gifts.get(i).getState()==0){
                new_point_gifts.add(point_gifts.get(i));
            }
        }
        //设置时间格式
        TimeUtils.dealPoint_giftsTime(new_point_gifts);

        //找到对应名称
        point_gifts =dealName(new_point_gifts);

        request.getSession().setAttribute("point_gifts",new_point_gifts);
        int num=new_point_gifts.size();
        request.getSession().setAttribute("num",num);
        return "excahnge_deal";
    }
}
