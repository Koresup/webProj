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
		dto.setPost_id(post_id);
		dto.setPw(request.getParameter("pw"));

		BoardDTO delDTO = new BoardDAO().detail(post_id);

		int res = new BoardDAO().delete(dto);

		String msg = "삭제 실패", goUrl = "DeleteForm?post_id=" + dto.getPost_id();

		if (res > 0) {

			msg = "삭제 성공";
			goUrl = "List" + "?page=" + request.getParameter("nowPage");

			if (delDTO.getUpfile() == null) {
				String path = request.getRealPath("board");
				path = "/Users/minsookim/Desktop/프로젝트/04_proj/proj_04_minsoo/proj_04_minsoo/src/main/webapp/uploadFile/commu_bas/board";
				new File(path + "/" + delDTO.getUpfile()).delete();
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "commu_bas/board/alert");
		System.out.println("BoardModifyReg execute() 실행");

	}
}