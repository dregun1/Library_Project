package com.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.domain.Criterial;
import com.ezen.domain.RatingsVO;

public interface RatingsMapper {
	
	public RatingsVO read(String ratingsid);
	public int insertRatings(RatingsVO ratings);
	public int deleteRatings(String ratingsid);
	public int updateRatings(RatingsVO ratings);
	
	public List<RatingsVO> getListWithPaging(@Param("cri") Criterial cri, @Param("isbn") String isbn);
	public int getCountByIsbn(String isbn);
}
