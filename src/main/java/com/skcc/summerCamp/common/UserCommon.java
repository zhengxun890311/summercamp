package com.skcc.summerCamp.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.skcc.summerCamp.models.User;
import com.skcc.summerCamp.user.service.UserService;

public class UserCommon {
	@Autowired
	private UserService userService;
	
	public static User commonUser(HttpSession session) {
		if(session==null) {
			System.out.println("this is null");
			System.out.println("this is null");
			System.out.println("this is null");
		}
		User user = new User();
		user.setId((Long)session.getAttribute("userId"));
		user.setUser_email(session.getAttribute("userEmail").toString());
		user.setUser_first_name(session.getAttribute("userFirstName").toString());
		user.setUser_last_name(session.getAttribute("userLastName").toString());
		user.setPassword(session.getAttribute("password").toString());
		return user;
	}
	
	public void setUserInfo(User user,User userObj) {
		userObj.setUser_first_name(user.getUser_first_name());
		userObj.setUser_last_name(user.getUser_last_name());
		userObj.setUser_email(user.getUser_email());
		userObj.setCreatedAt(user.getCreatedAt());
	}
	//get user id
	public User getId(Long userId) {
		User user = new User();
		user.setId(userId);
		return user;
	}
}
