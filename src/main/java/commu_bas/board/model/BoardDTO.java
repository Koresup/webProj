package commu_bas.board.model;

import java.util.Date;
import java.util.regex.Pattern;

public class BoardDTO {

	int cnt;
	String post_id;
	String head, title, content, upfile, img, user_id, pw;
	Date reg_date;

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public BoardDTO() {
	}

	public BoardDTO(String title, String user_id, String post_id, String pw, String content, String img) {
		this.title = title;
		this.user_id = user_id;
		this.post_id = "commu_bas_board" + System.currentTimeMillis();
		this.pw = pw;
		this.content = content;
		this.img = img;
	}

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public String getContentBr() {
		return content.replaceAll("\n", "<br>");
	}

	public void setContent(String content) {
		this.content = content;
	}

	// 조건 3가지 달아주기
	public String getUpfile() {
		if (upfile == null || upfile.trim().equals("") || upfile.trim().equals("null")) {
			return null;
		}
		return upfile;
	}

	public void setUpfile(String upfile) {
		this.upfile = upfile;
	}

	public boolean isImg() {
		if (getUpfile() == null) {
			return false;
		}
		return Pattern.matches(".*[.](jpg|jpeg|png|bmp|gif)", upfile.toLowerCase());
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "BoardDTO [cnt=" + cnt + ", post_id=" + post_id + ", head=" + head + ", title=" + title + ", content="
				+ content + ", upfile=" + upfile + ", img=" + img + ", user_id=" + user_id + ", pw=" + pw
				+ ", reg_date=" + reg_date + "]";
	}
}
