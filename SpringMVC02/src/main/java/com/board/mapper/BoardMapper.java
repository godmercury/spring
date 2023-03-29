package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.board.entity.Board;
 
@Mapper // mybatis API
public interface BoardMapper {
	public List<Board> getLists(); // board 전체 리스트
	public void boardInsert(Board vo); // board 생성
	public Board boardContent(int idx); // board info
	public void boardDelete(int idx); // board 삭제
	public void boardUpdate(Board vo); // board 수정
	
	@Update("update board set count=count+1 where idx=#{idx}")
	public void boardCount(int idx); // board 조회수 증가

}
