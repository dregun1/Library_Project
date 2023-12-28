package com.ezen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.domain.BookReportVO;
import com.ezen.domain.Criterial;
import com.ezen.domain.PageDTO;
import com.ezen.mapper.BookReportMapper;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/report/*")
public class BookReportController {

	@Autowired
	BookReportMapper mapper;
	
	@GetMapping("/list")
	public void list(Criterial cri, Model model) {
		cri.setAmount(20);
		model.addAttribute("list", mapper.getListWithPaging(cri));
		int total = mapper.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	@GetMapping({"/get"})
	public void get(String reportid, Model model, Criterial cri) {
		log.info("get");
		mapper.readCntUpdate(reportid);
		model.addAttribute("cri", cri);
		model.addAttribute("report", mapper.get(reportid));
	}
	
	@GetMapping({"/modify"})
	public void modify(String reportid, Model model, Criterial cri) {
		log.info("modify");
		model.addAttribute("cri", cri);
		model.addAttribute("report", mapper.get(reportid));
	}
	
	@GetMapping("/register")
	public void boardWrite(Criterial cri, Model model) {
		model.addAttribute("cri", cri);
	}
	
	
	@PostMapping("/write")
	public String boardRegister(BookReportVO vo, RedirectAttributes rttr) {
		
		mapper.listRegister(vo);
		rttr.addFlashAttribute("result", 1);
		return "redirect:/report/list";
	}
	
	@PostMapping("/delete")
	public String boardDelete(BookReportVO vo, RedirectAttributes rttr) {
		
		mapper.listDelete(vo);
		return "redirect:/report/list";
	}
	
	@PostMapping("/modify")
	public String boardModify(BookReportVO vo, RedirectAttributes rttr) {
		
		mapper.listUpdate(vo);
		return "redirect:/report/list";
	}
	
}
