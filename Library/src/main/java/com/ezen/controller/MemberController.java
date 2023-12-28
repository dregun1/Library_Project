package com.ezen.controller;

import java.security.Principal;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.domain.MemberVO;
import com.ezen.service.MemberService;


import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Autowired
	private PasswordEncoder passwordencoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/join")
	public void joinaccess() {};

	@GetMapping("/modify")
	public void selectMember() {};
	
	@GetMapping("/pwCheck")
	public void pwCheck(){};

	//메인페이지
	@PostMapping("/main")
	public String modifyMember(RedirectAttributes rttr) {
		return "redirect:/book/bookMain";
	}
	
	//회원가입
	@PostMapping("/join")
	public String joinMember(MemberVO member,RedirectAttributes rttr) {
		boolean joinresult = service.memberJoin(member);
		int result = 0;
	
		if(joinresult) {
			result = 1;
		}
		rttr.addFlashAttribute("result",result);
		return "redirect:/customLogin";
	}
	
	//회원 정보수정
	@PostMapping("/modify")
	public String modifyMember(MemberVO member, RedirectAttributes rttr) {
		boolean modifyresult = service.membermodify(member);
		int result = 0;
		
		if(modifyresult) {
			result = 1;
		}
		rttr.addFlashAttribute("result",result);
		return "redirect:/book/bookMain";
	}
	

		
	
	//아이디중복체크
	@GetMapping("/IdDuplicationCheck")
	public String modifyMember(@ModelAttribute("memberid") String memberid, Model model) {
		int result = 0;
		if(service.SelectID(memberid) != null) {
			result = 1;
		}
		model.addAttribute("result", result);
	    return "/member/idDuplicationCheck"; 
	}
	
	//이메일 보내기 잭스
	@ResponseBody
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public String emailAuth(String email) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

        String setFrom = "dregun1@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            log.error("메일 전송 중 오류 발생: " + e.getMessage());
            return "error";
        }
        
        return Integer.toString(checkNum);
 
	}
	
	//폼제출할 때 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(String id) {		
		 if (service.SelectID(id) != null) {
		        return "duplicate";
		    } else {
		        return "unique";
		    }	
	}
	
	//비밀번호 일치하는가.
	@PostMapping("/pwCheck")
	public String pwCheck(String passcode, Principal principal, RedirectAttributes rttr) {
		  String username = principal.getName();
		  
		  log.info("유저이름 >>>>>>>>>>>" + username);
		  String storedEncodedPassword = service.SelectPW(username);
		  
		  log.info("찾아온 비번 >>>>>>>>>>>" + storedEncodedPassword );
		  if (passwordencoder.matches(passcode, storedEncodedPassword)){
			  return "member/pwModify";
		  }rttr.addFlashAttribute("result",-1);
			return "redirect:/member/pwCheck";
	}   
	
	//비밀번호변경
	@PostMapping("/pwModify")
	public String pwCheck(String passcode, RedirectAttributes rttr, Principal principal) {
		String username = principal.getName();
		String pw = passwordencoder.encode(passcode);
		
		service.updatePW(pw, username);
		return "redirect:/book/bookMain";
	}   
	
	
	
}