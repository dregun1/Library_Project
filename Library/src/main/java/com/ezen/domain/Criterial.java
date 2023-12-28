package com.ezen.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class Criterial {

	private int pageNum; // 1page, 2page, 3page
	private int amount; // page 당 data 갯수

	private String type; //title, content, writer
	private String keyword; //검색어

	public Criterial() {
		this(1, 10);
	}

	public Criterial(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getSkip() { // for mysql
		return (pageNum - 1) * amount;
	}

	// type = tcw, keyword="서울" => String[] str = {"t","c","w"}
	public String[] getTypeArr() {
	      return type==null ? new String[] {} : type.split(""); 
	 }

}
