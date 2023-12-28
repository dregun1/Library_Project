package com.ezen.security;

import java.util.Collection;


import org.springframework.security.core.GrantedAuthority;

import org.springframework.security.core.userdetails.User;

import com.ezen.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {

    private static final long serialVersionUID = 1L;

    private MemberVO member;

    public CustomUser(MemberVO vo, Collection<? extends GrantedAuthority> roles) {
        super(vo.getMemberid(), vo.getPasscode(), roles);
        this.member = vo;
    }
}
