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
public class SignOutMemberDTO {
	private Long signOutNo;
	private Long memberNo;
	private String memberId;
	private String memberName;
	private Integer memberPhone;
	private String memberEmail;
	private String memberAddress;
	private Integer memberAgreeState;
	private Date memberSignIn;
	private Date signOut;
}
