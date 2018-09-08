package service.serviceImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import DTO.AppointResult;
import enums.AppointStateEnum;
import exception.AppointException;
import exception.NoStockException;
import exception.RepeatAppointException;
import mapper.AppointmentMapper;
import mapper.BookMapper;
import pojo.Appointment;
import pojo.Book;
import service.AppointmentService;

@Service
public class AppointmentServiceImpl implements AppointmentService {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired
	private AppointmentMapper appointmapper;
	@Autowired
	private BookMapper bookmapper;
	
	
	
	public List<Appointment> getAppointmentByStudentId(long studentId) {
		// TODO Auto-generated method stub
		return appointmapper.getAppointmentByStudent(studentId);
	}

	public List<Appointment> getAppointments() {
		return appointmapper.getAppointments();
	}
	
	public void deleteAppointment(long bookId, long studentId) {
		// TODO Auto-generated method stub
		appointmapper.delete(bookId, studentId);
	}

	public List<Book> getListOfAppointedBooks() {
		// TODO Auto-generated method stub
		return appointmapper.getReservedBooks();
	}
	
	@Transactional
	public AppointResult appoint(long bookId, long studentId){
		try {
			int update = bookmapper.reduceNumber(bookId);
			if(update<=0){//已经无库存！
				throw new NoStockException("no stock");
			}else{ 
				int insert = appointmapper.insertAppointment(bookId, studentId);
				if(insert<=0){//重复预约
					throw new RepeatAppointException("repeat appoint");
				}else{//预约成功
					return new AppointResult(bookId,studentId,AppointStateEnum.SUCCESS);
				}
			}
		} catch (NoStockException e) {
			// TODO: handle exception
			throw e;
		} catch (RepeatAppointException e) {
			// TODO: handle exception
			throw e;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(), e);
			// 所有编译期异常转换为运行期异常
			throw new AppointException("appoint inner error:" + e.getMessage());
		}
	}
}
