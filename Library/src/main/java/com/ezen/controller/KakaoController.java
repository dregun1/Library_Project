package com.ezen.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.domain.MemberVO;
import com.ezen.security.CustomUser;
import com.ezen.service.KakaoService;
import com.ezen.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class KakaoController {

	@Autowired
	KakaoService Kakaoservice;
	
	@Autowired
	MemberService memberservice;
	
    @GetMapping("/login/kakao")
    public String kakaoLogin() {   	
    	return "redirect:https://kauth.kakao.com/oauth/authorize?client_id=a4b004a205cbadc45d9bef8bf83220f2&redirect_uri=http://localhost:8080/kakao_callback&response_type=code&prompt=login";
    	         
    }

    @RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
    public String redirectkakao(@RequestParam String code, HttpSession session) throws IOException {

        // 접속토큰 get
        String kakaoToken = Kakaoservice.getReturnAccessToken(code);

        // 접속자 정보 get
        Map<String, Object> result = Kakaoservice.getUserInfo(kakaoToken);
        String kakaoId = (String) result.get("id");
        String userName = (String) result.get("nickname");
        String email = (String) result.get("email");
        String userpw = kakaoId;

        // 분기
        MemberVO membervo = new MemberVO();
        // 일치하는 kakaoId 없을 시 회원가입
        System.out.println(memberservice.SelectID(kakaoId) + "카카오 정보로 로그인");
        if (memberservice.SelectID(kakaoId) == null) {
            log.warn("카카오에서 가져온 정보로 회원가입");
            membervo.setMemberid(kakaoId);
            membervo.setPasscode(userpw);
            membervo.setMembername(userName);
            membervo.setEmail(email);
            memberservice.memberJoin(membervo);
        }

        // 일치하는 kakaoId가 있으면 멤버객체에 담음.
        String userid = memberservice.SelectID(kakaoId);
        MemberVO vo = memberservice.readInfo(kakaoId);
            /*Security Authentication에 붙이는 과정*/
        List<GrantedAuthority> roles = Collections.singletonList(new SimpleGrantedAuthority(vo.getMemberflag()));
        CustomUser user = new CustomUser(vo, roles);
        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
        SecurityContextHolder.getContext().setAuthentication(auth);

        /* 로그아웃 처리 시, 사용할 토큰 값 */
        session.setAttribute("kakaoToken", kakaoToken);

        return "redirect:/book/bookMain";
    }
    @PostMapping("/logout")
    public String kakaoLogout(HttpSession session) {
        String kakaoToken = (String) session.getAttribute("kakaoToken");
        SecurityContextHolder.clearContext();
        
        if (kakaoToken != null) {
            Kakaoservice.kakaoLogout(kakaoToken, session);
        }

        // 로그아웃 후 메인 페이지로 리다이렉트
        return "redirect:/book/bookMain";
    }
  
}
    
    
