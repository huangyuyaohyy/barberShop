package com.yq.barberShopSSM.pojo;

import java.io.Serializable;

public class Point implements Serializable {
    private Integer pointId;

    private Integer memberId;

    private Integer num;

    private String memberName;

    private static final long serialVersionUID = 1L;

    public Integer getPointId() {
        return pointId;
    }

    public void setPointId(Integer pointId) {
        this.pointId = pointId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }
}