package com.yq.barberShopSSM.service.serviceImpl;

import com.yq.barberShopSSM.mapper.MemberMapper;
import com.yq.barberShopSSM.pojo.Member;
import com.yq.barberShopSSM.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * create by hyy on 17:12
 */
@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;
    @Override
    public List<Member> selectAll() {
        return memberMapper.selectAll();
    }

    @Override
    public Member login(String member_name, String password) {
        Member member=memberMapper.selectByMember_name(member_name);
        if (member!=null){

            if (member.getPassword().equals(password)){
                return member;
            }else {
                return null;
            }
        }
        return null;

    }

    @Override
    public void add(Member member) {
        memberMapper.insert(member);
    }

    @Override
    public Member selectByName(String memberName) {
        return memberMapper.selectByMember_name(memberName);
    }

    @Override
    public Member selectByPrimaryKey(Integer id) {
        return memberMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Member> selectByMemberName(String memberName) {
        return memberMapper.selectByName(memberName);
    }

    @Override
    public void edit(Member member) {
        memberMapper.updateByPrimaryKey(member);
    }

}
