package com.ezen.service;

import java.util.List;

import com.ezen.domain.Criterial;
import com.ezen.domain.ReportRatingsPageDTO;
import com.ezen.domain.reportRatingsVO;

public interface ReportRatingsService {
	
	public reportRatingsVO get(String ratingsid);
	public int register(reportRatingsVO ratings);
	public int modify(reportRatingsVO ratings);
	public int remove(String ratingsid);

	public List<reportRatingsVO> getList(Criterial cri, String reportid);
	public ReportRatingsPageDTO getListPage(Criterial cri, String reportid);
}
