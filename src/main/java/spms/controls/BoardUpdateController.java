package spms.controls;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.BoardDao;
import spms.vo.Board;

//스프링 애노테이션(@Component)으로 변경
@Component("/board/update.do")
public class BoardUpdateController implements Controller, DataBinding {
  BoardDao boardDao;
  
  @Autowired
  public BoardUpdateController setBoardDao(BoardDao boardDao) {
    this.boardDao = boardDao;
    return this;
  }
  
  public Object[] getDataBinders() {
    return new Object[]{
        "no", Integer.class,
        "board", spms.vo.Board.class
    };
  }
  
  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Board board = (Board)model.get("board");
    
    if (board.getTitle() == null) { 
      Integer no = (Integer)model.get("no");
      Board detailInfo = boardDao.selectOne(no);
      model.put("board", detailInfo);
      return "/board/boardUpdateForm.jsp";

    } else { 
      boardDao.update(board);
      return "redirect:list.do";
    }
  }
}
