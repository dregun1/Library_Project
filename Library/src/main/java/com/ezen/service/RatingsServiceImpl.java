package com.ezen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.domain.Criterial;
import com.ezen.domain.RatingsPageDTO;
import com.ezen.domain.RatingsVO;
import com.ezen.mapper.RatingsMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class RatingsServiceImpl implements RatingsService {
	
	private final RatingsMapper ratingsMapper;


	@Override
	public RatingsVO get(String ratingsid) {
		return ratingsMapper.read(ratingsid);
	}

	@Override
	public int register(RatingsVO ratings) {
		return ratingsMapper.insertRatings(ratings); 
	}

	@Override
	public int modify(RatingsVO ratings) {
		return ratingsMapper.updateRatings(ratings);
	}

	@Override
	public int remove(String ratingsid) {
		return ratingsMapper.deleteRatings(ratingsid);
	}
	
	@Override public List<RatingsVO> getList(Criterial cri, String isbn) {
		return ratingsMapper.getListWithPaging(cri, isbn); }

	@Override
	public RatingsPageDTO getListPage(Criterial cri, String isbn) {
		return new RatingsPageDTO(ratingsMapper.getCountByIsbn(isbn),
					ratingsMapper.getListWithPaging(cri, isbn));
	}

}
