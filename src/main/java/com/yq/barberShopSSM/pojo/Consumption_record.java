package com.yq.barberShopSSM.pojo;

import java.io.Serializable;
import java.util.Date;

public class Consumption_record implements Serializable {
    private Integer consumptionRecordId;

    private Integer consumptionServiceId;

    private Integer barberId;

    private Integer memberId;

    private Integer price;

    private Date consumptionTime;

    public Consumption_record() {
    }


    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    private String time;
    private String barberName;
    private String memberName;
    private String consumptionServiceName;

    private static final long serialVersionUID = 1L;

    public Integer getConsumptionRecordId() {
        return consumptionRecordId;
    }

    public void setConsumptionRecordId(Integer consumptionRecordId) {
        this.consumptionRecordId = consumptionRecordId;
    }

    public Integer getBarberId() {
        return barberId;
    }

    public void setBarberId(Integer barberId) {
        this.barberId = barberId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Date getConsumptionTime() {
        return consumptionTime;
    }

    public void setConsumptionTime(Date consumptionTime) {
        this.consumptionTime = consumptionTime;
    }

    public String getBarberName() {
        return barberName;
    }

    public void setBarberName(String barberName) {
        this.barberName = barberName;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public Integer getconsumptionServiceId() {
        return consumptionServiceId;
    }

    public void setconsumptionServiceId(Integer consumption_service_id) {
        this.consumptionServiceId = consumption_service_id;
    }

    public String getConsumptionServiceName() {
        return consumptionServiceName;
    }

    public void setConsumptionServiceName(String consumptionServiceName) {
        this.consumptionServiceName = consumptionServiceName;
    }
}