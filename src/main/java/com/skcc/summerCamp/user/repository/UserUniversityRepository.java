package com.skcc.summerCamp.user.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.skcc.summerCamp.models.UserUniversityInfo;

public interface UserUniversityRepository extends CrudRepository<UserUniversityInfo,Long>{
	@Query(value="select * from user_university_info where user_id=?1",nativeQuery=true)
	UserUniversityInfo findUserUnivesityInfo(Long id);
	
	@Transactional
	@Modifying
	@Query(value="update user_university_info u set u.user_university=?2,"
			+ "u.user_major=?3,u.user_university_date=?4,"
			+ "u.user_grade=?5 where u.user_id=?1",nativeQuery=true)
	void updateUserUnivesityInfo(Long id,String user_university,String user_major,
			String user_university_date,String user_grade);
}
