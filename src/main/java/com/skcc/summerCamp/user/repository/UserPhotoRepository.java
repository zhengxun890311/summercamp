package com.skcc.summerCamp.user.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.skcc.summerCamp.models.UserPhoto;

public interface UserPhotoRepository extends CrudRepository<UserPhoto,Long> {
	
	@Query(value="select * from user_photo where user_id=?1",nativeQuery=true)
	UserPhoto findUserPhoto(Long id);
	
	@Transactional
	@Modifying
	@Query(value="update user_photo set user_photo_path=?2 where user_id=?1",nativeQuery=true)
	void updateUserPhoto(Long id,String user_photo_path);
}
