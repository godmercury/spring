package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

@RequestMapping("/boards")
@RestController
public class BoardRestController {
	@Autowired
	BoardMapper mapper;
	
	@GetMapping("")
	public List<Board> boardList() {
		List<Board> list = mapper.getLists();
		
		return list; // return JSON Format
	}
	
	@PostMapping("")
	public void boardInsert(Board vo) {		
		mapper.boardInsert(vo);
	}
	
	@DeleteMapping("/{idx}")
	public void boardDelete(@PathVariable("idx") int idx) {
		mapper.boardDelete(idx);
	}
	
	@PutMapping("/{idx}")
	public void boardUpdate(@RequestBody Board vo) {
		mapper.boardUpdate(vo);
	}
	
	@GetMapping("/{idx}")
	public Board boardContent(@PathVariable("idx") int idx) {
		mapper.boardCount(idx);		
		Board vo = mapper.boardContent(idx);
		
		return vo;
	}
	
	@PutMapping("/{idx}/count")
	public Board boardCount(@PathVariable("idx") int idx) {
		mapper.boardCount(idx);
		Board vo = mapper.boardContent(idx);
		
		return vo;
	}
}
