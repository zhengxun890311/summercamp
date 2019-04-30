package com.skcc.summerCamp.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.summerCamp.common.UserCommon;
import com.skcc.summerCamp.models.UserUniversityInfo;
import com.skcc.summerCamp.user.repository.UserUniversityRepository;

@Service
public class UserUniversityService {
	@Autowired
	private UserUniversityRepository userUniversityRepository;
	
	public UserUniversityInfo createUserUniversity(HttpSession session,UserUniversityInfo userUniversityInfo) {
		userUniversityInfo.setUser(UserCommon.commonUser(session));
		return userUniversityRepository.save(userUniversityInfo);
	}
	
	public UserUniversityInfo findUserUnivesityInfo(Long id) {
		return userUniversityRepository.findUserUnivesityInfo(id);
	}
}
