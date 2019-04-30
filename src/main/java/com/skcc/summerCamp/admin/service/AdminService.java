package com.skcc.summerCamp.admin.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.summerCamp.admin.repository.AdminRepository;
import com.skcc.summerCamp.models.AdminInfo;

@Service
public class AdminService {
	@Autowired
	private AdminRepository adminRepository;
	
	public AdminInfo createAdmin(AdminInfo adminInfo) {
		String hashedPwd = BCrypt.hashpw(adminInfo.getAdmin_password(), BCrypt.gensalt());
		adminInfo.setAdmin_password(hashedPwd);
		return adminRepository.save(adminInfo);
	}
}
