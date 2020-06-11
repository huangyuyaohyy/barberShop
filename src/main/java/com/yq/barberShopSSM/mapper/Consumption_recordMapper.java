package com.yq.barberShopSSM.mapper;

import com.yq.barberShopSSM.pojo.Consumption_record;
import java.util.List;

public interface Consumption_recordMapper {
    int deleteByPrimaryKey(Integer consumptionRecordId);

    int insert(Consumption_record record);

    Consumption_record selectByPrimaryKey(Integer consumptionRecordId);

    List<Consumption_record> selectAll();

    int updateByPrimaryKey(Consumption_record record);

    List<Consumption_record> selectByMemberId(Integer memberId);
}