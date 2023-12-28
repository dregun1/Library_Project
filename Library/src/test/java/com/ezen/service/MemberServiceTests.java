package com.ezen.service;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.domain.MemberVO;
import com.ezen.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberServiceTests {

	@Autowired
	private PasswordEncoder passwordencoder;
	
	@Autowired
	MemberService service;
	
	@Test
	public void testadd() {
		MemberVO vo =new MemberVO();  
		vo.setMemberid("ex");
		vo.setPasscode("ex");
		vo.setBirthdate("1998-05-15");
		vo.setEmail("dregun1@naver.com");
		
		boolean result = service.memberJoin(vo);
		
		log.info(result);
		}
	
	@Test
	public void testmodify(){
		MemberVO vo = new MemberVO();
		vo.setMemberid("ex1");
		vo.setBirthdate("1971-08-08");
		vo.setDetailaddress("어느 별에서 왔니");
		
		boolean result = service.membermodify(vo);
		log.info(result);
	}
	
	@Test
	public void testSelectPW() {
	    String memberid = "ex1";
	    String storedEncodedPassword = service.SelectPW(memberid); //데이터에 저장된 비밀번호
	   
	    String inputPassword = "ex1"; //사용자가 입력할 비밀번호 
	    String encodedInputPassword = passwordencoder.encode(inputPassword);
	   
	    if (passwordencoder.matches(inputPassword, storedEncodedPassword)) {
	        log.info("비밀번호가 일치합니다.");
	    } else {
	        log.info("비밀번호가 일치하지 않습니다.");
	    }
	}
	
	@Test
	public void testUpdatepw() {
		
		String username = "ex1";
		String pw = passwordencoder.encode("ex11");
		
		service.updatePW(pw, username);
		}
}
