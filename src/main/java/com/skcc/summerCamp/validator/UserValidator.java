package com.skcc.summerCamp.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.skcc.summerCamp.models.User;
import com.skcc.summerCamp.models.UserBasicInfo;
import com.skcc.summerCamp.models.UserResumeHobby;
import com.skcc.summerCamp.models.UserUniversityInfo;



@Component
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user=(User)target;
		if(!user.getPasswordConfirmation().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirmation", "Match");
		}
	}
	public void validateUserBasicInfo(Object target,Errors errors) {
		UserBasicInfo userBasicInfo = (UserBasicInfo)target;
		String addressRegex = "^(\\d{3,})\\s?(\\w{0,5})\\s([a-zA-Z]{2,30})\\s([a-zA-Z]{2,15})\\.?\\s?(\\w{0,5})$";
		String phoneRegex = "\\(?\\d{3}\\)?-? *\\d{3}-? *-?\\d{4}";
		String cityRegex="^[a-zA-Z]+(?:[\\s-][a-zA-Z]+)*$";
		String zipCodeRegex="^[0-9]{5}(?:-[0-9]{4})?$";

		if(!Pattern.matches(addressRegex, userBasicInfo.getUser_street())) {
			errors.rejectValue("user_street", "Match");
		}
		if(!Pattern.matches(phoneRegex,userBasicInfo.getUser_phone())){
			errors.rejectValue("user_phone","Match");
		}
		if(!Pattern.matches(cityRegex, userBasicInfo.getUser_city())) {
			errors.rejectValue("user_city", "Match");
		}
		if(!Pattern.matches(zipCodeRegex, userBasicInfo.getUser_zip())) {
			errors.rejectValue("user_zip", "Match");
		}
		if(userBasicInfo.getUser_birth()==""||userBasicInfo.getUser_birth()==null) {
			errors.rejectValue("user_birth", "Match");
		}
	}
	
	public void validateUniversityInfo(Object target,Errors errors) {
		UserUniversityInfo userUniversityInfo = (UserUniversityInfo)target;
		String university = " /([A-Z][^\\s,.]+[.]?\\s[(]?)*(College|University|Institute|Law School|School of|Academy)[^,\\d]*(?=,|\\d)/";
		if(userUniversityInfo.getUser_university().length()<1||
			userUniversityInfo.getUser_university()==null||
			userUniversityInfo.getUser_university()=="") {
			errors.rejectValue("user_university","Match");
		}
		if(userUniversityInfo.getUser_major().length()<1) {
			errors.rejectValue("user_major", "Match");
		}
		if(userUniversityInfo.getUser_grade().length()<1) {
			errors.rejectValue("user_grade", "Match");
		}
	}
	
	public void validateResumeHobby(Object target,Errors errors) {
		UserResumeHobby userResumeHobby=(UserResumeHobby)target;
		if(userResumeHobby.getUser_hobby().length()<1) {
			errors.rejectValue("user_hobby", "Match");
		}
		if(userResumeHobby.getUser_resume().length()<1) {
			errors.rejectValue("user_resume", "Match");
		}
	}
}
