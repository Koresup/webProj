package commu_bas.board.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commu_bas.board.controller.BoardService;

public class BoardFileDown implements BoardService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			// 한글 파일 이름 변환 인코더
		   String fName = request.getParameter("fname");
		   String en = URLEncoder.encode(fName,"utf-8");

		   response.setHeader("Content-Disposition", "attachment; filename="+en);

		   // out.clear();
		   // out = PageContext.pushBody();
		   
		   String path = request.getRealPath("board");
		   path = "/Users/minsookim/Desktop/프로젝트/04_proj/proj_04_minsoo/proj_04_minsoo/src/main/webapp/uploadFile/commu_bas/board";
		   path += "/"+fName;

		   FileInputStream fis = new FileInputStream(path);
		   ServletOutputStream sos = response.getOutputStream();
		   
		   byte[] buf = new byte[1024];
		   
		   while(fis.available()>0){
		      int len = fis.read(buf);
		      sos.write(buf,0,len);
		   }
		   
		   sos.close();
		   fis.close();
		   System.out.println("BoardList execute() 실행");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}