package com.yq.barberShopSSM.mapper;

import com.yq.barberShopSSM.pojo.Point_gift;
import java.util.List;

public interface Point_giftMapper {
    int deleteByPrimaryKey(Integer pointGiftId);

    int insert(Point_gift record);

    Point_gift selectByPrimaryKey(Integer pointGiftId);

    List<Point_gift> selectAll();

    int updateByPrimaryKey(Point_gift record);

    List<Point_gift> selectByState(int i);

    List<Point_gift> selectByMember(Integer memberId);
}