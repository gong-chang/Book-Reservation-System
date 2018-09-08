package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pojo.Appointment;
import pojo.Book;
import pojo.Student;
import service.AdminService;
import service.AppointmentService;
import service.BookService;
import service.StudentService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private BookService bookService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private AppointmentService appointmentService;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/booksPage")
	private ModelAndView adminBooks(){
		ModelAndView mav = new ModelAndView("adminPage");
		List<Book> booklist = bookService.getList();
		mav.addObject("booklist", booklist);
		return mav;
	}
	
	
	@RequestMapping("/studentsPage")
	private ModelAndView adminStudents(){
		ModelAndView mav = new ModelAndView("adminPageStudents");
		List<Student> studentlist = studentService.getList();
		mav.addObject("studentlist", studentlist);
		return mav;
	}
	
	@RequestMapping("/reservationsPage")
	private ModelAndView adminReservations(){
		ModelAndView mav = new ModelAndView("adminPageReservations");
		List<Appointment> reservationlist = appointmentService.getAppointments();
		mav.addObject("reservationlist", reservationlist);
		return mav;
	}
	
	@RequestMapping("/bookPreparePage")
	private ModelAndView adminbookPrepare(){
		ModelAndView mav = new ModelAndView("adminBookPrepare");
		List<Book> booklist = appointmentService.getListOfAppointedBooks();
		mav.addObject("booklist", booklist);
		return mav;
	}
	
	@RequestMapping("/deletebook")
	private ModelAndView deletebook(long bookId){
		bookService.deleteBookById(bookId);
		ModelAndView mav = new ModelAndView("adminPage");
		List<Book> booklist = bookService.getList();
		mav.addObject("booklist", booklist);
		return mav;
	}
	
	@RequestMapping("/editbook")
	private ModelAndView editbook(long bookId){
		Book b = bookService.get(bookId).get(0);
		ModelAndView mav = new ModelAndView("adminEditBook");
		mav.addObject("ID", b.getBookId());
		mav.addObject("Title", b.getName());
		System.out.println("intro is " + b.getIntro());
		mav.addObject("Stock", b.getNumber());
		mav.addObject("Description", b.getIntro());
		mav.addObject("bookId", bookId);
		return mav;
	}
	
	@RequestMapping("/editbook2")
	private ModelAndView editbook2(@RequestParam("ID") long bookId, @RequestParam("Title") String name,@RequestParam("Stock") int number,@RequestParam(value="intro", required=false) String intro){
		Book b = new Book(bookId, name, number, intro);
		bookService.updateBook(b);
		ModelAndView mav = new ModelAndView("adminPage");
		List<Book> booklist = bookService.getList();
		mav.addObject("booklist", booklist);
		return mav;
	}
	
	@RequestMapping("/addbook")
	private ModelAndView addbook(){
		ModelAndView mav = new ModelAndView("adminAddBook");
		return mav;
	}
	
	@RequestMapping("/addbook2")
	private ModelAndView addbook2(@RequestParam("ID") long bookId,@RequestParam("Title") String name,@RequestParam("Stock") int number,@RequestParam(value="intro", required=false) String intro){
		Book b = new Book(bookId, name, number, intro);
		bookService.addBook(b);
		ModelAndView mav = new ModelAndView("adminPage");
		List<Book> booklist = bookService.getList();
		mav.addObject("booklist", booklist);
		return mav;
	}
	
	@RequestMapping("/deletestudent")
	private ModelAndView deletestudent(long studentId){
		studentService.deleteStudentById(studentId);
		ModelAndView mav = new ModelAndView("adminPageStudents");
		List<Student> studentlist = studentService.getList();
		mav.addObject("studentlist", studentlist);
		return mav;
	}
	
	@RequestMapping("/editstudent")
	private ModelAndView editstudent(long studentId){
		Student s = studentService.searchStudent(studentId);
		ModelAndView mav = new ModelAndView("adminEditStudent");
		mav.addObject("ID", s.getStudentId());
		mav.addObject("name", s.getName());
		mav.addObject("password", s.getPassword());
		return mav;
	}
	
	@RequestMapping("/editstudent2")
	private ModelAndView editstudent2(@RequestParam("oldId") long oldId, @RequestParam("ID") long studentId, @RequestParam("password") long password,@RequestParam("name") String name) {
		Student s = new Student(studentId, password, name);
		studentService.deleteStudentById(oldId);
		studentService.addStudent(s);
		ModelAndView mav = new ModelAndView("adminPageStudents");
		List<Student> studentlist = studentService.getList();
		mav.addObject("studentlist", studentlist);
		return mav;
	}
	
	@RequestMapping("/addstudent")
	private ModelAndView addstudent(){
		ModelAndView mav = new ModelAndView("adminAddStudent");
		return mav;
	}
	
	@RequestMapping("/addstudent2")
	private ModelAndView addstudent2(@RequestParam("ID") long studentId,@RequestParam("password") long password,@RequestParam("name") String name){
		Student s = new Student(studentId, password, name);
		studentService.addStudent(s);
		ModelAndView mav = new ModelAndView("adminPageStudents");
		List<Student> studentlist = studentService.getList();
		mav.addObject("studentlist", studentlist);
		return mav;
	}
	
	@RequestMapping("/deleteappointment")
	private ModelAndView deletebook(long bookId, long studentId){
		appointmentService.deleteAppointment(bookId, studentId);
		ModelAndView mav = new ModelAndView("adminPageReservations");
		List<Appointment> reservationlist = appointmentService.getAppointments();
		mav.addObject("reservationlist", reservationlist);
		return mav;
	}
}


