package com.skcc.summerCamp.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.summerCamp.common.UserCommon;
import com.skcc.summerCamp.models.User;
import com.skcc.summerCamp.models.UserBasicInfo;
import com.skcc.summerCamp.user.repository.UserBasicInfoRepository;

@Service
public class UserBasicInfoService {
	@Autowired
	private UserBasicInfoRepository userBasicInfoRepository;
	
	public UserBasicInfo createUserBasicInfo(UserBasicInfo userBasicInfo,HttpSession session) {
		userBasicInfo.setUser(UserCommon.commonUser(session));
		userBasicInfo.setUser_street(userBasicInfo.getUser_street().toUpperCase());
		userBasicInfo.setUser_street(userBasicInfo.getUser_city().toUpperCase());
		userBasicInfo.setUser_street(userBasicInfo.getUser_state().toUpperCase());
		return userBasicInfoRepository.save(userBasicInfo);
	}
	public UserBasicInfo findUserBasicInfoById(Long id) {
		return userBasicInfoRepository.findUserBasicInfoById(id);
	}
	
	public void updateUserBasicInfo(UserBasicInfo userBasicInfo) {
		System.out.println(userBasicInfo.getUser_street());
		System.out.println(userBasicInfo.getUser_street());
		System.out.println(userBasicInfo.getUser_street());
		Long id = userBasicInfo.getUser().getId();
		System.out.println("id is "+userBasicInfo.getUser().getId());
		String user_phone= userBasicInfo.getUser_phone();
		String user_birth = userBasicInfo.getUser_birth();
		String user_street = userBasicInfo.getUser_street();
		String user_city = userBasicInfo.getUser_city();
		String user_state = userBasicInfo.getUser_state();
		String user_zip = userBasicInfo.getUser_zip();
		userBasicInfoRepository.updateUserBasicInfo(id, user_phone, user_birth, user_street, user_city, user_state, user_zip);
	}
}