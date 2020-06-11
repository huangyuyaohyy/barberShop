package com.yq.barberShopSSM.controller;

import com.yq.barberShopSSM.pojo.Manager;
import com.yq.barberShopSSM.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * create by hyy on 17:42
 */
@RequestMapping("/managers")
@Controller
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        //先从域中获取对象
        Manager manager = (Manager) request.getSession().getAttribute("manager");
        if(manager!=null){
            //我们在域中添加user对象时，会给session设置过期时间
            //有一个redis的nosql数据路，会存储我们的user值，通过uuId函数生成一个token
            request.getSession().setAttribute("manager",manager);
            //初始化主页面的信息

            return "index";
        }else {
            return "login";
        }
    }


    @RequestMapping("/login")
    public String login(String manager_name, String password, HttpServletRequest request){
        Manager manager = managerService.login(manager_name, password);
        if (manager!=null){

            //初始化主页面数据

            return "index";
        }else {
            request.setAttribute("msg","用户名或密码错误");
            return "login";
        }

    }
}
