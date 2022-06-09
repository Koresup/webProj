package commu_bas.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BoardService {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
}
