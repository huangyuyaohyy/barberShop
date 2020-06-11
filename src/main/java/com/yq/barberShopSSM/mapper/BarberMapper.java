package com.yq.barberShopSSM.mapper;

import com.yq.barberShopSSM.pojo.Barber;
import java.util.List;

public interface BarberMapper {
    int deleteByPrimaryKey(Integer barberId);

    int insert(Barber record);

    Barber selectByPrimaryKey(Integer barberId);

    List<Barber> selectAll();

    int updateByPrimaryKey(Barber record);

    List<Barber> selectByName(String barberName);
}