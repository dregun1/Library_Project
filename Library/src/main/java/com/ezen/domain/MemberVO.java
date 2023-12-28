package com.ezen.domain;

import lombok.Data;


@Data
public class MemberVO {

	private String memberid;
	private String passcode;
	private String membername;
	private String memberflag;
	private int enabled;
	private String email;
	private String penaltysdate;
	private String penaltyedate;
	private String penaltyrentalid;
	private String mphone;
	private String postalcode;
	private String postaladdress;
	private String detailaddress;
	private String birthdate;
	private String joindate;
	private String lastlogindate;

}
