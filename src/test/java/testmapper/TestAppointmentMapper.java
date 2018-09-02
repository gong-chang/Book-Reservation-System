package testmapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import mapper.AppointmentMapper;
import pojo.Appointment;
import pojo.Book;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestAppointmentMapper {
	@Autowired
	private AppointmentMapper appointmentMapper;
	
	@Test
    public void TestinsertAppointment() {//pass
		appointmentMapper.insertAppointment(1001, 3211200803L);
	}
	@Test
    public void TestgetAppointmentByStudent() {//pass
		List<Appointment> al = appointmentMapper.getAppointmentByStudent(3211200801L);
		for (Appointment a : al) {
			System.out.println(a);
		}
	}
	@Test
    public void Testdelete() {//pass
		appointmentMapper.delete(1000, 3211200801L);
	}
	@Test
    public void TestgetReservedBooks() {//pass
		List<Book> books = appointmentMapper.getReservedBooks();
		for (Book b : books) {
			System.out.println(b);
		}
	}

}
