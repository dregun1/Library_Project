package com.ezen.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CREATE TABLE book (
isbn              varchar(13),
title             varchar(200),
genrecode         varchar(3),
genrecrawled		varchar(200),
author            varchar(100),
publisher         varchar(100),
publisheddate     date,
totbookcnt        int,
rentedbookcnt     int,
curbookcnt        int,   totbookcnt = rentedbookcnt + curbookcnt 
price             int,   도서정가, 도서정보조회용 
cumrentalcnt      int,   누적 대여 횟수 
registereddate    date,        관리자가 등록한 날짜 
memberid          varchar(50),   등록한 관리자 아이디, FK refers member tab 
bookimgurl        varchar(500),
bookcontent       varchar(4000),
reservation_quantity int,
constraint isbn_pk primary key(isbn)
);*/


/*ALTER TABLE book
ADD COLUMN modifier varchar(50),
ADD CONSTRAINT fk_modifier
FOREIGN KEY (modifier)
REFERENCES member(memberid);
*/

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookVO {

	private String isbn;
	private String title;
	private String genrecode;
	private String genrecrawled;
	private String author;
	private String publisher;
	private String publisheddate;
	private int totbookcnt;
	private int rentedbookcnt;
	private int curbookcnt;
	private int price;
	private int cumrentalcnt;
	private int reservation_quantity;
	private String registereddate;
	private String memberid;
	private String bookimgurl;
	private String bookcontent;
	private String modifier;
	
	private Double score;   // ratings(100자평)의 group by score
	
	private String expiration_date; //reservatin테이블의 속성임.
	private int id; //reservatin테이블의 속성임.
	
	private String wishlistid; //wishlist테이블의 속성임.
	
	private String plannedreturndate; //rentallist테이블의 속성임.
	private String rentallistid; //rentallist테이블의 속성임.
	private String actualreturndate; //rentallist테이블의 속성임.
}
