package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.BoardDTO;
import com.itbank.model.ReplyDTO;

@Repository
public interface BoardDAO {

	public List<BoardDTO> selectList(HashMap<String, Object> param);

	public int insert(BoardDTO dto);

	public int add(BoardDTO dto);

	public BoardDTO selectOne(int idx);

	public int update(BoardDTO dto);

	public int delete(int idx);

	public int addView(int viewCount);

	public List<BoardDTO> selectSearch(String search);

	public int update2(BoardDTO dto);

	public int insert2(BoardDTO dto);

	public int selectBoardCount();

	public List<ReplyDTO> getReply(int idx);

	public int insertReply(ReplyDTO dto);

	public int deleteReply(int idx);

}
