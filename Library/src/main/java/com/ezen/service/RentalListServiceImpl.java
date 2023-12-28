package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.domain.Criterial;
import com.ezen.domain.RentalListVO;
import com.ezen.mapper.BookMapper;
import com.ezen.mapper.RentalListMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class RentalListServiceImpl implements RentalListService{
	
	private final RentalListMapper rentalListMapper;
	
	private final BookMapper bookMapper;
	
	@Override
	public List<RentalListVO> getList(Criterial cri) {
		return rentalListMapper.getListWithPaging(cri);
	}

	@Override
	public boolean checkBook(String isbn) {
		int count = rentalListMapper.checkBook(isbn);
        return count > 0;
	}

	@Override
	public boolean checkSub(String memberid) {
		int count = rentalListMapper.checkSub(memberid);
        return count > 0;
	}

	@Override
	public void register(RentalListVO rental) {
		rentalListMapper.insert(rental);
	}

	@Override
	public boolean modify(RentalListVO rental) {
		int result = rentalListMapper.update(rental);
        return result > 0;
	}

	@Override
	public boolean remove(String rentallistid) {
		int result = rentalListMapper.delete(rentallistid);
        return result > 0;
	}

	@Override
	public int getTotal(Criterial cri) {
		return rentalListMapper.getTotal(cri);
	}

	@Override
	public RentalListVO read(String rentallistid) {
		 return rentalListMapper.read(rentallistid);
	}
  

}
