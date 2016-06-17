package com.study.springrest.persistence;

import java.util.List;
import java.util.Iterator;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.study.springrest.domain.ReplyVO;
import com.study.springrest.domain.RestVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReplyDAOImplTest {
	
	@Inject
	private ReplyDAO dao;

	@Test
	public void insertTest() throws Exception{
		ReplyVO vo = new ReplyVO();
		vo.setContent("중원");
		vo.setUser_name("gto@nananan.com");
		vo.setBoard_no(22);
		
		dao.insert(vo);
	}
		
	@Test
	public void getTest() throws Exception{
		ReplyVO vo = dao.get(3);
//		System.out.println("이름: " +vo.getUser_name());
	}
	
	@Test
	public void getListTest() throws Exception{
		List<ReplyVO> list = dao.getList(22);
		Iterator<ReplyVO> it = list.iterator();
		while (it.hasNext()) {
			ReplyVO vo = it.next();
			System.out.println("이름: " + vo.getUser_name());
		}
	}
	
	@Test
	public void update() throws Exception{
		ReplyVO vo = new ReplyVO();
		vo.setContent("g");
		vo.setUser_name("gg");
		vo.setBoard_no(5);
		
		dao.update(vo);
	}
	
	@Test
	public void delete() throws Exception{
		
		dao.delete(4);
	}
}
