package spms.controls;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.GalleryDao;
import spms.dao.GalleryfileDao;
import spms.vo.Gallery;
import spms.vo.GalleryFiles;

@Component("/gallery/add.do")
public class GalleryAddController  implements Controller, DataBinding{
	GalleryDao gallerydao;
	GalleryfileDao galleryfiledao;  
	GalleryFiles GalleryFile;
	@Autowired
	  public GalleryAddController setGalleryDao(GalleryDao gallerydao) {
	    this.gallerydao = gallerydao;
	    return this;
	  }
	  @Autowired
	  public GalleryAddController setGalleryfileDao(GalleryfileDao galleryfiledao) {
	    this.galleryfiledao = galleryfiledao;
	    return this;
	  }
	  
	  public Object[] getDataBinders() {
	    return new Object[]{
	        "gallery", spms.vo.Gallery.class
	    };
	  }
	  
	  
	@Override
	  public String execute(Map<String, Object> model) throws Exception {
		  int i = 1;
		  int gno=0;
		  Gallery Gallery = (Gallery)model.get("gallery");		  

		    if (Gallery.getTitle() == null) {
		      return "/gallery/galleryForm.jsp";		      
		    } else {
		    	  if ((int)model.get("galleyfilecount") == 0)
		    	  {
		    		  
		    	  }
				  for(i=1 ; i<=(int)model.get("galleyfilecount");i++)
				  {
					  GalleryFile = (GalleryFiles)model.get("galleryfile"+i);
					  gno = gallerydao.selectOne();
					  GalleryFile.setGno(gno);
					  galleryfiledao.insert(GalleryFile);
				  }
				Gallery.setNo(gallerydao.selectOne());
		    	gallerydao.insert(Gallery);
		      return "redirect:list.do";
		    }
	}
}
