package com.skcc.summerCamp.user.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.skcc.summerCamp.models.UserPhoto;

public interface UserPhotoRepository extends CrudRepository<UserPhoto,Long> {
	
	@Query(value="select * from user_photo where user_id=?1",nativeQuery=true)
	UserPhoto findUserPhoto(Long id);
}
