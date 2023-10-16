package kr.co.vo;

import lombok.Data;

@Data
public class SulVo {
	long bno;
	String sul;
	String writer;
	long registNumber;
	String menu;
	String title;
	String content;
	long clickCnt;
	long likeBtn;
	long likeBtnCheck;
	String regdate;
	String editdate;
}