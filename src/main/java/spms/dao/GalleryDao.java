package spms.dao;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.vo.Gallery;
import spms.vo.Member;

//스프링 애노테이션(@Component)으로 변경
@Component("galleryDao")
public class GalleryDao  {
  SqlSessionFactory sqlSessionFactory;

  @Autowired
  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }

  public List<Gallery> selectList(HashMap<String,Object> paramMap) 
  		throws Exception {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
      return sqlSession.selectList("spms.dao.GalleryDao.selectList", paramMap);
    } finally {
      sqlSession.close();
    }
  }
  
  public int insert(Gallery gallery) throws Exception  {
	  	SqlSession sqlSession = sqlSessionFactory.openSession();
	    try {
	      int count = sqlSession.insert("spms.dao.GalleryDao.insert", gallery);
	      sqlSession.commit();
	      return count;
	    } finally {
	      sqlSession.close();
	    }
	  }



  public int update(Gallery gallery) throws Exception { 
    SqlSession sqlSession = sqlSessionFactory.openSession();
    try {
    	Gallery original = sqlSession.selectOne(
    			"spms.dao.GalleryDao.selectOne", gallery.getNo());
    	
    	Hashtable<String,Object> paramMap = new Hashtable<String,Object>();
    	if (!gallery.getTitle().equals(original.getTitle())) {
    		paramMap.put("title", gallery.getTitle());
    	}
    	if (!gallery.getContent().equals(original.getContent())) {
    		paramMap.put("content", gallery.getContent());
    	}
    	if (gallery.getCount() != original.getCount()) {
    		paramMap.put("count", gallery.getCount());
    	}
    	if (paramMap.size() > 0) {
    		paramMap.put("no", gallery.getNo());
    		int count = sqlSession.update("spms.dao.GalleryDao.update", paramMap);
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
      int count = sqlSession.delete("spms.dao.GalleryDao.delete", no);
      sqlSession.commit();
      return count;
    } finally {
      sqlSession.close();
    }
  }

  
  
}