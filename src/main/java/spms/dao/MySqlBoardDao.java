package spms.dao;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.vo.Board;

//스프링 애노테이션(@Component)으로 변경
@Component("BoardDao")
public class MySqlBoardDao implements BoardDao {
  SqlSessionFactory sqlSessionFactory;

  @Autowired
  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  public List<Board> selectList(HashMap<String,Object> paramMap) 
  		throws Exception {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectList("spms.dao.BoardDao.selectList", paramMap);
    } finally {
      sqlSession.close();
    }
  }

  public int insert(Board Board) throws Exception  {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      int count = sqlSession.insert("spms.dao.BoardDao.insert", Board);
      sqlSession.commit();
      return count;
    } finally {
      sqlSession.close();
    }
  }
  
  public Board selectOne(int no) throws Exception { 
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectOne("spms.dao.BoardDao.selectOne", no);
    } finally {
      sqlSession.close();
    }
  }

  public int update(Board Board) throws Exception { 
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
    	Board original = sqlSession.selectOne(
    			"spms.dao.BoardDao.selectOne", Board.getNo());
    	
    	Hashtable<String,Object> paramMap = new Hashtable<String,Object>();
    	if (!Board.getTitle().equals(original.getTitle())) {
    		paramMap.put("title", Board.getTitle());
    	}
    	if (!Board.getContent().equals(original.getContent())) {
    		paramMap.put("content", Board.getContent());
    	}
    	if (Board.getStartDate().compareTo(original.getStartDate()) != 0) {
    		paramMap.put("startDate", Board.getStartDate());
    	}
    	if (Board.getEndDate().compareTo(original.getEndDate()) != 0) {
    		paramMap.put("endDate", Board.getEndDate());
    	}
    	if (Board.getState() != original.getState()) {
    		paramMap.put("state", Board.getState());
    	}
    	if (!Board.getTags().equals(original.getTags())) {
    		paramMap.put("tags", Board.getTags());
    	}
    	
    	if (paramMap.size() > 0) {
    		paramMap.put("no", Board.getNo());
    		int count = sqlSession.update("spms.dao.BoardDao.update", paramMap);
    		sqlSession.commit();
    		return count;
    	} else {
    		return 0;
    	}
    } finally {
      sqlSession.close();
    }
  }  

  public int delete(int no) throws Exception {  
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      int count = sqlSession.delete("spms.dao.BoardDao.delete", no);
      sqlSession.commit();
      return count;
    } finally {
      sqlSession.close();
    }
  }
}
