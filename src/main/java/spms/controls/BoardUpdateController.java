package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.BoardDao;
import spms.vo.Board;
import spms.vo.Member;

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
    HttpSession session = (HttpSession)model.get("session");
    Member temp = (Member)session.getAttribute("member");

    
    if (board.getTitle() == null) { 
      Integer no = (Integer)model.get("no");
      
      Board detailInfo = boardDao.selectOne(no);

      if(temp.getNo() != detailInfo.getMno())
    	  return "redirect:list.do";
      model.put("board", detailInfo);
      return "/board/boardUpdateForm.jsp";

    } else { 
      boardDao.update(board);
      return "redirect:list.do";
    }
  }
}
