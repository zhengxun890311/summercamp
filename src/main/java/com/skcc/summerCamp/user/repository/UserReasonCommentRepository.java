package com.skcc.summerCamp.user.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.skcc.summerCamp.models.UserReasonComment;

public interface UserReasonCommentRepository extends CrudRepository<UserReasonComment,Long>{

	@Query(value="select * from user_reason_comment where user_id=?1",nativeQuery=true)
	UserReasonComment findUserReasonComment(Long id);
}