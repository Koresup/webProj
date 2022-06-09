package commu_bas.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO {
	
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
		
	public BoardDAO() {
			
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/qazxsw");
			con = ds.getConnection();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
}

	
	public int totalCnt() {
		
		sql = "select count(*) from commu_Bas_board";
		
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
		
			rs.next();
				
			return rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return 0;
	}
	
	public ArrayList<BoardDTO> list(int start, int limit) {
		ArrayList<BoardDTO> res = new ArrayList<BoardDTO>();
		
		sql = "select * from commu_Bas_board order by post_id desc limit ?, ?"; // 뒤는 번호를 받아와야함
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, start);
			ptmt.setInt(2, limit);
			
			rs = ptmt.executeQuery(); // 여기에 sql ㄴㄴ
		
			while(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
		
	}
	
	public BoardDTO detail(String post_id) {
		BoardDTO dto = null;
		
		sql = "select * from commu_Bas_board where post_id =?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, post_id);
			rs = ptmt.executeQuery(); // 여기에 sql ㄴㄴ
		
			if(rs.next()) {
				
				dto = new BoardDTO();
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setUpfile(rs.getString("upfile"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));					
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
		
	}
	
	public void addCount(String post_id) {		
		sql = "update commu_Bas_board set cnt = cnt + 1 where post_id =?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, post_id);
			ptmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void insert(BoardDTO dto) {	
		
		sql = "insert into commu_Bas_board (head, title, content, upfile, user_id, pw, post_id, reg_date, cnt) values " 
				+ "(?, ?, ?, ?, ?, ?, ?, sysdate(), 0)";
		
		try {
			ptmt = con.prepareStatement(sql);
			
			ptmt.setString(1, dto.head);
			ptmt.setString(2, dto.title);
			ptmt.setString(3, dto.content);
			ptmt.setString(4, dto.upfile);
			ptmt.setString(5, dto.user_id);
			ptmt.setString(6, dto.pw);
			ptmt.setString(7, dto.post_id);
			
			ptmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		
	}
	
	
	public int modify(BoardDTO dto) {	
		int res = 0;
		
		sql = "update commu_Bas_board set head =?, title =?, content=?, upfile=?, user_id=? where pw=? and post_id=? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			
			ptmt.setString(1, dto.getHead());
			ptmt.setString(2, dto.getTitle());
			ptmt.setString(3, dto.getContent());
			ptmt.setString(4, dto.getUpfile());
			ptmt.setString(5, dto.getUser_id());
			ptmt.setString(6, dto.getPw());
			ptmt.setString(7, dto.getPost_id());
						
			res = ptmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		return res;
		
	}
	
	public int delete(BoardDTO dto) {	
		int res = 0;
		
		sql = "delete from commu_Bas_board where post_id=? and pw=?";
		
		try {
			ptmt = con.prepareStatement(sql);
			
		
			ptmt.setString(1, dto.post_id);
			ptmt.setString(2, dto.pw);
			
			res = ptmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			close();
		}
		return res;
	}
	
	
		
	public void close() {
		if (rs!=null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		if (ptmt!=null) try { ptmt.close(); } catch (SQLException e) {e.printStackTrace();}
		if (con!=null) try { con.close(); } catch (SQLException e) {e.printStackTrace();}
	}

}