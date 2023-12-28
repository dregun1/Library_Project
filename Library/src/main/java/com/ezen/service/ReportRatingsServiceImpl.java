package com.ezen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.domain.Criterial;
import com.ezen.domain.RatingsPageDTO;
import com.ezen.domain.RatingsVO;
import com.ezen.domain.ReportRatingsPageDTO;
import com.ezen.domain.reportRatingsVO;
import com.ezen.mapper.RatingsMapper;
import com.ezen.mapper.ReportRatingsMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class ReportRatingsServiceImpl implements ReportRatingsService {
	
	private final ReportRatingsMapper mapper;

	@Override
	public reportRatingsVO get(String ratingsid) {
		// TODO Auto-generated method stub
		return mapper.read(ratingsid);
	}

	@Override
	public int register(reportRatingsVO ratings) {
		// TODO Auto-generated method stub
		return mapper.insertreportRatings(ratings);
	}

	@Override
	public int modify(reportRatingsVO ratings) {
		// TODO Auto-generated method stub
		return mapper.updatereportRatings(ratings);
	}

	@Override
	public int remove(String ratingsid) {
		// TODO Auto-generated method stub
		return mapper.deletereportRatings(ratingsid);
	}

	@Override
	public List<reportRatingsVO> getList(Criterial cri, String reportid) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri, reportid);
	}

	@Override
	public ReportRatingsPageDTO getListPage(Criterial cri, String reportid) {
		return new ReportRatingsPageDTO(mapper.getCountByreportid(reportid),
				mapper.getListWithPaging(cri, reportid));
	}




}
