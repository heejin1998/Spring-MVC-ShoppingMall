package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ReplyDAO;
import com.board.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply(int id) throws Exception{
		return dao.readReply(id);
	}
	
	// Write comments
	@Override
	public void writeReply(ReplyVO vo) throws Exception{
		dao.writeReply(vo);
	}
	
	// Count comments
	@Override
	public int countReply(int id) throws Exception{
		return dao.countReply(id);
	}
}
