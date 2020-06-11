package com.yq.barberShopSSM.controller;

import com.yq.barberShopSSM.pojo.Consumption_service;
import com.yq.barberShopSSM.service.Consumption_serviceService;
import com.yq.barberShopSSM.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * create by hyy on 16:43
 */
@RequestMapping("/consumption_services")
@Controller
public class Consumption_serviceController {
    @Autowired
    private Consumption_serviceService consumption_serviceService;
    @RequestMapping("/consumption_serviceList")
    public String getConsumption_itemList(HttpServletRequest request){
        List<Consumption_service> consumption_services = consumption_serviceService.selectAll();
        request.getSession().setAttribute("consumption_services",consumption_services);

        int num=consumption_services.size();
        request.getSession().setAttribute("num",num);
        return "consumption_service";
    }

    //add
    @RequestMapping("/add")
    @ResponseBody
    public Message add(Consumption_service consumption_service){
        Message msg=new Message();
        try{
            consumption_serviceService.add(consumption_service);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }

    //页面传数据
    @RequestMapping("/consumption_serviceEdit")
    public String consumption_itemEdit(HttpServletRequest request,Integer id){
        Consumption_service consumption_service=consumption_serviceService.selectByPrimaryKey(id);
        request.getSession().setAttribute("consumption_service",consumption_service);
        return "consumption_serviceEdit";
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Message edit(Consumption_service consumption_service){
        Message msg=new Message();
        try{
            consumption_serviceService.edit(consumption_service);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }

    //查找服务
    @RequestMapping("/selectByName")
    public String selectByName(HttpServletRequest request,String serviceName){
        List<Consumption_service> consumption_services = consumption_serviceService.selectByServiceName(serviceName);
        request.getSession().setAttribute("consumption_services",consumption_services);

        int num=consumption_services.size();
        request.getSession().setAttribute("num",num);
        return "consumption_service";
    }
}
