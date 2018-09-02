package pojo;

import java.util.List;

public class Student {  
	private long studentId;
	private long password;
	private String name;
	private List<Book> books;
	
	public Student(){
		
	}
	public Student(long studentId,long password, String name){
		this.studentId=studentId;
		this.password=password;
		this.name = name;
	}
	
	
	public long getStudentId() {
		return studentId;
	}
	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}
	public long getPassword() {
		return password;
	}
	public void setPassword(long password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", password=" + password + ", name=" + name + ", books=" + books
				+ "]";
	}
	
}