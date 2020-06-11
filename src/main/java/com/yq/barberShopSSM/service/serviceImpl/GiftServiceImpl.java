package com.yq.barberShopSSM.service.serviceImpl;

import com.yq.barberShopSSM.mapper.GiftMapper;
import com.yq.barberShopSSM.pojo.Gift;
import com.yq.barberShopSSM.service.GiftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * create by hyy on 15:32
 */
@Service
public class GiftServiceImpl implements GiftService {
    @Autowired
    private GiftMapper giftMapper;


    private String filePath="D:/ideaworkspace/barberShopSSM/src/main/webapp/image/"; //定义上传文件的存放位置

    @Override
    public List<Gift> selectAll() {
        return giftMapper.selectAll();
    }

    @Override
    public void add(Gift gift) {
        gift.setImage("image/wu.jpeg");
        giftMapper.insert(gift);
    }

    @Override
    public Gift selectByPrimaryKey(Integer id) {
        return giftMapper.selectByPrimaryKey(id);
    }

    @Override
    public void edit(Gift gift) {
        Gift f=giftMapper.selectByPrimaryKey(gift.getGiftId());
        gift.setImage(f.getImage());
        giftMapper.updateByPrimaryKey(gift);
    }

    @Override
    public void upLoadFile(MultipartFile upload, Integer giftId) {
        String fileName = upload.getOriginalFilename();  //获取上传文件的名字
        //判断文件夹是否存在,不存在则创建
        File file=new File(filePath);
        System.out.println(fileName);

        //保存礼品图片信息
        if(fileName!=null||!fileName.equals("")) {
            Gift gift = giftMapper.selectByPrimaryKey(giftId);
            gift.setImage("image/" + fileName);
            giftMapper.updateByPrimaryKey(gift);
        }

        if(!file.exists()){
            file.mkdirs();
        }

        String newFilePath=filePath+fileName; //新文件的路径

        try {
            upload.transferTo(new File(newFilePath));  //将传来的文件写入新建的文件

        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Gift> selectByName(String giftName) {
        return giftMapper.selectByName(giftName);
    }

    @Override
    public List<Gift> selectByState() {
        return giftMapper.selectByState(1);
    }

    @Override
    public void update(Gift gift) {
         giftMapper.updateByPrimaryKey(gift);
    }
}
