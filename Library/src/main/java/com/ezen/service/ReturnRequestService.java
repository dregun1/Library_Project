package com.ezen.service;

import java.util.List;

import com.ezen.domain.Criterial;
import com.ezen.domain.ReturnRequestVO;

public interface ReturnRequestService {

	public List<ReturnRequestVO> getList(Criterial cri);
	public ReturnRequestVO read (String returnrequestid);
	public void register(ReturnRequestVO returnrequest);
	public boolean remove(String returnrequestid);
	public int getTotal(Criterial cri);
}
