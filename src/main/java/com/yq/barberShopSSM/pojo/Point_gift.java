package com.yq.barberShopSSM.pojo;

import java.io.Serializable;
import java.util.Date;

public class Point_gift implements Serializable {
    private Integer pointGiftId;

    private Integer memberId;

    private Integer giftId;

    private String tel;

    private Integer state;

    private Date dealTime;

    private Date factTime;

    private String deal;
    private String fact;
    private String memberName;
    private String giftName;
    private String stateName;


    private static final long serialVersionUID = 1L;

    public Integer getPointGiftId() {
        return pointGiftId;
    }

    public void setPointGiftId(Integer pointGiftId) {
        this.pointGiftId = pointGiftId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getGiftId() {
        return giftId;
    }

    public void setGiftId(Integer giftId) {
        this.giftId = giftId;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }

    public Date getFactTime() {
        return factTime;
    }

    public void setFactTime(Date factTime) {
        this.factTime = factTime;
    }

    public String getDeal() {
        return deal;
    }

    public void setDeal(String deal) {
        this.deal = deal;
    }

    public String getFact() {
        return fact;
    }

    public void setFact(String fact) {
        this.fact = fact;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getGiftName() {
        return giftName;
    }

    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }
}