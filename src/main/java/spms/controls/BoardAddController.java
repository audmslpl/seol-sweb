package spms.controls;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.BoardDao;
import spms.vo.Board;

//스프링 애노테이션(@Component)으로 변경
@Component("/board/add.do")
public class BoardAddController implements Controller, DataBinding {
  BoardDao boardDao;
  
  @Autowired
  public BoardAddController setBoardDao(BoardDao BoardDao) {
    this.boardDao = BoardDao;
    return this;
  }
  
  public Object[] getDataBinders() {
    return new Object[]{
        "board", spms.vo.Board.class
    };
  }
  
  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Board Board = (Board)model.get("board");
    if (Board.getTitle() == null) {
      return "/board/boardForm.jsp";
      
    } else {
      boardDao.insert(Board);
      return "redirect:list.do";
    }
  }
}
