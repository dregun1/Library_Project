package com.ezen.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CREATE TABLE returnrequest (
		  returnrequestid   VARCHAR(36) DEFAULT (UUID()),
		  rentallistid      varchar(36),
		  memberid          varchar(50),
		  isbn              varchar(13),
		  requestdate       date,
		  actualreturndate  date,
		  
		  constraint returnrequest_pk primary key(returnrequestid),
		  constraint returnrequest_isbn_fk FOREIGN KEY(isbn)REFERENCES book(isbn) ON DELETE set null,
		  constraint returnrequest_memberid_fk FOREIGN KEY(memberid)REFERENCES member(memberid)ON DELETE set null,
		  constraint returnrequest_rentallistid_fk FOREIGN KEY(rentallistid)REFERENCES rentallist(rentallistid)ON DELETE set null
		  
		);*/

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReturnRequestVO {
	
	private String returnrequestid;
	private String rentallistid;
	private String memberid;
	private String isbn;
	private String requestdate;
	private String actualreturndate;
	
	//join book
	private String title;
	private String bookimgurl;
	
	//join rental
	private String rentdate;
	private String plannedreturndate;
}
