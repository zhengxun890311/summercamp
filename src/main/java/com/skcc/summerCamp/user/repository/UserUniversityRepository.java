package com.skcc.summerCamp.user.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.skcc.summerCamp.models.UserUniversityInfo;

public interface UserUniversityRepository extends CrudRepository<UserUniversityInfo,Long>{
	@Query(value="select * from user_university_info where user_id=?1",nativeQuery=true)
	UserUniversityInfo findUserUnivesityInfo(Long id);
}
