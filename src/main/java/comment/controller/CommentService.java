package comment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommentService {
      void execute(HttpServletRequest request, HttpServletResponse response);
}