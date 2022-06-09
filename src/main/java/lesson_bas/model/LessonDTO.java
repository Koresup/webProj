package lesson_bas.model;

import java.util.Date;

public class LessonDTO {
	
	int no, price, max_student;
	boolean option1, option2, option3, option4, option5;
	String post_id, category, sname, 
			contents_info, contents_detail, contents_rule, contents_refund,
			img, lesson_time, manager_id, location;
	
	Date reg_date;
	
	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	public boolean isOption1() {
		return option1;
	}
	
	public int getIntOption1() {
		int res = 0;
		if(option1) {
			res = 1;
		}
		return res;
	}
	public void setOption1(boolean option1) {
		this.option1 = option1;
	}
	
	public void setOption1(int option1) {
		this.option1 = (option1==1);
	}

	public boolean isOption2() {
		return option2;
	}
	public int getIntOption2() {
		int res = 0;
		if(option2) {
			res = 1;
		}
		return res;
	}	
	public void setOption2(boolean option2) {
		this.option2 = option2;
	}
	public void setOption2(int option2) {
		this.option2 = (option2==1);
	}
	public boolean isOption3() {
		return option3;
	}
	public int getIntOption3() {
		int res = 0;
		if(option3) {
			res = 1;
		}
		return res;
	}
	public void setOption3(boolean option3) {
		this.option3 = option3;
	}
	public void setOption3(int option3) {
		this.option3 = (option3==1);
	}
	public boolean isOption4() {
		return option4;
	}
	public int getIntOption4() {
		int res = 0;
		if(option4) {
			res = 1;
		}
		return res;
	}
	
	public void setOption4(boolean option4) {
		this.option4 = option4;
	}
	
	public void setOption4(int option4) {
		this.option4 = (option4==1);
	}
	
	public boolean isOption5() {
		return option5;
	}
	
	public int getIntOption5() {
		int res = 0;
		if(option5) {
			res = 1;
		}
		return res;
	}
	
	public void setOption5(boolean option5) {
		this.option5 = option5;
	}
	
	public void setOption5(int option5) {
		this.option5 = (option5==1);
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getContents_info() {
		return contents_info;
	}
	public void setContents_info(String contents_info) {
		this.contents_info = contents_info;
	}
	public String getContents_detail() {
		return contents_detail;
	}
	public void setContents_detail(String contents_detail) {
		this.contents_detail = contents_detail;
	}
	public String getContents_rule() {
		return contents_rule;
	}
	public void setContents_rule(String contents_rule) {
		this.contents_rule = contents_rule;
	}
	public String getContents_refund() {
		return contents_refund;
	}
	public void setContents_refund(String contents_refund) {
		this.contents_refund = contents_refund;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getLesson_time() {
		return lesson_time;
	}
	public void setLesson_time(String lesson_time) {
		this.lesson_time = lesson_time;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public int getMax_student() {
		return max_student;
	}
	public void setMax_student(int max_student) {
		this.max_student = max_student;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
	@Override
	public String toString() {
		return "LessonDTO [no=" + no + ", price=" + price + ", max_student=" + max_student + ", option1=" + option1
				+ ", option2=" + option2 + ", option3=" + option3 + ", option4=" + option4 + ", option5=" + option5
				+ ", post_id=" + post_id + ", category=" + category + ", sname=" + sname + ", contents_info="
				+ contents_info + ", contents_detail=" + contents_detail + ", contents_rule=" + contents_rule
				+ ", contents_refund=" + contents_refund + ", img=" + img + ", lesson_time=" + lesson_time
				+ ", manager_id=" + manager_id + ", location=" + location + ", reg_date=" + reg_date + "]";
	}
	
	
	
	
	
	
	
	
	
}