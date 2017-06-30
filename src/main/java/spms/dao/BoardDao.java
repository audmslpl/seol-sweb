package spms.dao;

import java.util.HashMap;
import java.util.List;

import spms.vo.Board;

public interface BoardDao {
  List<Board> selectList(HashMap<String,Object> paramMap) throws Exception;
  int insert(Board board) throws Exception;
  Board selectOne(int no) throws Exception;
  int update(Board board) throws Exception;
  int delete(int no) throws Exception;
}
