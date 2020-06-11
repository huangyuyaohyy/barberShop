package com.yq.barberShopSSM.mapper;

import com.yq.barberShopSSM.pojo.Consumption_service;
import java.util.List;

public interface Consumption_serviceMapper {
    int deleteByPrimaryKey(Integer consumptionServiceId);

    int insert(Consumption_service record);

    Consumption_service selectByPrimaryKey(Integer consumptionServiceId);

    List<Consumption_service> selectAll();

    int updateByPrimaryKey(Consumption_service record);

    Consumption_service selectByName(String service_name);

    List<Consumption_service> selectByServiceName(String serviceName);
}