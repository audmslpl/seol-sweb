package spms.controls;



import java.io.File;
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

//스프링 애노테이션(@Component)으로 변경
@Component("/gallery/delete.do")
public class GalleryDeleteController implements Controller, DataBinding {
	GalleryDao gallerydao;
	GalleryfileDao galleryfiledao;  
  
	@Autowired
	  public GalleryDeleteController setGalleryDao(GalleryDao gallerydao) {
	    this.gallerydao = gallerydao;
	    return this;
	  }
	  @Autowired
	  public GalleryDeleteController setGalleryfileDao(GalleryfileDao galleryfiledao) {
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
    
     HttpSession session = (HttpSession)model.get("session");
    Member temp = (Member)session.getAttribute("member");
    Gallery  detailInfo = gallerydao.selectOne(no);
    if (temp == null)
    	return "redirect:list.do";
    if(temp.getNo() != detailInfo.getMno())
  	  return "redirect:list.do";
    else
    {
    
    		String savePath =(String)model.get("savePath");
    		List<GalleryFiles> galleryfiles = galleryfiledao.selectList(no);
    		File file = new File(savePath);
    		if(file.isDirectory())
    		{
    			File[] files = file.listFiles();
    			for(GalleryFiles temp1 : galleryfiles)
    			{
    				for(int i = 0 ; i<files.length;i++)
    				{
    					if(temp1.getSavedFilename().equals(files[i].getName()))
    						files[i].delete();
        			}
    			}    	
    		}
    		gallerydao.delete(no);
    		galleryfiledao.delete(no);
    return "redirect:list.do";
    }
    }
  }


