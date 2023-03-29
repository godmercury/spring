package com.board.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

@Controller
public class BoardController {
	@Autowired
	private BoardMapper mapper;
	
	// HandlerMapping
	@RequestMapping("/boardList.do") // 리스트
	public String boardList(Model model) {
		/*
		List<Board> list = new ArrayList<Board>();
		for (int i=1; i<7; i++) {
			Board vo = new Board();
			vo.setIdx(i);
			vo.setTitle("게시판실습" + i);
			vo.setContent("게시판실십내용" + i);
			vo.setWriter("sue");
			vo.setIndate("2022-10-01");
			vo.setCount(i);
			
			list.add(vo);
		}
		*/
		
		List<Board> list = mapper.getLists();
		model.addAttribute("list", list);

		return "boardList"; // /WEB-INF/views/boardList.jsp -> forward
	}
	
	@GetMapping("/boardForm.do") // 생성화면
	public String boardForm() {
		return "boardForm"; // /WEB-INF/views/boardForm.jsp -> forward
	}
	
	@PostMapping("boardInsert.do") // 생성
	public String boardInsert(Board vo) {		
		mapper.boardInsert(vo);
		
		return "redirect:/boardList.do"; // redirect
	}
	
	@GetMapping("boardContent.do") // 상세보기
	public String boardContent(@RequestParam("idx") int idx, Model model) {
		Board vo = mapper.boardContent(idx);
		mapper.boardCount(idx); // 조회수 증가
		model.addAttribute("vo", vo);
		
		return "boardContent";
	}
	
	@GetMapping("boardDelete.do/{idx}") // 삭제
	public String boardDelete(@PathVariable("idx") int idx) {
		mapper.boardDelete(idx);
		
		return "redirect:/boardList.do";
	}
	
	@GetMapping("boardUpdateForm.do/{idx}") // 수정화면
	public String boardUpdateForm(@PathVariable("idx") int idx, Model model) {
		Board vo = mapper.boardContent(idx);
		model.addAttribute("vo", vo);
		
		return "boardUpdate";
	}
	
	@PostMapping("boardUpdate.do") // 수정
	public String boardUpdate(Board vo) {
		mapper.boardUpdate(vo);

		return "redirect:/boardUpdateForm.do/" + vo.getIdx();
	}
	
	
	
}
