package com.ezen.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CREATE TABLE querycat (
		  categoryid        varchar(3),
		  categorydesc      varchar(100),
		  
		  constraint querycat_pk primary key(categoryid)
		);*/

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QueryCatVO {

	private String categoryid;
	private String categorydesc;
}
