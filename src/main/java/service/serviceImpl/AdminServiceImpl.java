package service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.AdminMapper;
import pojo.Admin;
import service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminmapper;
	
	public Admin VerifyLogin(long adminId, long password) {
		// TODO Auto-generated method stub
		return adminmapper.verifyAdmin(adminId, password);
	}

}
