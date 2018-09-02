package service;

import java.util.List;

import pojo.Appointment;
import pojo.Book;
import pojo.Student;
import util.Page;

public interface BookService {
	
	Book getById(long bookId);  
	
	List<Book> getList(Page page);
	
	List<Book> getList();
	
	void addBook(Book book);
	
	void deleteBookById(long id);
	
	void updateBook(Book book);
	
	int getRestById(long bookId);
	
	int reduceBookByOne(long bookId);
	
	int getTotalBooks();
}
