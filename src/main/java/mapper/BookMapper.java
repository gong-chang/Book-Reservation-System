package mapper;

import java.util.List;

import pojo.Book;
import util.Page;


public interface BookMapper {
	void add(Book book);
	void delete(long id);
	void update(Book book);
	List<Book> get(long id);
	List<Book> get(String name);
	int getTotal();
    List<Book> listAll();
    List<Book> listAll(Page page);
    int getStock(long id);
    int reduceNumber(long id);
}
