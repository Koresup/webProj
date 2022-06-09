package comment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.controller.CommentService;
import comment.model.CommentDAO;
import comment.model.CommentDTO;

public class CommentInsert implements CommentService{
   
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {

      String post_id = request.getParameter("post_id");
      String page = request.getParameter("page");
      String comment = request.getParameter("comment");
      String user_id = request.getParameter("user_id");
      
      CommentDTO dto = new CommentDTO();
      dto.setPost_id(post_id);
      dto.setComment_id("comment" + System.currentTimeMillis());
      dto.setComment_writer(user_id);
      dto.setContent(comment);
      
      
      new CommentDAO().insert(dto);
      
      request.setAttribute("msg", "댓글이 작성되었습니다.");
      request.setAttribute("goUrl", "/commu_bas/PostDetail_Reg?post_id="+post_id+"&page="+page);
      request.setAttribute("mainUrl", "alert");
   }
   
}