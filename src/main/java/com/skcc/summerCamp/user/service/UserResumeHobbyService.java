package com.skcc.summerCamp.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.summerCamp.common.UserCommon;
import com.skcc.summerCamp.models.UserResumeHobby;
import com.skcc.summerCamp.user.repository.UserResumeHobbyRepository;

@Service
public class UserResumeHobbyService {
	@Autowired
	private UserResumeHobbyRepository userResumeHobbyRepository;
	
	public UserResumeHobby creteUserResumeHobby(HttpSession session,UserResumeHobby userResumeHobby) {
		userResumeHobby.setUser(UserCommon.commonUser(session));
		return userResumeHobbyRepository.save(userResumeHobby);
	}
	
	public UserResumeHobby findResumeHobby(Long id) {
		return userResumeHobbyRepository.findResumeHobby(id);
	}
	
	public void updateResumeHobby(UserResumeHobby userResumeHobby) {
		Long id = userResumeHobby.getUser().getId();
		String user_resume = userResumeHobby.getUser_resume();
		String user_hobby = userResumeHobby.getUser_hobby();
		userResumeHobbyRepository.updateResumeHobby(id, user_resume, user_hobby);
	}
}
