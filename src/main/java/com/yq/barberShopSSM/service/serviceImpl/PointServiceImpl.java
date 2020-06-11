package com.yq.barberShopSSM.service.serviceImpl;

import com.yq.barberShopSSM.mapper.PointMapper;
import com.yq.barberShopSSM.pojo.Point;
import com.yq.barberShopSSM.service.PointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * create by hyy on 17:08
 */
@Service
public class PointServiceImpl implements PointService {
    @Autowired
    private PointMapper pointMapper;
    @Override
    public void add(Point point) {
        pointMapper.insert(point);
    }

    @Override
    public void update(Point point) {
        pointMapper.updateByPrimaryKey(point);
    }

    @Override
    public Point selectByMember(Integer memberId) {
        return pointMapper.selectByMember(memberId);
    }

    @Override
    public List<Point> selectAll() {
        return pointMapper.selectAll();
    }

    @Override
    public Point selectByPrimaryKey(Integer pointId) {
        return pointMapper.selectByPrimaryKey(pointId);
    }
}
