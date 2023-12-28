package com.ezen.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CREATE TABLE reportRatings (
		  ratingsid         varchar(36) DEFAULT (UUID()),
		  reportid              varchar(36),
		  memberid          varchar(50), 
		  writedate         date,
		  content           varchar(1000),           
		  
		  constraint ratings_pk primary key(ratingsid),
		  constraint reportRatings_bookreport_fk FOREIGN KEY(reportid)REFERENCES bookreport(reportid)ON DELETE cascade,
		  constraint reportRatings_memberid_fk FOREIGN KEY(memberid)REFERENCES member(memberid)ON DELETE cascade
		);*/

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class reportRatingsVO {

	private String ratingsid;
	private String reportid;
	private String memberid;
	private String writedate;
	private String content;
}
