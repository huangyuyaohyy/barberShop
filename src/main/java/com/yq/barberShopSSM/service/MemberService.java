package com.yq.barberShopSSM.service;

import com.yq.barberShopSSM.pojo.Member;

import java.util.List;

/**
 * create by hyy on 17:12
 */
public interface MemberService {
    List<Member> selectAll();

    Member login(String member_name, String password);

    void add(Member member);

    Member selectByName(String memberName);

    Member selectByPrimaryKey(Integer id);

    List<Member> selectByMemberName(String memberName);

    void edit(Member member);
}
