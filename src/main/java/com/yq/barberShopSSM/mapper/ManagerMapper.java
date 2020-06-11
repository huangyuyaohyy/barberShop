package com.yq.barberShopSSM.mapper;

import com.yq.barberShopSSM.pojo.Manager;
import java.util.List;

public interface ManagerMapper {
    int deleteByPrimaryKey(Integer managerId);

    int insert(Manager record);

    Manager selectByPrimaryKey(Integer managerId);

    List<Manager> selectAll();

    int updateByPrimaryKey(Manager record);

    Manager selectByManager_name(String manager_name);
}