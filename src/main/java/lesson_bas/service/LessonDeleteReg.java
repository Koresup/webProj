package lesson_bas.service;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson_bas.controller.LessonService;
import lesson_bas.model.LessonDAO;
import lesson_bas.model.LessonDTO;

public class LessonDeleteReg implements LessonService{
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		LessonDTO dto = new LessonDTO();
		String post_id = request.getParameter("post_id");
		dto.setPost_id(post_id);

		// ****** 삭제 매니저 아이디로 했음;; ******** 
		dto.setManager_id(request.getParameter("manager_id"));
		
		LessonDTO delDTO = new LessonDAO().detail(post_id);
		
		int res = new LessonDAO().delete(dto);
		
		String msg = "삭제 실패", 
				goUrl = "DeleteForm?post_id=" + dto.getPost_id();
		
		
		if (res > 0) {
			
			msg = "삭제 성공";
			goUrl = "List" + "?page=" + request.getParameter("nowPage");
			
			if (delDTO.getImg() == null) {
				String path = request.getRealPath("board");
				path = "/Users/minsookim/Desktop/프로젝트/04_proj/proj_04_minsoo/proj_04_minsoo/src/main/webapp/uploadFile/lesson_bas";
				new File(path + "/" + delDTO.getImg()).delete();
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "lesson_bas/alert");
		System.out.println("Lesson_bas/DeleteReg execute() 실행");
		
	}
}