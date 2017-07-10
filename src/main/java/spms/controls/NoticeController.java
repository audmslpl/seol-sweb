package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component("/notice/list.do")
public class NoticeController implements Controller{
	  
	
	@Override
	  public String execute(Map<String, Object> model) throws Exception {
   
	    return "/notice/noticeList.jsp";
	  }
}