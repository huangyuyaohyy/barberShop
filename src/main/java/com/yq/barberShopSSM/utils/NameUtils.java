package com.yq.barberShopSSM.utils;

import com.yq.barberShopSSM.pojo.Barber;
import com.yq.barberShopSSM.pojo.Consumption_record;
import com.yq.barberShopSSM.pojo.Consumption_service;
import com.yq.barberShopSSM.pojo.Member;
import com.yq.barberShopSSM.service.BarberService;
import com.yq.barberShopSSM.service.Consumption_serviceService;
import com.yq.barberShopSSM.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * create by hyy on 15:52
 */
public class NameUtils {

    @Autowired
    static private MemberService memberService;
    @Autowired
    static private BarberService barberService;
    @Autowired
    static private Consumption_serviceService consumption_serviceService;

    public static List<Consumption_record> dealConsumption_recordsName(List<Consumption_record> consumption_records){
        for (int i = 0; i < consumption_records.size(); i++) {
            //消费项目名称
            Consumption_service consumption_service=consumption_serviceService.selectByPrimaryKey(consumption_records.get(i).getconsumptionServiceId());
            consumption_records.get(i).setConsumptionServiceName(consumption_service.getServiceName());
//            //理发师姓名
            Barber barber=barberService.selectByPrimaryKey(consumption_records.get(i).getBarberId());
            consumption_records.get(i).setBarberName(barber.getBarberName());
            //会员姓名
            Member member=memberService.selectByPrimaryKey(consumption_records.get(i).getMemberId());
            consumption_records.get(i).setMemberName(member.getMemberName());
        }
        return consumption_records;
    }
}
