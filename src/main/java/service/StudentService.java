package service;

import java.util.List;

import pojo.Student;

public interface StudentService {
	Student VerifyLogin(long studentId, long password);
	
	void addStudent(Student student);
	
	void deleteStudentById(long studentId);
	
	List<Student> getList();
	
	Student searchStudent(long studentId);
	
	Student searchStudent(String name);
}
