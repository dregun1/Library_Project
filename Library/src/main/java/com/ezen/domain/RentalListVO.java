package com.ezen.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CREATE TABLE rentallist (
		  rentallistid      VARCHAR(36) DEFAULT (UUID()),
		  rentdate          date,
		  plannedreturndate date,
		  isbn              varchar(13),
		  memberid          varchar(50),
		  actualreturndate  date,

		  
		  constraint rentallist_pk primary key(rentallistid),
		  constraint rentallist_isbn_fk FOREIGN KEY(isbn)REFERENCES book(isbn) ON DELETE set null,
		  constraint rentallist_memberid_fk FOREIGN KEY(memberid)REFERENCES member(memberid)ON DELETE set null,
		  
		);*/




@Data
public class RentalListVO {

	private String rentallistid;
	private String rentdate;
	private String plannedreturndate;
	private String isbn;
	private String memberid;
	private String actualreturndate;
	
	//join하려고 추가
	private String title;
	private String bookimgurl;
	
}


