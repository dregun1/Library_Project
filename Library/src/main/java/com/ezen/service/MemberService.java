package com.ezen.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.domain.MemberVO;
import com.ezen.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService  {
	
	
	private final MemberMapper mapper;
	private final PasswordEncoder passwordencoder;
	
	//일반 회원가입
	public boolean memberJoin(MemberVO vo) {
		
		String currentDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        vo.setJoindate(currentDate);
        
        String pass = vo.getPasscode();      
    	vo.setPasscode(passwordencoder.encode(pass));
    	
		return mapper.memberJoin(vo);
	}	

	//해당 아이디가 있는지 검색 '카카오에서 로그인또는 회원가입 한 후 그 아이디가 있는 지 찾기 위해'
	//아이디가 중복됐는지 검색하기 위해 아이디 서치.
	public String SelectID(String Id) {
		return mapper.SelectID(Id);
	}; 
	
	//회원정보읽어오기
	public MemberVO readInfo(String id) {
		MemberVO vo = new MemberVO();
		vo = mapper.readInfo(id);
		return vo;
	};
	
	//정보수정
	public boolean membermodify(MemberVO vo) {
		return mapper.memberupdate(vo);
	}
	
	//비밀번호 가져오기
	public String SelectPW(String id) {
		return mapper.SelectPW(id);
	}
	
	//비밀번호 변경
	public void updatePW(String passcode, String memberid) {
		mapper.pwUpdate(passcode, memberid);
	}
}
