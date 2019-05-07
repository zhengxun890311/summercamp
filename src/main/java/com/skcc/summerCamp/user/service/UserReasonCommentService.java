package com.skcc.summerCamp.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.summerCamp.common.UserCommon;
import com.skcc.summerCamp.models.UserReasonComment;
import com.skcc.summerCamp.models.UserResumeHobby;
import com.skcc.summerCamp.user.repository.UserReasonCommentRepository;

@Service
public class UserReasonCommentService {
	@Autowired
	private UserReasonCommentRepository userReasonCommentRepository;
	
	public UserReasonComment createUserReasonCommentRepository(HttpSession session,UserReasonComment userReasonComment){
		userReasonComment.setUser(UserCommon.commonUser(session));
		return userReasonCommentRepository.save(userReasonComment);
	}
	
	public UserReasonComment findUserReasonComment(Long id) {
		return userReasonCommentRepository.findUserReasonComment(id);
	}
	public void updateUserReasonComment(UserReasonComment userReasonComment) {
		Long id = userReasonComment.getUser().getId();
		String user_comment = userReasonComment.getUser_comment();
		String user_reason = userReasonComment.getUser_reason();
		userReasonCommentRepository.updateUserReasonComment(id, user_comment, user_reason);
	}
}