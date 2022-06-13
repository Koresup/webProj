package commu_bas.board.service;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commu_bas.board.controller.BoardService;
import commu_bas.board.model.BoardDAO;
import commu_bas.board.model.BoardDTO;

public class BoardDeleteReg implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		BoardDTO dto = new BoardDTO();
		
		String post_id = request.getParameter("post_id");
		String deleteCheck = request.getParameter("deleteCheck");
		
		dto.setPost_id(post_id);
		int res = 0;
		if(deleteCheck.equals("삭제")) {
			res = new BoardDAO().delete(dto);
			System.out.println(dto);
		}
		 
		String msg = "삭제 실패", goUrl = "DeleteForm?post_id="+dto.getPost_id()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "삭제성공";
			goUrl = "List?page="+request.getAttribute("nowPage");
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "commu_bas/board/alert");
	}
}