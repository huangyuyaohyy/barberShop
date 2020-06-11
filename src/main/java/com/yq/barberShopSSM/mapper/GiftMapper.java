package com.yq.barberShopSSM.mapper;

import com.yq.barberShopSSM.pojo.Gift;
import java.util.List;

public interface GiftMapper {
    int deleteByPrimaryKey(Integer giftId);

    int insert(Gift record);

    Gift selectByPrimaryKey(Integer giftId);

    List<Gift> selectAll();

    int updateByPrimaryKey(Gift record);

    List<Gift> selectByName(String giftName);

    List<Gift> selectByState(Integer state);
}