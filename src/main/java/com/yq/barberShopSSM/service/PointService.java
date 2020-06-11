package com.yq.barberShopSSM.service;

import com.yq.barberShopSSM.pojo.Point;

import java.util.List;

/**
 * create by hyy on 17:08
 */
public interface PointService {
    void add(Point point);

    void update(Point point);

    Point selectByMember(Integer memberId);

    List<Point> selectAll();

    Point selectByPrimaryKey(Integer pointId);
}
