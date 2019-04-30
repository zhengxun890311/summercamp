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
}