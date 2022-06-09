package lesson_bas.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LessonService {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
}
