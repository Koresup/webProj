package commu_bas.board.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import commu_bas.board.controller.BoardService;
import commu_bas.board.model.BoardDAO;
import commu_bas.board.model.BoardDTO;
import lesson_bas.model.LessonDAO;
import lesson_bas.model.LessonDTO;

public class BoardModifyReg implements BoardService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		String realPath = "";
		String savePath = "/Users/minsookim/Desktop/프로젝트/04_proj/proj_04_minsoo/proj_04_minsoo/src/main/webapp/uploadFile/commu_bas/board";
	    int maxSize = 10*1024*1024;
	    String type = "utf-8";
	    realPath = savePath;

	    String msg = null, goUrl = null;
	    String allImg = "";
	    
	    HashMap<String, String> map = new HashMap<String, String>();
	    
	    try {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			diskFileItemFactory.setRepository(new File(realPath));
			diskFileItemFactory.setSizeThreshold(maxSize);
			diskFileItemFactory.setDefaultCharset(type);
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
			
			List<FileItem> items = fileUpload.parseRequest(request);
	         
			for (FileItem item : items) {
	            if (item.isFormField()) {
	               map.put(item.getFieldName(), item.getString());
	               
	            } else {
	               if (item.getSize() > 0) {
	                  String separator = File.separator;
	                  int index = item.getName().lastIndexOf(separator);
	                  
	                  String fileName = item.getName().substring(index + 1);
	                  
	                  File uploadFile = new File(realPath + separator + fileName);
	                  allImg += fileName + ",";
	                  
	                  item.write(uploadFile);
	                  
	               } // if
	            } // else
	         } // for  
			
				        
			 BoardDTO dto = new BoardDTO();
			 
			 dto.setHead(map.get("head"));
			 dto.setTitle(map.get("title"));
			 dto.setContent(map.get("content"));
			 dto.setUpfile(allImg);
			 dto.setUser_id(map.get("user_id"));
			 dto.setPw(map.get("pw"));
			 dto.setPost_id(map.get("post_id"));
	        
	         int res =  new BoardDAO().modify(dto);
				
	         msg = "수정 실패"; 
	         goUrl = "ModifyForm?post_id=" + dto.getPost_id();
			
		
	         if (res > 0) {
				msg = "수정 성공";
				goUrl = "Detail?post_id=" + dto.getPost_id() + "&page=" + request.getAttribute	("nowPage");
	         }
         	        

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "commu_bas/board/alert");
		System.out.println("BoardModifyReg execute() 실행");
		
		
		
	}
	
}