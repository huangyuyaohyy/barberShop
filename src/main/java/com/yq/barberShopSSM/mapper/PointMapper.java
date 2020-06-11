package com.yq.barberShopSSM.mapper;

import com.yq.barberShopSSM.pojo.Point;
import java.util.List;

public interface PointMapper {
    int deleteByPrimaryKey(Integer pointId);

    int insert(Point record);

    Point selectByPrimaryKey(Integer pointId);

    List<Point> selectAll();

    int updateByPrimaryKey(Point record);

    Point selectByMember(Integer memberId);
}