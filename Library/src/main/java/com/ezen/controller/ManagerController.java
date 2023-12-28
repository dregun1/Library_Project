package com.ezen.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.domain.BookVO;
import com.ezen.domain.Criterial;
import com.ezen.domain.PageDTO;
import com.ezen.mapper.ManagerMapper;
import com.ezen.security.CustomUser;
import com.ezen.service.BookService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/manager/*")
@Log4j
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('01')")
public class ManagerController {

	@Autowired
	BookService bookService;
	
	@Autowired
	ManagerMapper managermapper;
	
		//책등록 페이지
		@GetMapping("/bookInsert")
		public void bookInsert() {}
		
		//책수정 페이지
		@GetMapping("/bookUpdate")
		public void bookUpdate(String isbn, Model model, Criterial cri) {
			model.addAttribute("cri", cri);
			model.addAttribute("book", bookService.get(isbn));
			
		}

		//예약관리 페이지
		@GetMapping("/reservationManagement")
		public void reservationManagement(Criterial cri, Model model) {
			cri.setAmount(20);			
			model.addAttribute("list", managermapper.getManagerReservation(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, managermapper.getReservationTotal(cri)));
		
		}
		
		//대여 중인 리스트
		@GetMapping("/rentalManagement")
		public void rentalManagement(Criterial cri, Model model) {
			cri.setAmount(20);			
			model.addAttribute("list", managermapper.getManagerRentallists(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, managermapper.getCurRentalTotal(cri)));	
		}
		
		
		//지난 대여 리스트
		@GetMapping("/pastRentalManagement")
		public void pastRentalManagement(Criterial cri, Model model) {
			cri.setAmount(20);			
			model.addAttribute("list", managermapper.getPastRentallists(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, managermapper.getPastRentalTotal(cri)));
		
		}

		
		//책 등록
	   @PostMapping("/bookInsert")
	    public String submitForm(@RequestParam("bookimg") MultipartFile file, BookVO book, RedirectAttributes rttr) throws IOException {
	        String title = book.getTitle();
	        String filename = file.getOriginalFilename();
	        log.info("파일네임이랑 이름 >>>>" + file + title);

	        // 파일을 저장할 폴더 경로
	        String uploadDir = "D:\\javaWork\\spring\\Library\\src\\main\\webapp\\resources\\image\\";

	        // 파일 이름에 공백이나 특수 문자가 없도록 조합
	        String safeFilename = title + "_" + filename.replaceAll("[^a-zA-Z0-9.-]", "_");

	        // 파일 객체 생성
	        Path uploadPath = Paths.get(uploadDir);
	        Path filePath = uploadPath.resolve(safeFilename);
	        File f = filePath.toFile();

	        // 현재 사용자의 Authentication 객체를 가져옴
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

	        // 현재 사용자의 Principal 객체에서 memberid를 가져옴
	        String memberId = ((CustomUser) authentication.getPrincipal()).getMember().getMemberid();

	        try {
	            file.transferTo(f);
	            // 데이터베이스에 파일 경로 저장
				/* book.setBookimgurl("/resources/image/" + safeFilename); */
	            book.setBookimgurl(safeFilename);
	            book.setMemberid(memberId);
	            // 데이터베이스에 책 정보 저장
	            bookService.register(book);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return "redirect:/book/bookMain";
	    }
	   
	   
	 //책 수정
	   @PostMapping("/bookUpdate")
	    public String UpdateBook(@RequestParam("bookimg") MultipartFile file, BookVO book, RedirectAttributes rttr) throws IOException {
	        String title = book.getTitle();
	        String filename = file.getOriginalFilename();
	        log.info("파일네임이랑 이름 >>>>" + file + title);

	        // 파일을 저장할 폴더 경로
	        String uploadDir = "D:\\javaWork\\spring\\Library\\src\\main\\webapp\\resources\\image\\";

	        // 파일 이름에 공백이나 특수 문자가 없도록 조합
	        String safeFilename = title + "_" + filename.replaceAll("[^a-zA-Z0-9.-]", "_");

	        // 파일 객체 생성
	        Path uploadPath = Paths.get(uploadDir);
	        Path filePath = uploadPath.resolve(safeFilename);
	        File f = filePath.toFile();

	        // 현재 사용자의 Authentication 객체를 가져옴
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

	        // 현재 사용자의 Principal 객체에서 memberid를 가져옴
	        String memberId = ((CustomUser) authentication.getPrincipal()).getMember().getMemberid();

	        try {
	            file.transferTo(f);
	            // 데이터베이스에 파일 경로 저장
				/* book.setBookimgurl("/resources/image/" + safeFilename); */
	            book.setBookimgurl(safeFilename);
	            book.setMemberid(memberId);
	            // 데이터베이스에 책 정보 저장
	            managermapper.updateBook(book);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return "redirect:/manager/bookManagement";
	    }
	   
	   
	   
	   
	   
	 //예약만료 확인 눌렀을 때.
	@GetMapping("/cancelReserve")
	@ResponseBody
	public ResponseEntity<String> cancelReserve(@RequestParam int id) {

		managermapper.updateCancelReservation(id);
	    
	   return ResponseEntity.ok("success");
	    
	}
	 	
	//대여처리 확인 눌렀을 때.
	@GetMapping("/rental")
	@ResponseBody
	public ResponseEntity<String> rental(@RequestParam String memberid, @RequestParam String isbn) {

		managermapper.addrental(memberid, isbn);
		managermapper.updateRentalStatus(memberid, isbn);
		managermapper.updateBooktable(isbn);
	    
	   return ResponseEntity.ok("success");
	    
	}   

	//대여처리 확인 눌렀을 때
	@PostMapping("/returnBook")
	@ResponseBody
	public ResponseEntity<String> returnBook(@RequestParam String memberid, @RequestParam String isbn) {
		
		managermapper.returnBook(memberid, isbn);
		managermapper.returnAfterBook(isbn);	
	    
	   return ResponseEntity.ok("success");
	    
	}    
	   
	//연장처리 눌렀을 때.
	@PostMapping("/Extension")
	@ResponseBody
	public ResponseEntity<String> Extension(@RequestParam String memberid, @RequestParam String isbn) {
		
		managermapper.extensionReturnDate(memberid, isbn);

	    
	   return ResponseEntity.ok("success");
	    
	}       
	  
	//관리자페이지 도서관리 리스트
	@GetMapping("/bookManagement")
	public void bookSearchList(Criterial cri, Model model) {
		cri.setAmount(30);	
		model.addAttribute("list", bookService.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, bookService.getTotalBookCount(cri)));		
	}
	
	//관리자 페이지 도서관리에서 도서 조회
	@GetMapping("/bookDetailManagement")
	public void bookDetail(String isbn, Model model, Criterial cri) {
		model.addAttribute("cri", cri);
		model.addAttribute("book", bookService.get(isbn));
	}
	
	//연체 중인 리스트
	@GetMapping("/overdueList")
	public void overdueList(Criterial cri, Model model) {
		cri.setAmount(20);			
		model.addAttribute("list", managermapper.getOverdueList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, managermapper.getOverdueTotal(cri)));	
	}
	
	//폐기처리 눌렀을 때.
	@PostMapping("/discardBook")
	@ResponseBody
	public ResponseEntity<String> discardBook(@RequestParam String isbn, @RequestParam String rentallistid) {
		log.info("대여아이디 잘 나오냐?>>>" + rentallistid);
		
		managermapper.discardBook(isbn);
		managermapper.deleteDiscard(rentallistid);
    
	   return ResponseEntity.ok("success");
	    
	}   
	
	//관리자페이지 일반 회원 리스트
	@GetMapping("/GeneralMember")
	public void GeneralMember(Criterial cri, Model model) {
		cri.setAmount(30);	
		model.addAttribute("list", managermapper.getGeneralMember(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, managermapper.GeneralMemberTotal(cri)));		
	}
		
	//관리자페이지 관리자 회원 리스트
	@GetMapping("/ManagementMember")
	public void ManagementMember(Criterial cri, Model model) {
		cri.setAmount(30);	
		model.addAttribute("list", managermapper.getManagementMember(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, managermapper.ManagementMemberTotal(cri)));		
	}
	
	
	//관리자 권한부여 버튼
	@PostMapping("/changeMemberflag")
	@ResponseBody
	public ResponseEntity<String> changeMemberflag(@RequestParam String memberid) {
		
		managermapper.changeMemberflag(memberid);
	
	    
	   return ResponseEntity.ok("success");
	    
	}    
	
	//관리자 권한부여 버튼
		@PostMapping("/cancelMemberflag")
		@ResponseBody
		public ResponseEntity<String> cancelMemberflag(@RequestParam String memberid) {
			
			managermapper.cancelMemberflag(memberid);
		    
		   return ResponseEntity.ok("success");
		    
		}   
	   
	}
