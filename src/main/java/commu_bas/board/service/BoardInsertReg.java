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

public class BoardInsertReg implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 파일 업로드
		String realImgPath = "";
//		String realUpFilePath = "";
		
		String saveImgPath = "/Users/minsookim/Desktop/프로젝트/04_proj/proj_04_minsoo/proj_04_minsoo/src/main/webapp/uploadFile/commu_bas/board";
//		String saveUpFilePath = "/Users/minsookim/Desktop/프로젝트/04_proj/proj_04_minsoo/proj_04_minsoo/src/main/webapp/uploadFile/commu_bas/board";
		int maxSize = 10 * 1024 * 1024;

		String type = "utf-8";
		realImgPath = saveImgPath;
//		realUpFilePath = saveUpFilePath;

		String title = "";
		String user_id = "";
		String post_id = "";
		String pw = "";
		String content = "";
		String allImg = "";

		HashMap<String, String> list = new HashMap<String, String>();

		try {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			diskFileItemFactory.setRepository(new File(realImgPath));
			diskFileItemFactory.setSizeThreshold(maxSize);
			diskFileItemFactory.setDefaultCharset(type);
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);

			List<FileItem> items = fileUpload.parseRequest(request);

			for (FileItem item : items) {
				if (item.isFormField()) {
					list.put(item.getFieldName(), item.getString());

				} else {
					if (item.getSize() > 0) {
						String separator = File.separator;
						System.out.println();
						int index = item.getName().lastIndexOf(separator);
						String fileName = item.getName().substring(index + 1);
						
						// 이미지 || 문서 파일 나누기
						File uploadFile = new File(realImgPath + separator + fileName);

						allImg += fileName + ",";

						item.write(uploadFile);

					} // if
				} // else
			} // for

			title = list.get("title");
			user_id = list.get("user_id");
			post_id = list.get("post_id");
			pw = list.get("pw");
			content = list.get("content");

			System.out.println(allImg);

			BoardDTO dto = new BoardDTO(title, user_id, post_id, pw, content, allImg);

			new BoardDAO().insert(dto);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("msg", "작성되었습니다");
		request.setAttribute("goUrl", "List");
		request.setAttribute("mainUrl", "commu_bas/board/alert");
		System.out.println("BoardInsertReg execute() 실행");

	}

}