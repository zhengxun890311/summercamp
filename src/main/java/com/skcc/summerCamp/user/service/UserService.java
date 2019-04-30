package com.skcc.summerCamp.user.service;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.summerCamp.models.User;
import com.skcc.summerCamp.models.UserUniversityInfo;
import com.skcc.summerCamp.user.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	
	public User createUser(User user) {
		String hashedPwd = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashedPwd);
		return userRepository.save(user);
	}
	public User findAll() {
		List<User> user = userRepository.findAll();
		return user.get(0);
	}
	
	public List<User> findAllUser(){
		List<User> userList = userRepository.findAll();
		return userList;
	}

	public boolean authenticateUser(String email,String password) {
		User user = userRepository.findByEmail(email);
		if(user==null) {
			return false;
		}
		else {
			if(BCrypt.checkpw(password, user.getPassword())) {
				return true;
			}
			else {
				return false;
			}
		}
	}
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
}