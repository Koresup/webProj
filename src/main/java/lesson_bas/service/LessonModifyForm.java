package lesson_bas.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commu_bas.board.controller.BoardService;
import commu_bas.board.model.BoardDAO;
import lesson_bas.controller.LessonService;
import lesson_bas.model.LessonDAO;

public class LessonModifyForm implements LessonService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
//		int id = Integer.parseInt(request.getParameter("id"));
		String post_id = request.getParameter("post_id");
		LessonDAO dao = new LessonDAO();
		
		
		Object data = dao.detail(post_id);
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", "lesson_bas/ModifyForm");
		System.out.println("LessonModifyForm execute() 실행" + data);
	}
	
}