package com.skcc.summerCamp.user.repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.skcc.summerCamp.models.UserBasicInfo;

public interface UserBasicInfoRepository extends CrudRepository<UserBasicInfo,Long> {
	@Query(value="select * from user_basic_info where user_id=?1",nativeQuery=true)
	UserBasicInfo findUserBasicInfoById(Long id);
}