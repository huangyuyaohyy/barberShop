package com.yq.barberShopSSM.service.serviceImpl;

import com.yq.barberShopSSM.mapper.ManagerMapper;
import com.yq.barberShopSSM.pojo.Manager;
import com.yq.barberShopSSM.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * create by hyy on 17:48
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerMapper managerMapper;
    @Override
    public Manager login(String manager_name, String password) {
        Manager manager= managerMapper.selectByManager_name(manager_name);
        if (manager!=null){

            if (manager.getPassword().equals(password)){
                return manager;
            }else {
                return null;
            }
        }
        return null;
    }
}
