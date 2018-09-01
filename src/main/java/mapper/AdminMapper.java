package mapper;

import org.apache.ibatis.annotations.Param;

import pojo.Admin;

public interface AdminMapper {
	Admin verifyAdmin(@Param("adminId") long adminId, @Param("password") long password);
}
