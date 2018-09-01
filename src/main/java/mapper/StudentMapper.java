package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Student;

public interface StudentMapper {
	Student verifyStudent(@Param("studentId") long studentId, @Param("password)")  long password);
	
	void add(Student student);
	
	void delete(long studentId);
	
	List<Student> listStudent();
	
	Student get(Student student);//依据学号或者名字查询
}
