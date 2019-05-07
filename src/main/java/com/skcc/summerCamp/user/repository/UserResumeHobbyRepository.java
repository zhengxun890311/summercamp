package com.skcc.summerCamp.user.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.skcc.summerCamp.models.UserBasicInfo;
import com.skcc.summerCamp.models.UserResumeHobby;

public interface UserResumeHobbyRepository extends CrudRepository<UserResumeHobby,Long> {
	@Query(value="select * from user_resume_hobby where user_id=?1",nativeQuery=true)
	UserResumeHobby findResumeHobby(Long id);
	
	@Transactional
	@Modifying
	@Query(value="update user_resume_hobby u set u.user_resume=?2,"
			+ "u.user_hobby=?3 where user_id=?1",nativeQuery=true)
	void updateResumeHobby(Long id,String user_resume,String user_hobby);
}