package com.yq.barberShopSSM.controller;

import com.yq.barberShopSSM.pojo.Member;
import com.yq.barberShopSSM.pojo.Point;
import com.yq.barberShopSSM.service.MemberService;
import com.yq.barberShopSSM.service.PointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * create by hyy on 9:56
 */
@RequestMapping("/points")
@Controller
public class PointController {
    @Autowired
    private PointService pointService;
    @Autowired
    private MemberService memberService;

    @RequestMapping("/pointList")
    public String getPointList(HttpServletRequest request){
        List<Point> points=pointService.selectAll();
        request.getSession().setAttribute("points",points);

        setMemberName(points);//找到会员姓名
        int num=points.size();
        request.getSession().setAttribute("num",num);
        return "point";
    }

    @RequestMapping("/selectByMember")
    public void setMemberName(List<Point> points){
        for (Point point : points) { //快捷键iter+Tab
           Member member= memberService.selectByPrimaryKey(point.getMemberId());
           point.setMemberName(member.getMemberName());
        }
    }

}
