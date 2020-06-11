package com.yq.barberShopSSM.controller;

import com.yq.barberShopSSM.pojo.Gift;
import com.yq.barberShopSSM.service.GiftService;
import com.yq.barberShopSSM.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * create by hyy on 15:31
 */
@RequestMapping("/gifts")
@Controller
public class GiftController {
    @Autowired
    private GiftService giftService;
    @RequestMapping("/giftList")
    public String getGiftList(HttpServletRequest request){
        List<Gift> gifts = giftService.selectAll();

        request.getSession().setAttribute("gifts",gifts);

        int num=gifts.size();
        request.getSession().setAttribute("num",num);
        return "gift";
    }

    @RequestMapping("/add")
    @ResponseBody
    public Message add(Gift gift){
        Message msg=new Message();
        try{

            giftService.add(gift);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }

    @RequestMapping("/giftEdit")
    public String giftEdit(HttpServletRequest request,Integer id){

        Gift gift= giftService.selectByPrimaryKey(id);
        request.getSession().setAttribute("gift",gift);
        return "giftEdit";
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Message edit(Gift gift){
        Message msg=new Message();
        try{
            giftService.edit(gift);
            msg.setMsg("success");
            return msg;
        }catch (Exception e){
            e.printStackTrace();
            msg.setMsg("操作繁忙");
            return msg;
        }

    }


    @RequestMapping("/giftEditImg")
    public String giftEditImg(HttpServletRequest request,Integer id){

        Gift gift= giftService.selectByPrimaryKey(id);

        request.getSession().setAttribute("gift",gift);
        return "giftEditImg";
    }

    //保存图片
    @RequestMapping("/saveImg")
    public String saveImg(HttpServletRequest request, MultipartFile upload, Integer giftId){
        giftService.upLoadFile(upload,giftId);
        request.setAttribute("msg","上传成功！");
        return getGiftList(request);//返回礼品信息界面
    }


    //查找礼品
    @RequestMapping("/selectByName")
    public String selectByName(HttpServletRequest request,String giftName){
        List<Gift> gifts = giftService.selectByName(giftName);

        request.getSession().setAttribute("gifts",gifts);

        int num=gifts.size();
        request.getSession().setAttribute("num",num);
        return "gift";
    }
}
