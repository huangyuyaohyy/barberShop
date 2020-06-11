package com.yq.barberShopSSM.controller;

import com.yq.barberShopSSM.pojo.Barber;
import com.yq.barberShopSSM.service.BarberService;
import com.yq.barberShopSSM.utils.Message;
import com.yq.barberShopSSM.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * create by hyy on 23:25
 */
@RequestMapping("/barbers")
@Controller
public class BarberController {
    @Autowired
    private BarberService barberService;
    @RequestMapping("/barberList")
    public String getBarberList(HttpServletRequest request){
        List<Barber> barbers = barberService.selectAll();
        TimeUtils.deal_birthday_barbers(barbers);
        request.getSession().setAttribute("barbers",barbers);

        int num=barbers.size();
        request.getSession().setAttribute("num",num);
        return "barber";
    }

    @RequestMapping("/add")
    @ResponseBody
    public Message add(Barber barber){
        Message msg=new Message();
        try{
            if(barber.getAge()!=null&&!barber.getAge().equals("")){
                barber.setBirthday(TimeUtils.stringTodate(barber.getAge()));
            }
            barberService.add(barber);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }

    @RequestMapping("/barberEdit")
    public String barberEdit(HttpServletRequest request,Integer id){

        Barber barber= barberService.selectByPrimaryKey(id);
        barber.setAge(TimeUtils.dateTostring(barber.getBirthday()));
        System.out.println(barber.getAge());
        request.getSession().setAttribute("barber",barber);
        return "barberEdit";
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Message edit(Barber barber){
        Message msg=new Message();
        try{
            barber.setBirthday(TimeUtils.stringTodate(barber.getAge()));
            barberService.edit(barber);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }

    @RequestMapping("/barberEditImg")
    public String barberEditImg(HttpServletRequest request,Integer id){

        Barber barber= barberService.selectByPrimaryKey(id);
        TimeUtils.deal_birthday_barber(barber);
        request.getSession().setAttribute("barber",barber);
        return "barberEditImg";
    }

    //保存头像
    @RequestMapping("/saveImg")
    public String saveImg(HttpServletRequest request,MultipartFile upload,Integer barberId){
        barberService.upLoadFile(upload,barberId);
        request.setAttribute("msg","上传成功！");
        return getBarberList(request);//返回理发师信息界面
    }


    //查找理发师
    @RequestMapping("/selectByName")
    public String selectByName(HttpServletRequest request,String barberName) {

        List<Barber> barbers = barberService.selectByName(barberName);
        request.getSession().setAttribute("barbers", barbers);

        int num = barbers.size();
        request.getSession().setAttribute("num", num);
        return "barber";
    }


    //理发师介绍
    @RequestMapping("/barberIntroduce")
    public String barberIntroduce(HttpServletRequest request){
        List<Barber> barbers = barberService.selectAll();
        TimeUtils.deal_birthday_barbers(barbers);
        request.getSession().setAttribute("barbers",barbers);

        return "barberIntroduce";
    }

}
