package com.ezen.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CREATE TABLE bookreport (
		  reportid          VARCHAR(36) DEFAULT (UUID()),
		  memberid          varchar(50),
		  title             varchar(500),
		  author			varchar(255),
		  content           varchar(4000),
		  score             int,
		  createdate        date,
		  readcnt           int default 0,
		  
		  
		  constraint bookreport_pk primary key(reportid),
		  constraint bookreport_memberid_fk FOREIGN KEY(memberid)REFERENCES member(memberid)ON DELETE set null 
		);*/


@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookReportVO {

	private String reportid;
	private String memberid;
	private String title;
	private String content;
	private int score;
	private String createdate;
	private int readcnt;
	private String author;
}
