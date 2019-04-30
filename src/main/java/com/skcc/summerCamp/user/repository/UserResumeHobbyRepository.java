package com.skcc.summerCamp.user.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.skcc.summerCamp.models.UserBasicInfo;
import com.skcc.summerCamp.models.UserResumeHobby;

public interface UserResumeHobbyRepository extends CrudRepository<UserResumeHobby,Long> {
	@Query(value="select * from user_resume_hobby where user_id=?1",nativeQuery=true)
	UserResumeHobby findResumeHobby(Long id);
}