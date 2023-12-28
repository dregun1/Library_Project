package com.ezen.mapper;

import com.ezen.domain.MemberVO;

public interface MemberMapper {

	
	//회원정보읽어오기
	public MemberVO readInfo(String id);
	
	
	//해당 아이디가 있는지 검색 '카카오에서 로그인또는 회원가입 한 후 그 아이디가 있는 지 찾기 위해'
	public String SelectID(String id); 
	
	
	//일반 회원가입
	public boolean memberJoin(MemberVO vo);
	
	//비밀번호 있는지
	public String SelectPW(String id);
	

	//회원정보수정
	public boolean memberupdate(MemberVO vo);
	
	//비밀번호 수정
	public void pwUpdate(String passcode, String memberid);
	
}
