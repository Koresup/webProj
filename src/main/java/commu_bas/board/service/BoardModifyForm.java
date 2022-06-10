package commu_bas.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commu_bas.board.controller.BoardService;
import commu_bas.board.model.BoardDAO;

public class BoardModifyForm implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

//		int id = Integer.parseInt(request.getParameter("id"));
		String post_id = request.getParameter("post_id");
		BoardDAO dao = new BoardDAO();

		Object data = dao.detail(post_id);

		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", "commu_bas/board/ModifyForm");
		System.out.println("BoardModifyForm execute() 실행" + data);
	}

}