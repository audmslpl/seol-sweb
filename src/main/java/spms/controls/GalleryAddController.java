package spms.controls;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import spms.bind.DataBinding;
import spms.dao.GalleryDao;
import spms.vo.Gallery;

public class GalleryAddController implements Controller, DataBinding{
	GalleryDao gallerydao;
	  @Autowired
	  public GalleryAddController setBoardDao(GalleryDao gallerydao) {
	    this.gallerydao = gallerydao;
	    return this;
	  }
	  
	  public Object[] getDataBinders() {
	    return new Object[]{
	        "gallery", spms.vo.Gallery.class
	    };
	  }
	  
	  
	@Override
	  public String execute(Map<String, Object> model) throws Exception {
		  Gallery Gallery = (Gallery)model.get("gallery");
		    if (Gallery.getTitle() == null) {
		      return "/Gallery/GalleryForm.jsp";
		      
		    } else {
		    	gallerydao.insert(Gallery);
		      return "redirect:list.do";
		    }
	}
}
