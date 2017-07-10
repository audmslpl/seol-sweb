package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component("/gallery/list.do")
public class GalleryListController implements Controller{
	  
	
	@Override
	  public String execute(Map<String, Object> model) throws Exception {
   
	    return "/gallery/galleryList.jsp";
	  }
}