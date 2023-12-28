package com.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.domain.Criterial;
import com.ezen.domain.RatingsVO;
import com.ezen.domain.reportRatingsVO;

public interface ReportRatingsMapper {
	
	public reportRatingsVO read(String ratingsid);
	public int insertreportRatings(reportRatingsVO vo);
	public int deletereportRatings(String ratingsid);
	public int updatereportRatings(reportRatingsVO vo);
	
	public List<reportRatingsVO> getListWithPaging(@Param("cri") Criterial cri, @Param("reportid") String reportid);
	public int getCountByreportid(String reportid);
}
