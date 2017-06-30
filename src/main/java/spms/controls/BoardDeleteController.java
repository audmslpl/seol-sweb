package spms.controls;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.BoardDao;

//스프링 애노테이션(@Component)으로 변경
@Component("/board/delete.do")
public class BoardDeleteController implements Controller, DataBinding {
  BoardDao boardDao;
  
  @Autowired
  public BoardDeleteController setBoardDao(BoardDao BoardDao) {
    this.boardDao = BoardDao;
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
    boardDao.delete(no);
    
    return "redirect:list.do";
  }
}
