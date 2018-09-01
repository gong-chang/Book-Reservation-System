package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Appointment;
import pojo.Book;

public interface AppointmentMapper {
	int insertAppointment(@Param("bookId") long bookId, @Param("studentId") long studentId);
	
	List<Appointment> getAppointmentByStudent(long studentId);
	
	void delete(@Param("bookId") long bookId, @Param("studentId") long studentId);
	
	List<Book> getReservedBooks();
}
