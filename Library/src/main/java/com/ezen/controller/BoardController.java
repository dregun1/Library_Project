package com.ezen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.domain.BoardVO;
import com.ezen.domain.Criterial;
import com.ezen.domain.PageDTO;
import com.ezen.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService service;
	
	@GetMapping("/list")
	public void list(Criterial cri, Model model) {
		cri.setAmount(20);
		model.addAttribute("list", service.getListWithPaging(cri));
		int total = service.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	@GetMapping({"/get"})
	public void get(int boardid, Model model, Criterial cri) {
		log.info("get");
		service.readCntUpdate(boardid);
		model.addAttribute("cri", cri);
		model.addAttribute("board", service.get(boardid));
	}
	
	@GetMapping({"/modify"})
	public void modify(int boardid, Model model, Criterial cri) {
		log.info("modify");
		model.addAttribute("cri", cri);
		model.addAttribute("board", service.get(boardid));
	}
	
	@GetMapping("/register")
	public void boardWrite(Criterial cri, Model model) {
		model.addAttribute("cri", cri);
	}
	
	
	@PostMapping("/write")
	public String boardRegister(BoardVO vo, RedirectAttributes rttr) {
		
		service.listRegister(vo);
		rttr.addFlashAttribute("result", 1);
		return "redirect:/board/list";
	}
	
	@PostMapping("/delete")
	public String boardDelete(BoardVO vo, RedirectAttributes rttr) {
		
		service.listDelete(vo);
		return "redirect:/board/list";
	}
	
	@PostMapping("/modify")
	public String boardModify(BoardVO vo, RedirectAttributes rttr) {
		
		service.listUpdate(vo);
		return "redirect:/board/list";
	}
	
}
