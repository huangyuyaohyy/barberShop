package com.yq.barberShopSSM.service;

import com.yq.barberShopSSM.pojo.Barber;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * create by hyy on 23:37
 */
public interface BarberService {
    List<Barber> selectAll();

    void add(Barber barber);

    Barber selectByPrimaryKey(Integer id);

    void edit(Barber barber);

    void upLoadFile(MultipartFile upload, Integer barberId);

    List<Barber> selectByName(String barberName);
}
