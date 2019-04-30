package com.skcc.summerCamp.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.summerCamp.common.UserCommon;
import com.skcc.summerCamp.models.User;
import com.skcc.summerCamp.models.UserPhoto;
import com.skcc.summerCamp.user.repository.UserPhotoRepository;

@Service
public class UserPhotoService {
	@Autowired
	private UserPhotoRepository userPhotoRepository;
	
	public UserPhoto createUserPhoto(String url,HttpSession session) {
		UserPhoto userPhoto = new UserPhoto();
		userPhoto.setUser_photo_path(url);
		User user = UserCommon.commonUser(session);
		userPhoto.setUser(user);
		return userPhotoRepository.save(userPhoto);
	}
	
	public UserPhoto findUserPhoto(Long id) {
		return userPhotoRepository.findUserPhoto(id);
	}
	
}
