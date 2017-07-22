package spms.controls;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.BoardDao;
import spms.dao.GalleryDao;
import spms.dao.GalleryfileDao;
import spms.vo.Board;
import spms.vo.Gallery;
import spms.vo.GalleryFiles;
import spms.vo.Member;
@Component("/gallery/update.do")
public class GalleryUpdateController  implements Controller, DataBinding{
	
	GalleryDao gallerydao;
	GalleryfileDao galleryfiledao;  
	GalleryFiles GalleryFile;
	  @Autowired
	  public GalleryUpdateController setGalleryDao(GalleryDao gallerydao) {
		    this.gallerydao = gallerydao;
		    return this;
	  }
	  @Autowired
	  public GalleryUpdateController setGalleryfileDao(GalleryfileDao galleryfiledao) {
		    this.galleryfiledao = galleryfiledao;
		    return this;
	  }
		  
	  public Object[] getDataBinders() {
		    return new Object[]{
		        "gallery", spms.vo.Gallery.class,
		        "no", Integer.class
		    };
	  }
		  
	  
	  @Override
	  public String execute(Map<String, Object> model) throws Exception {
		 Gallery Gallery = (Gallery)model.get("gallery");
	    HttpSession session = (HttpSession)model.get("session");
	    Member temp = (Member)session.getAttribute("member");

	    if (temp == null)
		      	return "redirect:list.do";
	    if (Gallery.getTitle() == null) { 
	      Integer no = (Integer)model.get("no");

	      Gallery detailInfo = gallerydao.selectOne(no);
	      	
	      if(temp.getNo() != detailInfo.getMno())
	    	  return "redirect:list.do";
	      model.put("gallery", detailInfo);
	      return "/gallery/galleryUpdateForm.jsp";

	    } else { 
	    			gallerydao.update(Gallery);
	    			
	    			int no =Gallery.getNo(); //gallery 관련된 파일들 삭제
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
	    			galleryfiledao.delete(no); //gallery관련된 파일들 db삭제

	    			for(int i=1 ; i<=(int)model.get("galleyfilecount");i++)
	    			{
	    				GalleryFile = (GalleryFiles)model.get("galleryfile"+i);
	    				GalleryFile.setGno(no);
	    				 galleryfiledao.insert(GalleryFile);
	    			}
	      return "redirect:list.do";
	    }
	  }
	}