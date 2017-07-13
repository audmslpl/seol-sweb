package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.MemberDao;
import spms.vo.Member;

//스프링 애노테이션(@Component)으로 변경
@Component("/member/delete.do")
public class MemberDeleteController implements Controller, DataBinding {
  MemberDao memberDao;
  
  @Autowired
  public MemberDeleteController setMemberDao(MemberDao memberDao) {
    this.memberDao = memberDao;
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
    if(temp.getNo() != no)
  	  return "redirect:list.do";
    
    memberDao.delete(no);
    session.setAttribute("member", null);
    return "redirect:list.do";

    
  }
}
