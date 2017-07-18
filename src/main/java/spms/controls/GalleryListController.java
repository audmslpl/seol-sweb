package spms.controls;
import spms.dao.GalleryDao;
import spms.dao.MemberDao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import spms.bind.DataBinding;
@Component("/gallery/list.do")
public class GalleryListController implements Controller, DataBinding{
	  GalleryDao GalleryDao;
	  
	  @Autowired
	  public GalleryListController setMemberDao(GalleryDao galleryDao) {
	    this.GalleryDao = galleryDao;
	    return this;
	  }
	  
	  public Object[] getDataBinders() {
		    return new Object[]{
		        "orderCond", String.class
		    };
		  }
	  
	@Override
	  public String execute(Map<String, Object> model) throws Exception {
	  	HashMap<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("orderCond", model.get("orderCond"));
	  	System.out.printf("이건나와?");
	    model.put("gallerys", GalleryDao.selectList(paramMap));

	    return "/gallery/galleryList.jsp";
	  }
}