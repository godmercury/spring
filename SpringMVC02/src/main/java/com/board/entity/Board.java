package com.board.entity;

import lombok.Data;
 
@Data // Lombok API : getter, setter, toString 등 자동 생성
public class Board {
	private int idx; // 일련번호
	private String title; // 제목
	private String content; // 내용
	private String writer; // 작성자
	private String indate; // 작성일
	private int count; // 조회수
	// setter, getter
}
