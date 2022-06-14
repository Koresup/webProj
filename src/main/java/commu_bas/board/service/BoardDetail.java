package commu_bas.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.model.CommentDAO;
import comment.model.CommentDTO;
import commu_bas.board.controller.BoardService;
import commu_bas.board.model.BoardDAO;

public class BoardDetail implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String post_id = request.getParameter("post_id");
		BoardDAO dao = new BoardDAO();
		ArrayList<CommentDTO> comment_dto = new CommentDAO().list(post_id);

		dao.addCount(post_id);
		Object data = dao.detail(post_id);

		request.setAttribute("dto", data);
		request.setAttribute("comment_dto", comment_dto);
		request.setAttribute("mainUrl", "commu_bas/board/Detail");
		System.out.println("BoardList excute() 실행" + data);

	}

}