package com.skcc.summerCamp.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skcc.summerCamp.admin.service.AdminService;
import com.skcc.summerCamp.models.AdminInfo;
import com.skcc.summerCamp.models.User;
import com.skcc.summerCamp.user.service.UserService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/admin")
	public String adminLogin(@ModelAttribute("adminObj") AdminInfo adminInfo) {
		return "/admin/adminLogin.jsp";
	}
	@PostMapping("/adminRegister")
	public String adminRegister(@ModelAttribute("adminObj") AdminInfo adminInfo,
							HttpSession session,
							Model model) {
		AdminInfo newAdminInfo = adminService.createAdmin(adminInfo);
		session.setAttribute("user_name", newAdminInfo.getAdmin_username());
		List<User> userList = userService.findAllUser();
		model.addAttribute("userList", userList);
		return "/admin/admin.jsp";
	}
	//admin login function
	@PostMapping("/adminLogin")
	public String adminLogin(@ModelAttribute("adminObj") AdminInfo adminInfo,
							HttpSession session,
							Model model) {
		boolean check = adminService.authenticateUser(adminInfo.getAdmin_username(), adminInfo.getAdmin_password());
		if(check) {
			session.setAttribute("username", adminInfo.getAdmin_username());
			model.addAttribute("username", adminInfo.getAdmin_username());
			List<User> userList = userService.findAllUser();
			model.addAttribute("userList", userList);
			return "/admin/admin.jsp";
		}
		else {
			System.out.println(22222);
			return "/admin/adminLogin.jsp";
		}
	}
}
