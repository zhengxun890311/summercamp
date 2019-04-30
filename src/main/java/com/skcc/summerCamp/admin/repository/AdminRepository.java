package com.skcc.summerCamp.admin.repository;
import org.springframework.data.repository.CrudRepository;

import com.skcc.summerCamp.models.AdminInfo;

public interface AdminRepository extends CrudRepository<AdminInfo,Long> {
	
}
