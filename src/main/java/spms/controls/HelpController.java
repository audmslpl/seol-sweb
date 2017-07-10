package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component("/help/list.do")
public class HelpController implements Controller{
	  
	
	@Override
	  public String execute(Map<String, Object> model) throws Exception {
   
	    return "/help/helpList.jsp";
	  }
}