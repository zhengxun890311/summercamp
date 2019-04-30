package com.skcc.summerCamp.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.skcc.summerCamp.common.UserCommon;
import com.skcc.summerCamp.models.User;
import com.skcc.summerCamp.models.UserBasicInfo;
import com.skcc.summerCamp.models.UserPhoto;
import com.skcc.summerCamp.models.UserReasonComment;
import com.skcc.summerCamp.models.UserResumeHobby;
import com.skcc.summerCamp.models.UserUniversityInfo;
import com.skcc.summerCamp.user.service.UserBasicInfoService;
import com.skcc.summerCamp.user.service.UserPhotoService;
import com.skcc.summerCamp.user.service.UserReasonCommentService;
import com.skcc.summerCamp.user.service.UserResumeHobbyService;
import com.skcc.summerCamp.user.service.UserService;
import com.skcc.summerCamp.user.service.UserUniversityService;
import com.skcc.summerCamp.validator.UserValidator;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private UserBasicInfoService userBasicInfoService;

	@Autowired
	private UserUniversityService userUniversityservice;

	@Autowired
	private UserResumeHobbyService userResumeHobbyService;

	@Autowired
	private UserReasonCommentService userReasonCommentService;

	@Autowired
	private UserPhotoService userPhotoService;

	@Autowired
	private UserValidator userValidator;

	@RequestMapping("/")
	public String index(@ModelAttribute("userObj") User user) {
		return "/user/login.jsp";
	}

	// register new user
	@PostMapping("/register")
	public String createUser(@ModelAttribute("userObj") User userObj, HttpSession session, BindingResult result,
			@ModelAttribute("userBasicInfo") UserBasicInfo userBasicInfo) {
		userValidator.validate(userObj, result);
		if (result.hasErrors()) {
			return "/user/login.jsp";
		}
		User user = userService.createUser(userObj);
		session.setAttribute("userEmail", user.getUser_email());
		session.setAttribute("userId", user.getId());
		session.setAttribute("userFirstName", user.getUser_first_name());
		session.setAttribute("userLastName", user.getUser_last_name());
		session.setAttribute("password", user.getUser_last_name());
		return "/user/userMain.jsp";
	}

	@PostMapping("/addUserBasicInfo")
	public String addUserBasicInfo(@ModelAttribute("userObj") User user,
			@ModelAttribute("userBasicInfo") UserBasicInfo userBasicInfo,
			@ModelAttribute("userUniversityInfo") UserUniversityInfo userUniversityInfo, HttpSession session) {
		UserBasicInfo newUserBasicInfo = userBasicInfoService.createUserBasicInfo(userBasicInfo, session);
		return "/user/userUniversity.jsp";
	}

	@PostMapping("/addUserUniversityInfo")
	public String addUserUniversityInfo(@ModelAttribute("userObj") User user,
			@ModelAttribute("userUniversityInfo") UserUniversityInfo userUniversityInfo,
			@ModelAttribute("userResumeHobby") UserResumeHobby userResumeHobby, HttpSession session) {
		UserUniversityInfo newUserUniversityInfo = userUniversityservice.createUserUniversity(session,
				userUniversityInfo);
		return "/user/userResume.jsp";
	}

	@PostMapping("/addUserResumeHobby")
	public String addUserResumeHobby(@ModelAttribute("userObj") User user,
			@ModelAttribute("userResumeHobby") UserResumeHobby userResumeHobby,
			@ModelAttribute("userReasonComment") UserReasonComment userReasonComment, HttpSession session) {
		userResumeHobbyService.creteUserResumeHobby(session, userResumeHobby);
		return "/user/userReasonComment.jsp";
	}

	@PostMapping("/addUserReasonComment")
	public String addUserReasonComment(@ModelAttribute("userObj") User user,
			@ModelAttribute("userReasonComment") UserReasonComment userReasonComment,
			@ModelAttribute("userPhoto") UserPhoto userPhoto, HttpSession session) {
		userReasonCommentService.createUserReasonCommentRepository(session, userReasonComment);
		return "/user/userPhoto.jsp";
	}

	@RequestMapping(value = "/addUserPhoto")
	public String addUserPhoto(@ModelAttribute("userObj") User user,
			@RequestParam(value = "myfile") MultipartFile image,
			@Valid @ModelAttribute("userPhoto") UserPhoto userPhoto, 
			BindingResult bindingResult,
			HttpServletRequest request, HttpSession session, Model model) {
		String path = request.getSession().getServletContext().getRealPath("/images");
		File file = new File(path);
		if (!file.exists()) {
			file.mkdir();
		}
		String random_photo_name = UUID.randomUUID().toString().replaceAll("-", "");
		try {
			image.transferTo(new File(path + "/" + random_photo_name + "." + "jpg"));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String url = "images/" + random_photo_name + "." + "jpg";
		userPhotoService.createUserPhoto(url, session);
		System.out.println("database url is：" + url);
		return "redirect:userInfo";
	}

	@RequestMapping("/userInfo")
	public String checkUserInfo(@ModelAttribute("userObj") User user, Model model) {
		User userInfo = userService.findAll();
		model.addAttribute("userInfo", userInfo);
		return "/user/userInfo.jsp";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/user/login.jsp";
	}

	@RequestMapping("/login")
	public String login(@ModelAttribute("userObj") User userObj,
			@ModelAttribute("userBasicInfo") UserBasicInfo userBasicInfo, HttpSession session, Model model) {
		boolean check = userService.authenticateUser(userObj.getUser_email(), userObj.getPassword());
		System.out.println("hello world");
		if (check) {
			User user = userService.findByEmail(userObj.getUser_email());
			session.setAttribute("userEmail", user.getUser_email());
			session.setAttribute("userId", user.getId());
			session.setAttribute("userFirstName", user.getUser_first_name());
			session.setAttribute("userLastName", user.getUser_last_name());
			session.setAttribute("password", user.getUser_last_name());
			UserCommon userCommon = new UserCommon();
			userCommon.setUserInfo(user, userObj);
			UserBasicInfo newUserBasicInfo = userBasicInfoService.findUserBasicInfoById(user.getId());
			userBasicInfo.setUser_phone(newUserBasicInfo.getUser_phone());
			userBasicInfo.setUser_birth(newUserBasicInfo.getUser_birth());
			userBasicInfo.setUser_street(newUserBasicInfo.getUser_street());
			userBasicInfo.setUser_city(newUserBasicInfo.getUser_city());
			userBasicInfo.setUser_state(newUserBasicInfo.getUser_state());
			userBasicInfo.setUser_zip(newUserBasicInfo.getUser_zip());
			model.addAttribute("newUserBasicInfo", newUserBasicInfo);
			return "/user/userMain.jsp";
		} else {
			model.addAttribute("errors", "Please input correct email and password");
			userObj.setUser_email("");
			userObj.setPassword("");
			return "/user/login.jsp";
		}
	}

	@RequestMapping("/findUnivesityInfo")
	public String findUnivesityInfo(HttpSession session, 
		Model model, @ModelAttribute("userObj") User userObj) {
		User user = userService.findByEmail(session.getAttribute("userEmail").toString());
		UserCommon userCommon = new UserCommon();
		userCommon.setUserInfo(user, userObj);
		UserUniversityInfo newUserUniversityInfo = userUniversityservice
				.findUserUnivesityInfo((Long) session.getAttribute("userId"));
		System.out.println(newUserUniversityInfo.getUser_university());
		System.out.println(newUserUniversityInfo.getUser_university());
		model.addAttribute("userUniversityInfo", newUserUniversityInfo);
		return "/user/userUniversity.jsp";
	}

	@RequestMapping("/findResumeHobby")
	public String findResumeHobby(HttpSession session, Model model, @ModelAttribute("userObj") User userObj) {
		User user = userService.findByEmail(session.getAttribute("userEmail").toString());
		UserCommon userCommon = new UserCommon();
		userCommon.setUserInfo(user, userObj);
		UserResumeHobby newUserResumeHobby = userResumeHobbyService
				.findResumeHobby((Long) session.getAttribute("userId"));
		model.addAttribute("userResumeHobby", newUserResumeHobby);
		return "/user/userResume.jsp";
	}

	// find reason comment
	@RequestMapping("/findReasonComment")
	public String findReasonComment(HttpSession session,
			Model model, 
			@ModelAttribute("userObj") User userObj) {
		User user = userService.findByEmail(session.getAttribute("userEmail").toString());
		UserCommon userCommon = new UserCommon();
		userCommon.setUserInfo(user, userObj);
		UserReasonComment newUserReasonComment = userReasonCommentService
				.findUserReasonComment((Long) session.getAttribute("userId"));
		model.addAttribute("userReasonComment", newUserReasonComment);
		return "/user/userReasonComment.jsp";
	}
	
	@RequestMapping("/findUserPhoto")
	public String findUserPhoto(HttpSession session, 
			Model model, 
			@ModelAttribute("userObj") User userObj) {
		User user = userService.findByEmail(session.getAttribute("userEmail").toString());
		UserCommon userCommon = new UserCommon();
		userCommon.setUserInfo(user, userObj);
		UserPhoto newUserPhoto = userPhotoService.findUserPhoto((Long) session.getAttribute("userId"));
		System.out.println(newUserPhoto.getUser_photo_path());
		System.out.println(newUserPhoto.getUser_photo_path());
		model.addAttribute("userPhoto", newUserPhoto);
		return "/user/userPhoto.jsp";
	}
}
