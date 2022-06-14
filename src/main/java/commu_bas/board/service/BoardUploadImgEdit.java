package commu_bas.board.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commu_bas.board.controller.BoardService;
import commu_bas.board.model.BoardDAO;
import commu_bas.board.model.BoardDTO;

public class BoardUploadImgEdit implements BoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String post_id = request.getParameter("post_id");
		BoardDTO delDTO = new BoardDAO().detail(post_id);

		int res = new BoardDAO().modifyFile(post_id);
		if (res > 0) {
			if (delDTO.getImg() != null) {
				String images = delDTO.getImg();
				String[] tokens = images.split(",");

				String path = request.getRealPath("board");
				path = "/Users/minsookim/Desktop/프로젝트/04_proj/proj_04_minsoo/proj_04_minsoo/src/main/webapp/uploadFile/commu_bas/board";

				for (int i = 0; i < tokens.length; i++) {
					System.out.println(path + "\\" + tokens[i]);
					new File(path + "\\" + tokens[i]).delete();
				}
			}
		}

		request.setAttribute("mainUrl", "market/PostModify");
	}

}
