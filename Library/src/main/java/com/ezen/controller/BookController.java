package com.ezen.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.domain.Criterial;
import com.ezen.domain.PageDTO;
import com.ezen.domain.ReservationVO;
import com.ezen.domain.WishListVO;
import com.ezen.mapper.BookMapper;
import com.ezen.service.BookService;
import com.ezen.service.RatingsService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/book/*")
@Log4j
@RequiredArgsConstructor
public class BookController {
	
	private final BookService bookService;
	private final RatingsService ratingsService;
	private final BookMapper bookmapper;
	
	@GetMapping("/bookMain")
	public void bookMain(Criterial cri, Model model) {
		
		// mainpage에서는 인기도서 및 신간도서를 각 5권씩만 조회
		cri.setPageNum(1);
		cri.setAmount(5);
		
		log.info("bookMain >> " + cri);
		model.addAttribute("bookPopularList", bookService.getListWithPagingByRentalCnt(cri));
		model.addAttribute("bookRecentList", bookService.getListWithPagingByPdate(cri));

	}
	
	//통합검색 리스트
	@GetMapping("/bookTotalList")
	public void bookSearchList(Criterial cri, Model model) {
		
		log.info("bookTotalList >> " + cri);

		model.addAttribute("bookSearchList", bookService.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, bookService.getTotalBookCount(cri)));		
	}
	
	//인기리스트
	@GetMapping("/bookPopularList")
	public void bookPopularList( Criterial cri, Model model) {
		
		log.info("bookPopularList >> " + cri);

		model.addAttribute("bookPopularList", bookService.getListWithPagingByRentalCnt(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, bookService.getTotalBookCount(cri)));
		
	}
	
	//신규리스트
	@GetMapping("/bookRecentList")
	public void bookRecentList(Criterial cri, Model model) {
		
		
		log.info("bookRecentList >> " + cri);

		model.addAttribute("bookRecentList", bookService.getListWithPagingByPdate(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, bookService.getTotalBookCount(cri)));
		
	}
	
	
	@GetMapping("/bookDetail")
	public void bookDetail(String isbn, @ModelAttribute("cri")Criterial cri, Model model) {
		
		log.info("bookDetailView >> " + isbn + " : " + cri);

		model.addAttribute("bookVO", bookService.get(isbn));
//		model.addAttribute("ratingsList", ratingsService.getListPage(cri, isbn));
		
	}
	
	//예약버튼 눌렀을 때.
	@GetMapping("/reservation")
	@ResponseBody
	public ResponseEntity<String> reserveBook(@RequestParam String isbn, Principal principal) {
	    String username = principal.getName();
	    ReservationVO vo = new ReservationVO();
	    vo.setMemberid(username);
	    vo.setIsbn(isbn);

	    if (bookmapper.selectReservation(vo) != null) {
	    	 return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("fail1");
	    } else if (bookmapper.selectCurbookcnt(vo) == 0) {
	    	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("fail2");
	    } else if (bookmapper.CurReservatinCount(vo) >= 6) {
	    	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("fail3");	      
	    } else {
	        bookService.UpdateReservation(vo);
	        return ResponseEntity.ok("success");
	    }
	}
	
	
	//예약리스트 보기.
	@GetMapping("/reservationList")
	public void reservationList(Model model, Principal principal)  {

		Criterial cri = new Criterial();
		
		String memberid = principal.getName();

		model.addAttribute("bookReservationList", bookService.getBooksByReservations(memberid, cri));
		model.addAttribute("pageMaker", new PageDTO(cri, bookService.getTotalReservation(memberid)));		
	}
	
	
		//예약취소 버튼 눌렀을 때.
		@GetMapping("/cancelReserve")
		@ResponseBody
		public ResponseEntity<String> cancelReserve(@RequestParam String isbn, Principal principal) {
		    String username = principal.getName();
		    ReservationVO vo = new ReservationVO();
		    vo.setMemberid(username);
		    vo.setIsbn(isbn);

		    bookService.UpdateCacelReservation(vo);
		    
		   return ResponseEntity.ok("success");
		    
		}
	
		//지난예약리스트
		@GetMapping("/pastReservation")
		public void pastReservation(Criterial cri, Model model, Principal principal) {

			String memberid = principal.getName();


			model.addAttribute("pastReservationList", bookService.getPastReservations(memberid, cri));
			model.addAttribute("pageMaker", new PageDTO(cri, bookService.getTotalPastReservation(memberid)));	
			
		}

		//지난 예약 삭제하기 버튼 눌렀을 때.
		@GetMapping("/deleteReserve")
		@ResponseBody
		public ResponseEntity<String> deleteReserve(@RequestParam int id, Principal principal) {
		    String username = principal.getName();
		    ReservationVO vo = new ReservationVO();
		    
		    log.info("id 잘들어오냐?>>>" + id);
		    
		    vo.setMemberid(username);
		    vo.setId(id);
		   
		    
		    bookmapper.deleteReservation(vo);
		    
		   return ResponseEntity.ok("success");
		    
		}
		
		
		//관심도서 리스트
		@GetMapping("/InterestedBooks")
		public void InterestedBooks(Criterial cri, Model model, Principal principal) {

			String memberid = principal.getName();


			model.addAttribute("interestedList", bookmapper.getInterested(memberid, cri));
			model.addAttribute("pageMaker", new PageDTO(cri, bookmapper.getTotalInterested(memberid)));	
			
		}	
		
		//관심도서 추가 눌렀을 때
		@GetMapping("/addInterested")
		@ResponseBody
		public ResponseEntity<String> addInterested(@RequestParam String isbn, Principal principal) {
		    String username = principal.getName();
		    WishListVO vo = new WishListVO();
		    vo.setMemberid(username);
		    vo.setIsbn(isbn);

		    if (bookmapper.selectInterested(vo) != null) {
		    	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("fail");
		    }else {
		    bookmapper.insertInterested(vo);
		    	return ResponseEntity.ok("success");	}	    
		}
		
		
		//관심도서 삭제버튼 눌렀을 때.
		@GetMapping("/interestedDelete")
		@ResponseBody
		public ResponseEntity<String> deleteReserve(@RequestParam String wishlistid, Principal principal) {
		    String username = principal.getName();
		    WishListVO vo = new WishListVO();
		    
		    
		    vo.setMemberid(username);
		    vo.setWishlistid(wishlistid);
		   
		    
		    bookmapper.deleteInterested(vo);
		    
		    return ResponseEntity.ok("success");
		    
		}
		
		//대여리스트
		@GetMapping("/bookRentalList")
		public void bookRentalList(Criterial cri, Model model, Principal principal) {

			String memberid = principal.getName();


			model.addAttribute("rentalList", bookmapper.getRentalList(memberid, cri));
			model.addAttribute("pageMaker", new PageDTO(cri, bookmapper.getTotalRental(memberid)));				
		}
		
		
		//연장하기 눌렀을 때
		@GetMapping("/Extend")
		@ResponseBody
		public ResponseEntity<String> Extend(@RequestParam String rentallistid) {

		    if (bookmapper.selectExtensionCount(rentallistid) != 0) {
		    	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("fail");
		    }else {
		    	bookmapper.Extension(rentallistid);
		    	return ResponseEntity.ok("success");}	    
		}
		

		//반납리스트
		@GetMapping("/bookReturnList")
		public void bookReturnList(Criterial cri, Model model, Principal principal) {

			String memberid = principal.getName();

			model.addAttribute("returnList", bookmapper.getReturnList(memberid, cri));
			model.addAttribute("pageMaker", new PageDTO(cri, bookmapper.getTotalReturn(memberid)));				
		}
	
		
		//반납리스트에서 삭제하기 눌렀을 때
		@GetMapping("/deleteReturn")
		@ResponseBody
		public ResponseEntity<String> deleteReturn(@RequestParam String rentallistid) {

				bookmapper.deleteReturn(rentallistid);
			
		    	return ResponseEntity.ok("success");	    
		}
}
