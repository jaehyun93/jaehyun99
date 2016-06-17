package com.study.springrest.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.study.springrest.domain.ReplyVO;
import com.study.springrest.domain.RestVO;


@Repository
public class RestDAOImpl implements RestDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.study.springrest.mappers.restMapper";
	
	@Override
	public void insert(RestVO vo){
		sqlSession.insert(namespace+".insertRest",vo);
		//								이거랑 memberMapper.xml id랑 이름이 똑같아야댐
	}
	
	@Override // 댓글개수
	public void increaseReply(int board_no) {
		sqlSession.update(namespace+".increaseReply",board_no);
	}
	

	@Override
	public RestVO get(int board_no) {
		return sqlSession.selectOne(namespace+".get",board_no);
	}
	// 다 가져올려면 select 쓰고 
	@Override
	public List<RestVO> getList() {
		return sqlSession.selectList(namespace+".getList");
	}
	
	// 하나만 가져올경우에 뒤에 vo를 붙여준다
	@Override
	public void update(RestVO vo){	
		sqlSession.update(namespace+".update",vo);
	}

	@Override
	public void delete(int board_no) {
		sqlSession.delete(namespace+".delete",board_no);
	}

}
