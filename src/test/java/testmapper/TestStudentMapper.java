package testmapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import mapper.StudentMapper;
import pojo.Book;
import pojo.Student;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestStudentMapper {
	@Autowired
	private StudentMapper studentMapper;
	
	@Test
    public void TestverifyStudent() {//pass
		Student s = studentMapper.verifyStudent(3211200801L, 346533);
		System.out.println(s);
	}
	@Test
    public void Testadd() {//pass
		Student s =new Student (3211200809L,123456,"David");
		studentMapper.add(s);
	}
	@Test
    public void Testdelete() {//pass
		studentMapper.delete(3211200809L);
	}
	@Test
    public void TestlistStudent() {//pass
		List<Student> students = studentMapper.listStudent();
		for (Student s : students) {
			System.out.println(s);
		}
	}
	
	@Test
    public void Testget() {//pass
		 Student s = studentMapper.get(3211200803L);
		 System.out.println(s);
	}
}
