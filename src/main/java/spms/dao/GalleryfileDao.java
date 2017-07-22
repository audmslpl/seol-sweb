package spms.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.vo.GalleryFiles;

@Component("galleryfileDao")
public class GalleryfileDao  {
  SqlSessionFactory sqlSessionFactory;

  @Autowired
  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }


  public List<GalleryFiles> selectList(int no) 
	  		throws Exception {
	    SqlSession sqlSession = sqlSessionFactory.openSession();
	    try {
	      return sqlSession.selectList("spms.dao.GalleryfileDao.selectList", no);
	    } finally {
	      sqlSession.close();
	    }
	  }
  

  public int insert(GalleryFiles galleryFiles) throws Exception  {
	  	SqlSession sqlSession = sqlSessionFactory.openSession();
	    try {
	      int count = sqlSession.insert("spms.dao.GalleryfileDao.insert", galleryFiles);
	      sqlSession.commit();
	      return count;
	    } finally {
	      sqlSession.close();
	    }
	  }

  public int  selectCount(int no) throws Exception { 
	    SqlSession sqlSession = sqlSessionFactory.openSession();
	    try {
	      return sqlSession.selectOne("spms.dao.GalleryfileDao.selectCount",no); 
	    } finally {
	      sqlSession.close();
	    }
	  }

  
  public int delete(int no) throws Exception {  
  	SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      int count = sqlSession.delete("spms.dao.GalleryfileDao.delete", no);
      sqlSession.commit();
      return count;
    } finally {
      sqlSession.close();
    }
  }

  
  
}
  