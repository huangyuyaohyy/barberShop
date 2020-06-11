package com.yq.barberShopSSM.service;

import com.yq.barberShopSSM.pojo.Consumption_service;

import java.util.List;

/**
 * create by hyy on 16:46
 */
public interface Consumption_serviceService {

     Consumption_service selectByName(String consumptionServiceName) ;

    List<Consumption_service> selectAll();

    void add(Consumption_service consumption_service);

    Consumption_service selectByPrimaryKey(Integer id);

    void edit(Consumption_service consumption_service);

    List<Consumption_service> selectByServiceName(String serviceName);
}
