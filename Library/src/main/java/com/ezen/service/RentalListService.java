package com.ezen.service;

import java.util.List;

import com.ezen.domain.Criterial;
import com.ezen.domain.RentalListVO;

public interface RentalListService {

	public List<RentalListVO> getList(Criterial cri);
	public RentalListVO read(String rentallistid);
	public boolean checkBook(String isbn);
	public boolean checkSub(String memberid);
	public void register(RentalListVO rental);
	public boolean modify(RentalListVO rental);
	public boolean remove(String rentallistid);
	
	public int getTotal(Criterial cri);
}
