package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.ReplyVO;


@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	SqlSession sql;
	
	// View post
	@Override
	public List<ReplyVO> readReply(int id) throws Exception{
		return sql.selectList("replyMapper.readReply", id);
	}
	
	// Write comments
	public void writeReply(ReplyVO vo) throws Exception{
		sql.insert("replyMapper.writeReply", vo);
	}
	
	// Count comments
	public int countReply(int id) throws Exception{
		return sql.selectOne("replyMapper.countReply",id);
	}
}

