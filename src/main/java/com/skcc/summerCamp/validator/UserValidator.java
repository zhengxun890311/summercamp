package com.skcc.summerCamp.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.skcc.summerCamp.models.User;



@Component
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user=(User)target;
		if(!user.getPasswordConfirmation().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirmation", "Match");
		}
		if (user.getUser_first_name().length()<2||user.getUser_first_name().length()>100||
				user.getUser_first_name().length()==0) {
			errors.rejectValue("user_first_name", "Match");
		}
	}
}
