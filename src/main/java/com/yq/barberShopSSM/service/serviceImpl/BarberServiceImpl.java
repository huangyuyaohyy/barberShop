package com.yq.barberShopSSM.service.serviceImpl;

import com.yq.barberShopSSM.mapper.BarberMapper;
import com.yq.barberShopSSM.pojo.Barber;
import com.yq.barberShopSSM.service.BarberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * create by hyy on 23:37
 */
@Service
public class BarberServiceImpl implements BarberService {
    @Autowired
    BarberMapper barberMapper;

    private String filePath="D:/ideaworkspace/barberShopSSM/src/main/webapp/image/"; //定义上传文件的存放位置


    @Override
    public List<Barber> selectAll() {
        return barberMapper.selectAll();
    }

    @Override
    public void add(Barber barber) {
        barber.setImage("image/moren.jpeg");//设置默认头像
        barberMapper.insert(barber);
    }

    @Override
    public Barber selectByPrimaryKey(Integer id) {
        return barberMapper.selectByPrimaryKey(id);
    }

    @Override
    public void edit(Barber barber) {
        Barber b=barberMapper.selectByPrimaryKey(barber.getBarberId());
        barber.setImage(b.getImage());
        barberMapper.updateByPrimaryKey(barber);
    }

    @Override
    public void upLoadFile(MultipartFile upload, Integer barberId) {
        String fileName = upload.getOriginalFilename();  //获取上传文件的名字
        //判断文件夹是否存在,不存在则创建
        File file=new File(filePath);
        System.out.println(fileName);

        //保存理发师头像信息
        if(fileName!=null||!fileName.equals("")) {
            Barber barber = barberMapper.selectByPrimaryKey(barberId);
            barber.setImage("image/" + fileName);
            barberMapper.updateByPrimaryKey(barber);
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
    public List<Barber> selectByName(String barberName) {
        return barberMapper.selectByName(barberName);
    }
}
