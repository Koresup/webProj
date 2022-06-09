package lesson_bas.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class F_Controller
 */
@WebServlet("/lesson_bas/*")
public class Lesson_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	ArrayList<String> nonClass;
	
    public Lesson_Controller() {
        super();
        nonClass = new ArrayList<String>();
        nonClass.add("InsertForm");
        nonClass.add("DeleteForm"); 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String serviceStr = request.getRequestURI().substring(
				(request.getContextPath() + "/lesson_bas/").length()
				);
		System.out.println(serviceStr);
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		request.setAttribute("nowPage", page);

		
		if (nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", "lesson_bas/" + serviceStr);

		} else {
			// 외워라
			try {
				LessonService service = 
						(LessonService) Class.forName("lesson_bas.service.Lesson" + serviceStr)
						.newInstance(); // 임포트가 아니니 패키지 이름부터 땡겨야함

				service.execute(request, response);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (!serviceStr.equals("FileDown")) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main/template.jsp");
		
		dispatcher.forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
