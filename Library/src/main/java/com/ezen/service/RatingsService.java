package com.ezen.service;

import java.util.List;

import com.ezen.domain.Criterial;
import com.ezen.domain.RatingsPageDTO;
import com.ezen.domain.RatingsVO;

public interface RatingsService {
	
	public RatingsVO get(String ratingsid);
	public int register(RatingsVO ratings);
	public int modify(RatingsVO ratings);
	public int remove(String ratingsid);

	public List<RatingsVO> getList(Criterial cri, String isbn);
	public RatingsPageDTO getListPage(Criterial cri, String isbn);
}
