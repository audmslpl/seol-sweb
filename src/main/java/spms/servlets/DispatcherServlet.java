package spms.servlets;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.io.File;
import net.sf.jmimemagic.Magic;
import net.sf.jmimemagic.MagicMatch;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;

import com.oreilly.servlet.MultipartRequest;

import spms.bind.DataBinding;
import spms.bind.ServletRequestDataBinder;
import spms.controls.Controller;
import spms.listeners.ContextLoaderListener;
import spms.util.HttpRequestWithModifiableParameters;
import spms.util.MyFileRenamePolicy;
import spms.vo.GalleryFiles;
// 스프링 IoC 컨테이너 사용
//@SuppressWarnings("serial")
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	  GalleryFiles galleryfiles;
  @Override
  protected void service(
      HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=UTF-8");
	int sizeLimit = 30*1024*1024;
	
    String servletPath = request.getServletPath();
    String savePath = request.getSession().getServletContext().getRealPath("/upload");
    File temp = new File(savePath);
    if(!temp.exists())
    {
    	temp.mkdirs();
    }
    try {
      ApplicationContext ctx = ContextLoaderListener.getApplicationContext();
      HashMap<String,Object> model = new HashMap<String,Object>();
       model.put("savePath",savePath);  
	  
	  
      //multipartrequest 처리
      if (request.getContentType() != null && request.getContentType().toLowerCase().indexOf("multipart/form-data") > -1 ) { 
    	  MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit,"utf-8",new MyFileRenamePolicy());
		  Enumeration eParam = multi.getParameterNames();
		  while (eParam.hasMoreElements()) {
		      String pName = (String)eParam.nextElement();

		     // pName =new String(pName.getBytes("KSC5601"),"8859_1");
		      String pValue = multi.getParameter(pName);
		     // pValue =new String(pValue.getBytes("KSC5601"),"8859_1");
		      HttpRequestWithModifiableParameters param = new HttpRequestWithModifiableParameters(request);
		      param.setParameter(pName, pValue); 
		      request = (HttpServletRequest)param;
		  }
		  String formName="";
		  String filesName="";
		  String fileoName="";
		  Long filesize;
		  File fileobj;
		  GalleryFiles galleryfile = new GalleryFiles();
		  Enumeration files = multi.getFileNames();
		  int i= 1;
		  MagicMatch match = null;
		  String fileType;
		  String[] fileArray= new String[]{"jpg","jpeg","gif","png"};
		  int fileindex=0;
		  while(files.hasMoreElements()){
			  
			  formName=(String)files.nextElement();			  
			  filesName=multi.getFilesystemName(formName);
			  if(filesName != null)
			  {
				  fileobj = multi.getFile(formName);

				  match = Magic.getMagicMatch(fileobj,true,false);
				  fileType = match.getExtension();
				  for(int j = 0 ; j<fileArray.length;j++)
				  {
					  fileindex = fileArray[j].indexOf(fileType);
					  if (fileindex >= 0 )
						  break;
				  }
				  if(fileindex == -1)
				  {	
					  System.out.println(fileType);
					  fileobj.delete();
					    continue;
				  }
				  galleryfile = new GalleryFiles();
				  fileoName = multi.getOriginalFileName(formName);
				  filesize = fileobj.length();
				  galleryfile.setOriginalFilename(fileoName).setSavedFilename(filesName).setFilesize(filesize);
					 model.put("galleryfile"+i,galleryfile);
				 i++;
			  }
			  
		  }
		  model.put("galleyfilecount", i-1);
	
      }

      // 페이지 컨트롤러에게 전달할 Map 객체를 준비한다. 
      model.put("session", request.getSession());
      
      Controller pageController = (Controller) ctx.getBean(servletPath);
      if (pageController == null) {
        throw new Exception("요청한 서비스를 찾을 수 없습니다.");
      }
      
      if (pageController instanceof DataBinding) {
        prepareRequestData(request, model, (DataBinding)pageController);
      }

      // 페이지 컨트롤러를 실행한다.
      String viewUrl = pageController.execute(model);
      
      // Map 객체에 저장된 값을 ServletRequest에 복사한다.
      for (String key : model.keySet()) {
        request.setAttribute(key, model.get(key));
      }
      
      if (viewUrl.startsWith("redirect:")) {
        response.sendRedirect(viewUrl.substring(9));
        return;
      } else {
        RequestDispatcher rd = request.getRequestDispatcher(viewUrl);
        rd.include(request, response);
      }
      
    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("error", e);
      RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
      rd.forward(request, response);
    }
  }

  private void prepareRequestData(HttpServletRequest request,
      HashMap<String, Object> model, DataBinding dataBinding)
      throws Exception {
    Object[] dataBinders = dataBinding.getDataBinders();
    String dataName = null;
    Class<?> dataType = null;
    Object dataObj = null;
    for (int i = 0; i < dataBinders.length; i+=2) {
      dataName = (String)dataBinders[i];
      dataType = (Class<?>) dataBinders[i+1];
      dataObj = ServletRequestDataBinder.bind(request, dataType, dataName);
      model.put(dataName, dataObj);
    }
  }
}
