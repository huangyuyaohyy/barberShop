package com.yq.barberShopSSM.service;

import com.yq.barberShopSSM.pojo.Manager;

/**
 * create by hyy on 17:47
 */
public interface ManagerService {
    Manager login(String manager_name, String password);
}
