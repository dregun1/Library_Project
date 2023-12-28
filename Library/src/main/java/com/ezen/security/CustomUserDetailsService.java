package com.ezen.security;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.ezen.domain.MemberVO;
import com.ezen.domain.MemberVO;
import com.ezen.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;


@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

	    MemberVO vo = memberMapper.readInfo(username);
	    if (vo == null) {
	        throw new UsernameNotFoundException("User not found with username: " + username);
	    }

	    List<GrantedAuthority> roles = Collections.singletonList(new SimpleGrantedAuthority(vo.getMemberflag()));
	    
	    log.warn("권한>>>>>>>>>>>>>" + vo.getMemberflag());
	    return new CustomUser(vo, roles);
	}

}
