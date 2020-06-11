package com.yq.barberShopSSM.pojo;

import java.io.Serializable;

public class Consumption_service implements Serializable {
    private Integer consumptionServiceId;

    private String serviceName;

    private Integer price;

    private String image;

    private String introduce;

    private static final long serialVersionUID = 1L;

    public Integer getConsumptionServiceId() {
        return consumptionServiceId;
    }

    public void setConsumptionServiceId(Integer consumptionServiceId) {
        this.consumptionServiceId = consumptionServiceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName == null ? null : serviceName.trim();
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }
}