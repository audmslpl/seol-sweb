package spms.vo;

import java.util.Date;

public class Board {
  protected int     no; //프로젝트일련번호
  protected String  title; //프로젝트명
  protected String  content; //설명
  protected int     mno; //writer
  protected String  mname; //writer name
  protected Date    createdDate; //생성일
  protected int     count; //상태
  
  public int getNo() {
    return no;
  }
  public Board setNo(int no) {
    this.no = no;
    return this;
  }
  public String getTitle() {
    return title;
  }
  public Board setTitle(String title) {
    this.title = title;
    return this;
  }
  public String getContent() {
    return content;
  }
  public Board setContent(String content) {
    this.content = content;
    return this;
  }
  public int getMno() {
    return mno;
  }
  public Board setMno(int mno) {
    this.mno = mno;
    return this;
  }
  public String getMname() {
    return mname;
  }
  public Board setMname(String mname) {
    this.mname = mname;
    return this;
  }

  public Date getCreatedDate() {
    return createdDate;
  }
  public Board setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
    return this;
  }
  public int getCount() {
	    return count;
	  }
  public Board setCount(int count) {
    this.count = count;
    return this;
  }
}
