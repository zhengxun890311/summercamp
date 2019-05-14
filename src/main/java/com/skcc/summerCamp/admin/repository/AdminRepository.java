package com.skcc.summerCamp.admin.repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.skcc.summerCamp.models.AdminInfo;
import com.skcc.summerCamp.models.User;

public interface AdminRepository extends CrudRepository<AdminInfo,Long> {
	
	@Query(value="select * from admin_info where admin_username=?1",nativeQuery=true)
	AdminInfo findAdminInfoByUsername(String username);
}
