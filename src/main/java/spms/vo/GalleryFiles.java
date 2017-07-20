package spms.vo;

public class GalleryFiles {
	  protected int     no;
	  protected String  originalFilename;
	  protected String  savedFilename;
	  protected Long filesize;
	  protected int gno;
	  
	  
	  	  public int getNo() {
		    return no;
		  }
		  public GalleryFiles setNo(int no) {
		    this.no = no;
		    return this;
		  }
		  
		  
		  public String getOriginalFilename() {
			    return originalFilename;
		  }
	      public GalleryFiles setOriginalFilename(String originalFilename) {
			    this.originalFilename = originalFilename;
			    return this;
		  }
	      
	      
	      
		  public String getSavedFilename() {
			    return savedFilename;
		  }
	      public GalleryFiles setSavedFilename(String savedFilename) {
			    this.savedFilename = savedFilename;
			    return this;
		  }
	      
	  	  public Long getFilesize() {
		    return filesize;
		  }
		  public GalleryFiles setFilesize(Long Filesize) {
		    this.filesize = Filesize;
		    return this;
		  }
		  
	  	  public int getGno() {
		    return gno;
		  }
		  public GalleryFiles setGno(int gno) {
		    this.gno = gno;
		    return this;
		  }
		  
		  
		  
}
