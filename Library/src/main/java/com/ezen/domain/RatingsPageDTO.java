package com.ezen.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RatingsPageDTO {
	
	private int ratingsCnt;
	private List<RatingsVO> list;
}
