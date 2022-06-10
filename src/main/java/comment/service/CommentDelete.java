package comment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.controller.CommentService;
import comment.model.CommentDAO;

public class CommentDelete implements CommentService{
   
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      
      new CommentDAO().delete(request.getParameter("comment_id"));
      
      
      
      request.setAttribute("mainUrl", "commu_bas/board/Detail");
   }

}