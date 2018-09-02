package service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.StudentMapper;
import pojo.Student;
import service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentMapper studentmapper;
	
	public Student VerifyLogin(long studentId, long password) {
		// TODO Auto-generated method stub
		return studentmapper.verifyStudent(studentId, password);
	}

	public void addStudent(Student student) {
		// TODO Auto-generated method stub
		studentmapper.add(student);
	}

	public void deleteStudentById(long studentId) {
		// TODO Auto-generated method stub
		studentmapper.delete(studentId);
	}

	public List<Student> getList() {
		// TODO Auto-generated method stub
		return studentmapper.listStudent();
	}
	public Student searchStudent(long studentId) {
		// TODO Auto-generated method stub
		return studentmapper.get(studentId);
	}

	public Student searchStudent(String name) {
		// TODO Auto-generated method stub
		return studentmapper.get(name);
	}

}
