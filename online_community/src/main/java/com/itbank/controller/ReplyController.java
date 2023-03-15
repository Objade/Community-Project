package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.ReplyDTO;

import com.itbank.service.BoardService;

@RestController
@RequestMapping("/board/reply")
public class ReplyController {
	
	@Autowired private BoardService boardService;
	
	
	
	@GetMapping("/{board_idx}")
	public List<ReplyDTO> replyList(@PathVariable("board_idx") int idx) {
		List<ReplyDTO> list = boardService.getReply(idx);
		return list;
	}
	
	@PostMapping("/{board_idx}")
	public int writeReply(@RequestBody ReplyDTO dto) {
		int row = boardService.writeReply(dto);

		System.out.println(dto.getBoard_idx());
		System.out.println(dto.getContent());
		System.out.println(dto.getWriter());
		
		return row;
	}
	
	@DeleteMapping("/{board_idx}/{idx}")
	public int deleteReply(@PathVariable("idx") int idx) {
		int row = boardService.deleteReply(idx);
		System.out.println("삭제할 댓글 idx : " + idx);
		return row;
	}
}
