package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BoardDTO;
import com.itbank.model.Paging;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardService boardService;
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue="1") Integer page) {
		// @RequestParam(defaultValue="")	: 파라미터가 없다면, 기본값을 지정한다.
		
		ModelAndView mav = new ModelAndView();
	
		int boardCount = boardService.getBoardCount();
		Paging paging = new Paging(page, boardCount);
		
		System.out.println(paging);
		
		List<BoardDTO> list = boardService.getList(paging);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		
		return mav;
	}
	
	
	
	@PostMapping("/list")
	public ModelAndView boardList(@RequestParam String search) {
		ModelAndView mav = new ModelAndView();
		List<BoardDTO> list = boardService.selectSearch(search);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String write(BoardDTO dto) {
		int row = boardService.write(dto);
		System.out.println(row != 0 ? "작성 성공" : "작성 실패");
		return "redirect:/board/list";
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/board/view");
		BoardDTO dto = boardService.get(idx);
		dto.setViewCount(boardService.addView(idx));
		
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/board/modify");
		BoardDTO dto = boardService.get(idx);
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	@PostMapping("modify/{idx}")
	public String modify(BoardDTO dto) {
		int row = boardService.update(dto);
		System.out.println(row != 0 ? "수정 성공" : "수정 실패");
		
		return "redirect:/board/view/{idx}";
	}
	
	@GetMapping("delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = boardService.delete(idx);
		System.out.println(row != 0 ? "삭제 성공" : "삭제 실패");
		return "redirect:/board/list";
	}
	
	
}
