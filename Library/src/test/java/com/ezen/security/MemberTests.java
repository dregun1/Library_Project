package com.ezen.security;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.domain.MemberVO;
import com.ezen.domain.MemberVO;
import com.ezen.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberTests {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private PasswordEncoder passwordencoder;
	
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testInsertMember() {
		String sql = "insert into member(id, pw, auth ,name) values(?,?,?,?)";
		
		for(int i=0; i<10; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(2, passwordencoder.encode("pw"+i));
				
				if(i<3) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(3, "A");
					pstmt.setString(4, "유저입니다"+i);
				}else if(i<7) {
					pstmt.setString(1, "manager"+i);
					pstmt.setString(3, "B");
					pstmt.setString(4, "매니저입니다"+i);
				}else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(3, "A");
					pstmt.setString(4, "어드민입니다"+i);
				}
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt !=null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Test
	public void testRead() {
		
		MemberVO vo = mapper.readInfo("admin9");
		
		log.info(vo.getMemberflag());
	}
	
	
	
}
