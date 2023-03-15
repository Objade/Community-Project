package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.BoardDTO;
import com.itbank.model.Paging;
import com.itbank.model.ReplyDTO;
import com.itbank.repository.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	
	private final String saveDirectory = "D:\\upload";
	
	public BoardService() {
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdir();
		}	
	}
	

	public int write(BoardDTO dto) {
		File dest = new File(saveDirectory, dto.getNewfile().getOriginalFilename());
		
		if(dto.getNewfile().getOriginalFilename() == "") {
			int row = dao.insert2(dto);
			return row;
		}
		
		try {
			dto.getNewfile().transferTo(dest);
			dto.setUploadFile(dest.getName());
			int row = dao.insert(dto);
			return row;
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public List<BoardDTO> getList(Paging paging) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("offset", paging.getOffset());
		param.put("perPage", paging.getPerPage());
		
		return dao.selectList(param);
	}


	public BoardDTO get(int idx) {
		return dao.selectOne(idx);
	}

	public int update(BoardDTO dto) {
		File dest = new File(saveDirectory, dto.getNewfile().getOriginalFilename());
		
		if(dto.getNewfile().getOriginalFilename() == "") {
			int row = dao.update2(dto);
			return row;
		}
		
		try {
			dto.getNewfile().transferTo(dest);
			dto.setUploadFile(dest.getName());
			int row = dao.update(dto);
			return row;
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return 0;
	}


	public int delete(int idx) {
		return dao.delete(idx);
	}


	public int addView(int idx) {
		return dao.addView(idx);
	}


	public List<BoardDTO> selectSearch(String search) {
		return dao.selectSearch(search);
	}


	public int getBoardCount() {
		return dao.selectBoardCount();
	}
	
	public List<ReplyDTO> getReply(int idx) {
		return dao.getReply(idx);
	}


	public int writeReply(ReplyDTO dto) {
		return dao.insertReply(dto);
	}


	public int deleteReply(int idx) {
		return dao.deleteReply(idx);
	}
}
