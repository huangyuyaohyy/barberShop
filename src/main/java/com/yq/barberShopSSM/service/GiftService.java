package com.yq.barberShopSSM.service;

import com.yq.barberShopSSM.pojo.Gift;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * create by hyy on 15:32
 */
public interface GiftService {
    List<Gift> selectAll();

    void add(Gift gift);

    Gift selectByPrimaryKey(Integer id);

    void edit(Gift gift);

    void upLoadFile(MultipartFile upload, Integer giftId);

    List<Gift> selectByName(String giftName);

    List<Gift> selectByState();

    void update(Gift gift);
}
