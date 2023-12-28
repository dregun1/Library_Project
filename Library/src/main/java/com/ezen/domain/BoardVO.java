package com.ezen.domain;

import lombok.Data;

@Data
public class BoardVO {
	private String boardid;
	private String btitle;
	private String bcontent;
	private String createdate;
	private int readcnt;
	private String memberid;
	
}
