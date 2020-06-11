package com.yq.barberShopSSM.service;

import com.yq.barberShopSSM.pojo.Point_gift;

import java.util.List;

/**
 * create by hyy on 17:00
 */
public interface Point_giftService {
    List<Point_gift> selectAll();

    void add(Point_gift point_gift);

    List<Point_gift> selectByState(int i);

    Point_gift selectByPrimaryKey(Integer pointGiftId);

    void updateState(Point_gift point_gift);

    List<Point_gift> selectByMember(Integer memberId);
}
