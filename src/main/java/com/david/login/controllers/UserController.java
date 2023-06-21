package com.david.login.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.david.login.models.LoginUser;
import com.david.login.models.User;
import com.david.login.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/")
	public String renderRegForm(Model model ) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		
		
		return "index.jsp";
		
	}
	
	@PostMapping("/register")
	public String processRegister(
			@Valid @ModelAttribute("newUser")User newUser,
			BindingResult result, Model model, HttpSession session) {
		User registeredUser = userService.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
			
		} else {
			session.setAttribute("userId", registeredUser.getId());
        //	Optional session
			session.setAttribute("userName", registeredUser.getUserName());
			
			return "redirect:/"; 
		}
	}
	
	@PostMapping("/login")
	public String processLogin(
			@Valid @ModelAttribute("newLogin")LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {
		User loginUser = userService.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
			
		} else {
			session.setAttribute("userId", loginUser.getId());
		 //	Optional session
			session.setAttribute("userName", loginUser.getUserName());
			
			return "redirect:/welcome";
		}
	}
	
	
	@GetMapping("/welcome")
	public String dashboard(HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		return "dashboard.jsp";
	}
	
	
	@GetMapping("/logout")
	public String logoutDashboard(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
	
 
}
