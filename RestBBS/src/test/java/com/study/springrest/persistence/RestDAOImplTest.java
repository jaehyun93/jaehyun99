package com.study.springrest.persistence;

import java.util.List;
import java.util.Iterator;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.study.springrest.domain.RestVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class RestDAOImplTest {
	
	@Inject
	private RestDAO dao;

	@Test
	public void insertTest() throws Exception{
		RestVO vo = new RestVO();
		vo.setTitle("�߿�");
		vo.setContent("gogo");
		vo.setUser_name("�׽�Ʈ����");
		
		dao.insert(vo);
	}
		
	@Test
	public void getTest() throws Exception{
		
		RestVO vo = dao.get(9);
		System.out.println("�̸�: " +vo.getUser_name());
	}
	
	@Test
	public void getListTest() throws Exception{
		List<RestVO> list = dao.getList();
		Iterator<RestVO> it = list.iterator();
		while (it.hasNext()) {
			RestVO vo = it.next();
			System.out.println("�̸�: " + vo.getUser_name());
		}
	}
	
	@Test
	public void update() throws Exception{
		RestVO vo = new RestVO();
		vo.setBoard_no(9);
		vo.setTitle("�ȳ�");
		vo.setContent("��������");
		vo.setUser_name("��������");
		
		dao.update(vo);
	}
	
	@Test
	public void delete() throws Exception{
		
		dao.delete(10);
	}
}
