package com.ezen.mapper;

import java.util.List;


import com.ezen.domain.Criterial;
import com.ezen.domain.BoardVO;



public interface BoardMapper {

	//페이징
	public List<BoardVO> getListWithPaging(Criterial cri);
	
	//공지사항등록
	public boolean listRegister(BoardVO vo);
	
	//총게시글
	public int getTotalCount();
	
	//게시글조회
	public BoardVO get(int boardid);
	
	//게시글삭제
	public void listDelete(BoardVO vo);
	
	//게시글업데이트
	public void listUpdate(BoardVO vo);
	
	//조회수 +1
	public void readCntUpdate(int boardid);
}
