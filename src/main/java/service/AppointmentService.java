package service;

import java.util.List;

import DTO.AppointResult;
import pojo.Appointment;
import pojo.Book;

public interface AppointmentService {
	AppointResult appoint(long bookId, long studentId);//返回预约成功的实体类
	
	List<Appointment> getAppointmentByStudentId(long studentId);
	
	List<Appointment> getAppointments();
	
	void deleteAppointment(long bookId, long studentId);
	
	List<Book> getListOfAppointedBooks();
}
