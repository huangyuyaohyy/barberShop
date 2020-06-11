package com.yq.barberShopSSM.service.serviceImpl;

import com.yq.barberShopSSM.mapper.Consumption_recordMapper;
import com.yq.barberShopSSM.mapper.Consumption_serviceMapper;
import com.yq.barberShopSSM.pojo.Consumption_record;
import com.yq.barberShopSSM.pojo.Consumption_service;
import com.yq.barberShopSSM.service.Consumption_recordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * create by hyy on 17:37
 */
@Service
public class Consumption_recordServiceImpl implements Consumption_recordService {
    @Autowired
    private Consumption_recordMapper consumption_recordMapper;
    @Autowired
    private Consumption_serviceMapper consumption_serviceMapper;

    @Override
    public List<Consumption_record> selectAll() {

        return consumption_recordMapper.selectAll();
    }

    @Override
    public Consumption_record selectByPrimaryKey(Integer id) {
        return consumption_recordMapper.selectByPrimaryKey(id);
    }

    @Override
    public void edit(Consumption_record consumption_record) {
        //价格
        Consumption_service consumption_service=consumption_serviceMapper.selectByPrimaryKey(consumption_record.getconsumptionServiceId());
        consumption_record.setPrice(consumption_service.getPrice());
        //时间
        Consumption_record r=consumption_recordMapper.selectByPrimaryKey(consumption_record.getConsumptionRecordId());
        consumption_record.setConsumptionTime(r.getConsumptionTime());

        consumption_recordMapper.updateByPrimaryKey(consumption_record);
    }

    @Override
    public void add(Consumption_record consumption_record) {
        //获取时间
        //设置时间为当前时间
        Date date = new Date();
        consumption_record.setConsumptionTime(date);

        consumption_recordMapper.insert(consumption_record);
    }

    @Override
    public List<Consumption_record> selectByMemberId(Integer memberId) {
        return consumption_recordMapper.selectByMemberId(memberId);
    }

}
