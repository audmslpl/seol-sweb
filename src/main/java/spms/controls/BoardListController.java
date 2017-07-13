package spms.controls;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.bind.DataBinding;
import spms.dao.BoardDao;

//스프링 애노테이션(@Component)으로 변경
@Component("/board/list.do")
public class BoardListController implements Controller, DataBinding {
  BoardDao boardDao;
  
  @Autowired
  public BoardListController setBoardDao(BoardDao boardDao) {
    this.boardDao = boardDao;
    return this;
  }
  
  public Object[] getDataBinders() {
    return new Object[]{
        "orderCond", String.class,
        "currentPage", String.class,
        
    };
  } 

  @Override
  public String execute(Map<String, Object> model) throws Exception {
  	HashMap<String,Object> paramMap = new HashMap<String,Object>();
  	paramMap.put("orderCond", model.get("orderCond"));
  	int pageSize = 5;
  	int currentPage = 1;
  try{
  	if(model.get("currentPage")!= null )
  			currentPage =Integer.parseInt(model.get("currentPage").toString());
  	}
  	catch(NumberFormatException e){
  		System.out.println("아 시발새끼들아");
  	}
	int totalRow = boardDao.selectCount();
	int totalPage = (int)Math.ceil(totalRow/(double)pageSize);
	if (currentPage < 1 || currentPage > totalPage)
	{
		currentPage = 1;
	}
  	int startPage = currentPage - ((currentPage%pageSize)-1);
	int endPage = startPage+9 ;
	if (endPage > totalPage)
		endPage = totalPage;
  	int offsetNum = (currentPage-1)*pageSize;
  	
	if (currentPage < 1 || currentPage > totalPage)
	{
		currentPage = 1;
	}
  	paramMap.put("offsetNum", offsetNum);
  	paramMap.put("pageSize",pageSize);
  	model.put("currentPage",currentPage);
  	model.put("endPage",endPage);
  	model.put("startPage",startPage);
    model.put("boards", boardDao.selectList(paramMap));
    return "/board/boardList.jsp";
  }
}
