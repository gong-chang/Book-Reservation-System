package service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.BookMapper;
import pojo.Book;
import service.BookService;
import util.Page;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookmapper;

	public List<Book> get(long bookId) {
		// TODO Auto-generated method stub
		return bookmapper.get(bookId);
	}
	
	public List<Book> get(String name) {
		// TODO Auto-generated method stub
		return bookmapper.get(name);
	}

	public List<Book> getList(Page page) {
		// TODO Auto-generated method stub
		return bookmapper.listAll(page);
	}

	public List<Book> getList() {
		// TODO Auto-generated method stub
		return bookmapper.listAll();
	}

	public void addBook(Book book) {
		bookmapper.add(book);

	}

	public void deleteBookById(long id) {
		bookmapper.delete(id);

	}

	public void updateBook(Book book) {
		bookmapper.update(book);

	}

	public int getRestById(long bookId) {
		// TODO Auto-generated method stub
		return bookmapper.getStock(bookId);
	}

	public int reduceBookByOne(long bookId) {
		// TODO Auto-generated method stub
		return bookmapper.reduceNumber(bookId);
	}

	public int getTotalBooks() {
		return bookmapper.getTotal();
	}
}
