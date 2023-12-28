package com.ezen.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.domain.Criterial;
import com.ezen.domain.RatingsPageDTO;
import com.ezen.domain.ReportRatingsPageDTO;
import com.ezen.domain.reportRatingsVO;
import com.ezen.service.RatingsService;
import com.ezen.service.ReportRatingsService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequiredArgsConstructor
@RequestMapping(value = "/reportRating")
public class ReportRatingsController {
	
	private final ReportRatingsService ratingsService;
	

	//@RequestBody는 파라미터같이 url에 데이터를 쓴 게 아니라 내용(바디)에 데이터를 담아서 보낼 때 이를 매핑할 때 필요한듯?
	//댓글삽입
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE} )
	public ResponseEntity<String> create(@RequestBody reportRatingsVO vo) {
		log.info("reportRatingsVO >> " + vo);
		
		int insertCount = ratingsService.register(vo);
		return insertCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
		
	//댓글 페이지 목록 조회
	@GetMapping(value ="/pages/{reportid}/{page}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<ReportRatingsPageDTO> getList(@PathVariable("reportid") String reportid, 
													@PathVariable("page") int page){
		log.info("page가 대체 몇으로 나오길래;;;" + page);
		Criterial cri = new Criterial(page, 10);
		return new ResponseEntity<ReportRatingsPageDTO>(ratingsService.getListPage(cri, reportid), HttpStatus.OK);
	}
	
	//댓글조회
	@GetMapping(value ="/{ratingsid}", produces = {MediaType.APPLICATION_JSON_VALUE} )
	public ResponseEntity<reportRatingsVO> get(@PathVariable("ratingsid") String ratingsid){
		
		log.info("get >>> " + ratingsid);
		return new ResponseEntity<reportRatingsVO>(ratingsService.get(ratingsid), HttpStatus.OK);
	}
	
	//댓글 삭제
	@PreAuthorize("principal.username == #vo.memberid")
	@DeleteMapping(value = "/{ratingsid}")
	public ResponseEntity<String> remove(@PathVariable("ratingsid") String ratingsid, @RequestBody reportRatingsVO vo){
		log.info("delete >>> " + ratingsid);
		
		return ratingsService.remove(ratingsid) == 1 ? 
				new ResponseEntity<String>("success", HttpStatus.OK) :
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 수정
	@PreAuthorize("principal.username == #vo.memberid")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
				value = "/{ratingsid}", consumes = "application/json")
	public ResponseEntity<String> modify(@RequestBody reportRatingsVO vo, @PathVariable("ratingsid") String ratingsid){
		
		
		vo.setRatingsid(ratingsid);
		return ratingsService.modify(vo) == 1 ?
				new ResponseEntity<String>("success", HttpStatus.OK):
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
