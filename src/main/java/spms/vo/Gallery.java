package spms.vo;

import java.util.Date;

public class Gallery {
		  protected int     no;
		  protected String  title; 
		  protected String  content; //설명
		  protected int     mno; //writer
		  protected String  mname; //writer name
		  protected Date    createdDate; //생성일
		  protected int     count; //상태

		  public int getNo() {
		    return no;
		  }
		  public Gallery setNo(int no) {
		    this.no = no;
		    return this;
		  }
		  public String getTitle() {
		    return title;
		  }
		  public Gallery setTitle(String title) {
		    this.title = title;
		    return this;
		  }
		  public String getContent() {
		    return content;
		  }
		  public Gallery setContent(String content) {
		    this.content = content;
		    return this;
		  }
		  public int getMno() {
		    return mno;
		  }
		  public Gallery setMno(int mno) {
		    this.mno = mno;
		    return this;
		  }
		  public String getMname() {
		    return mname;
		  }
		  public Gallery setMname(String mname) {
		    this.mname = mname;
		    return this;
		  }

		  public Date getCreatedDate() {
		    return createdDate;
		  }
		  public Gallery setCreatedDate(Date createdDate) {
		    this.createdDate = createdDate;
		    return this;
		  }
		  public int getCount() {
			    return count;
			  }
		  public Gallery setCount(int count) {
		    this.count = count;
		    return this;
		  }
}
