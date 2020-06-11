package com.yq.barberShopSSM.service;

import com.yq.barberShopSSM.pojo.Consumption_record;

import java.util.List;

/**
 * create by hyy on 17:37
 */
public interface Consumption_recordService {
    List<Consumption_record> selectAll();

    Consumption_record selectByPrimaryKey(Integer id);

    void edit(Consumption_record consumption_record);

    void add(Consumption_record consumption_record);

    List<Consumption_record> selectByMemberId(Integer memberId);
}
