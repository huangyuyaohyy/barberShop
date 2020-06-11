package com.yq.barberShopSSM.service.serviceImpl;

import com.yq.barberShopSSM.mapper.Point_giftMapper;
import com.yq.barberShopSSM.pojo.Point_gift;
import com.yq.barberShopSSM.service.Point_giftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * create by hyy on 17:00
 */
@Service
public class Point_giftServiceImpl implements Point_giftService {
    @Autowired
    private Point_giftMapper point_giftMapper;

    @Override
    public List<Point_gift> selectAll() {
        return point_giftMapper.selectAll();
    }

    @Override
    public void add(Point_gift point_gift) {
        //设置兑换时间
        //设置时间为当前时间
        Date date = new Date();
        point_gift.setDealTime(date);
        //设置兑换状态为0（未兑换）
        point_gift.setState(0);
        point_giftMapper.insert(point_gift);
    }

    @Override
    public List<Point_gift> selectByState(int i) {
        return point_giftMapper.selectByState(i);
    }

    @Override
    public Point_gift selectByPrimaryKey(Integer pointGiftId) {
        return point_giftMapper.selectByPrimaryKey(pointGiftId);
    }

    @Override
    public void updateState(Point_gift point_gift) {
        //设置到店时间
        point_gift.setFactTime(new Date());
        //设置兑换状态为1（兑换）
        point_gift.setState(1);
        point_giftMapper.updateByPrimaryKey(point_gift);
    }

    //会员兑换记录查询
    @Override
    public List<Point_gift> selectByMember(Integer memberId) {
        return point_giftMapper.selectByMember(memberId);
    }


}
