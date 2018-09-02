package service;

import pojo.Admin;

public interface AdminService {
	Admin VerifyLogin(long adminId,long password);
}
