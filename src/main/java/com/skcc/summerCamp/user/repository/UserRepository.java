package com.skcc.summerCamp.user.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.skcc.summerCamp.models.User;

public interface UserRepository extends CrudRepository<User,Long> {
	//User findByEmail(String user_email);
	List<User> findAll();
	
	@Query(value="select * from user where user_email=?1",nativeQuery=true)
	User findByEmail(String email);
}