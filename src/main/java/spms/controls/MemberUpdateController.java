package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.MemberDao;
import spms.vo.Member;

//스프링 애노테이션(@Component)으로 변경
@Component("/member/update.do")
public class MemberUpdateController implements Controller, DataBinding {
  MemberDao memberDao;
  
  @Autowired
  public MemberUpdateController setMemberDao(MemberDao memberDao) {
    this.memberDao = memberDao;
    return this;
  }
  
  public Object[] getDataBinders() {
    return new Object[]{
        "no", Integer.class,
        "member", spms.vo.Member.class
    };
  }
  
  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Member member = (Member)model.get("member");
    HttpSession session;
    if (member.getEmail() == null) { 
      Integer no = (Integer)model.get("no");
      session = (HttpSession)model.get("session");
      Member temp = (Member)session.getAttribute("member");
      if(temp.getNo() != no)
    	  return "redirect:list.do";
      Member detailInfo = memberDao.selectOne(no);
      model.put("member", detailInfo);
      return "/member/MemberUpdateForm.jsp";

    } else { 
      memberDao.update(member);
      return "redirect:list.do";
    }
  }
}
