package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import DTO.AppointResult;
import DTO.Result;
import enums.AppointStateEnum;
import exception.NoStockException;
import exception.RepeatAppointException;
import pojo.Appointment;
import pojo.Book;
import pojo.Student;
import service.AppointmentService;
import service.BookService;
import service.StudentService;
import util.Page;

@Controller
@RequestMapping("")
public class BookController {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired
	private BookService bookService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private AppointmentService appointmentService;
	
	//获取图书列表
	@RequestMapping(value="/listBooks")
	private  ModelAndView listBook(Page page){
		ModelAndView mav = new ModelAndView("listBooks");
		int total = bookService.getTotalBooks();
		page.caculateLast(total);
		List<Book> booklist = bookService.getList(page);
		mav.addObject("booklist", booklist);
		return mav;
	}
	
	//搜索是否有某图书
	@RequestMapping(value="/search")
	private ModelAndView searchBook(@ModelAttribute("searchName")String searchName, ModelMap modelMap) {
		List<Book> onebook = bookService.get(searchName);
		modelMap.addAttribute("booklist", onebook);
		return new ModelAndView("listBooks");
	}
	
	//查看某图书的详细情况
	@RequestMapping(value = "/detail")
	private ModelAndView detail(long bookId){
		Book b = bookService.get(bookId).get(0);
		if(b==null){
			return new ModelAndView("listBooks");
		}
		ModelAndView mav = new ModelAndView("detail");
		mav.addObject("book", b);
		return mav;
	}
	
	@RequestMapping(value="/reserveBook")
	private ModelAndView reserveBook(long bookId) {
		Book b = bookService.get(bookId).get(0);
//		if(b==null){
//			return new ModelAndView("listBooks");
//		}
		ModelAndView mav = new ModelAndView("reserveBook");
		mav.addObject("book", b);
		return mav;
	}
	
	//验证输入的用户名、密码是否正确
	@RequestMapping(value="/verify", method = RequestMethod.POST, produces = {
		"application/json; charset=utf-8" })
	@ResponseBody
	private Map validate(long studentId,long password){   //(HttpServletRequest req,HttpServletResponse resp){
		Map resultMap=new HashMap(); 
		Student student =null;  
		System.out.println("验证函数"); 
		student =studentService.VerifyLogin(studentId, password);
		
		System.out.println("输入的学号、密码："+studentId+":"+password);
		System.out.println("查询到的："+student.getStudentId()+":"+student.getPassword());
		
		if(student!=null){
			System.out.println("SUCCESS");
			resultMap.put("result", "SUCCESS");
			return resultMap;
		}else{ 
			resultMap.put("result", "FAILED");
			return resultMap;
		}
		
	}
	//执行预约的逻辑
	@RequestMapping(value = "/{bookId}/appoint", method = RequestMethod.POST, produces = {
	"application/json; charset=utf-8" })
	@ResponseBody
	private Result<AppointResult> execute(@PathVariable("bookId") long bookId,@RequestParam("studentId") long studentId){
		Result<AppointResult> result;
		AppointResult execution=null;
		
		System.out.println("开始执行预约controller");
		try{//手动try catch,在调用appoint方法时可能报错
			
			execution=appointmentService.appoint(bookId, studentId);
			result=new Result<AppointResult>(true,execution); 
			System.out.println("成功预约！");
				return result; 
				
		} catch(NoStockException e1) {
			execution=new AppointResult(bookId,studentId,AppointStateEnum.NO_STOCK);
			result=new Result<AppointResult>(true,execution);
				return result;
		}catch(RepeatAppointException e2){
			execution=new AppointResult(bookId,studentId,AppointStateEnum.REPEAT_APPOINT);
			result=new Result<AppointResult>(true,execution);
				return result;
		}catch (Exception e){
			execution=new AppointResult(bookId,studentId,AppointStateEnum.INNER_ERROR); 
			result=new Result<AppointResult>(true,execution);
				return result;
		} 
	}
	
	
	@RequestMapping(value ="/appoint")
	private String appointBooks(@RequestParam("studentId") long studentId,Model model){
		
		List<Appointment> appointList=new ArrayList<Appointment>();
		appointList=appointmentService.getAppointmentByStudentId(studentId);
		model.addAttribute("appointList", appointList);
		 
		return "appointBookList";
	}

}