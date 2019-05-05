package com.skcc.summerCamp.user.repository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.skcc.summerCamp.models.UserBasicInfo;

public interface UserBasicInfoRepository extends CrudRepository<UserBasicInfo,Long> {
	@Query(value="select * from user_basic_info where user_id=?1",nativeQuery=true)
	UserBasicInfo findUserBasicInfoById(Long id);
	
	@Transactional
	@Modifying
	@Query(value = "update user_basic_info u set u.user_phone=?2,"
			+ "u.user_birth=?3,u.user_street=?4,u.user_city=?5,"
			+ "u.user_state=?6,u.user_zip=?7 where u.user_id=?1",nativeQuery=true)
	void updateUserBasicInfo(Long id,String user_phone,String user_birth,
			String user_street,String user_city,String user_state,String user_zip);
}