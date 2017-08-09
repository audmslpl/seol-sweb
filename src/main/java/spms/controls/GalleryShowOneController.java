package spms.controls;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.GalleryDao;
import spms.dao.GalleryfileDao;
import spms.vo.Gallery;
import spms.vo.GalleryFiles;
import spms.vo.Member;
@Component("/gallery/ShowOne.do")
public class GalleryShowOneController implements Controller ,DataBinding{
	GalleryDao gallerydao;
	GalleryfileDao galleryfiledao;  
	@Autowired
	  public GalleryShowOneController setGalleryDao(GalleryDao gallerydao) {
	    this.gallerydao = gallerydao;
	    return this;
	  }
	  @Autowired
	  public GalleryShowOneController setGalleryfileDao(GalleryfileDao galleryfiledao) {
	    this.galleryfiledao = galleryfiledao;
	    return this;
	  }
	  
	  public Object[] getDataBinders() {
		    return new Object[]{
		        "no", Integer.class
		    };
		  }
		
	  
	  @Override
	  public String execute(Map<String, Object> model) throws Exception {
	    Integer no = (Integer)model.get("no");
	    System.out.println(no);
	    int filecount = galleryfiledao.selectCount(no);
	    if (filecount<=0)
	    	filecount = 1;
	    
	    Gallery detailInfo  = gallerydao.selectOne(no);
	    Integer count = detailInfo.getCount();
	    count++;
	    detailInfo.setCount(count);
	    gallerydao.update(detailInfo);
	    model.put("filecount",filecount);
	    model.put("galleryfiles", galleryfiledao.selectList(no));
	    model.put("gallery", detailInfo);
		return  "/gallery/galleryShowOneForm.jsp";
	  }
}
