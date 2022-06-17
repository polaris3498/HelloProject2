package com.goodee.gdlibrary.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
	private Long memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private Integer memberPhone;
	private String memberEmail;
	private String memberAddress;
	private Integer memberAgreeState;
	private Date memberSignIn;
	private Date memberPwModified;
	private Date memberInfoModified;
	private String memberSessionId;
	private Date memberSessionLimit;
}
