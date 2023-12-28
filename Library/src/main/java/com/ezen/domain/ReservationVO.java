package com.ezen.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {
	private int id;
	private String reservation_date;
	private String memberid;
	private String isbn;
	private String rental_status;
	private String expiration_date;
}
