package com.board.service;

import java.util.List;

import com.board.domain.ReplyVO;

public interface ReplyService {
	
	// View comments
	public List<ReplyVO> readReply(int id) throws Exception;
	
	// Write comments
	public void writeReply(ReplyVO vo) throws Exception;
	
	// Count comments
	public int countReply(int id) throws Exception;

}
