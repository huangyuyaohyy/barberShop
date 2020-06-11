package com.yq.barberShopSSM.mapper;

import com.yq.barberShopSSM.pojo.Member;
import java.util.List;

public interface MemberMapper {
    int deleteByPrimaryKey(Integer memberId);

    int insert(Member record);

    Member selectByPrimaryKey(Integer memberId);

    List<Member> selectAll();

    int updateByPrimaryKey(Member record);

    Member selectByMember_name(String member_name);


    List<Member> selectByName(String memberName);
}