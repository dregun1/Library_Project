package com.ezen.domain;

import lombok.Data;

/*CREATE TABLE wishlist (
		  wishlistid        VARCHAR(36) DEFAULT (UUID()),
		  isbn              varchar(13),
		  memberid          varchar(50),
		  createdate        date,
		    
		  constraint wishlist_pk primary key(wishlistid),
		  constraint wishlist_isbn_fk FOREIGN KEY(isbn)REFERENCES book(isbn)ON DELETE cascade,
		  constraint wishlist_memberid_fk FOREIGN KEY(memberid)REFERENCES member(memberid)ON DELETE cascade
		);*/

@Data
public class WishListVO {

	private String wishlistid;
	private String isbn;
	private String memberid;
	private String createdate;
}
