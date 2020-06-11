package com.yq.barberShopSSM.service.serviceImpl;

import com.yq.barberShopSSM.mapper.Consumption_serviceMapper;
import com.yq.barberShopSSM.pojo.Consumption_service;
import com.yq.barberShopSSM.service.Consumption_serviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * create by hyy on 16:46
 */
@Service
public class Consumption_serviceServiceImpl implements Consumption_serviceService {
    @Autowired
    private Consumption_serviceMapper consumption_serviceMapper;

    @Override
    public Consumption_service selectByName(String consumptionServiceName) {
        return consumption_serviceMapper.selectByName(consumptionServiceName);
    }

    @Override
    public List<Consumption_service> selectAll() {
        return consumption_serviceMapper.selectAll();
    }

    @Override
    public void add(Consumption_service consumption_service) {
        consumption_serviceMapper.insert(consumption_service);
    }

    @Override
    public Consumption_service selectByPrimaryKey(Integer id) {
        return consumption_serviceMapper.selectByPrimaryKey(id);
    }

    @Override
    public void edit(Consumption_service consumption_service) {
        consumption_serviceMapper.updateByPrimaryKey(consumption_service);
    }

    @Override
    public List<Consumption_service> selectByServiceName(String serviceName) {
        return consumption_serviceMapper.selectByServiceName(serviceName);
    }
}
