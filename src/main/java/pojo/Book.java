package pojo;

public class Book {
	private long bookId;
	private String name;
	private int number;
	private String intro;
	
	public Book() {  
	}
	public Book(long bookId, String name, int number, String intro) { 
		this.bookId = bookId;
		this.name = name;
		this.number = number;
		this.intro = intro;
	}
	public long getBookId() {
		return bookId;
	}
	public void setBookId(long bookId) {
		this.bookId = bookId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntrod(String intro) {
		this.intro = intro;
	}

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", name=" + name + ", number=" + number + ", intro=" + intro + "]";
	}
}

