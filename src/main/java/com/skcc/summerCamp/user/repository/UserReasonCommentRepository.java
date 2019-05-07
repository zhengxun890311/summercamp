package com.skcc.summerCamp.user.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.skcc.summerCamp.models.UserReasonComment;

public interface UserReasonCommentRepository extends CrudRepository<UserReasonComment,Long>{

	@Query(value="select * from user_reason_comment where user_id=?1",nativeQuery=true)
	UserReasonComment findUserReasonComment(Long id);
	
	@Transactional
	@Modifying
	@Query(value="update user_reason_comment set user_reason=?2,user_comment=?3 where user_id=?1",nativeQuery=true)
	void updateUserReasonComment(Long id,String user_reason,String user_comment);
}