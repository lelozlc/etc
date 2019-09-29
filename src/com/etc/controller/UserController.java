package com.etc.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.etc.model.User;
import com.etc.service.UserService;
import com.etc.util.MD5Util;
import com.etc.util.Page;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	/*登录*/
	@RequestMapping("/login.do")
	public String login(User user,Model model,HttpSession session){
		user.setPassword(MD5Util.StringInMd5(user.getPassword()));
		User loginUser=userService.getUser(user);
		if(loginUser!=null){
			session.setAttribute("sess_user", loginUser);
			return "main";
		}
		model.addAttribute("error","用户名或密码错误");
		return "loginForm";
	}
	
	//查询
	@RequestMapping("/userSeacher.do")
	public ModelAndView userSeacher(User user,Page page,Model model){
		model.addAttribute("username",user.getUsername());
		model.addAttribute("status", user.getStatus());
		ModelAndView mv=new ModelAndView("user/user");
		List<User> userList=userService.getUserListByPage(user,page);
		mv.addObject("uList",userList);
		return mv;
	}
	//添加用户
	@RequestMapping("/addUser.do")
	@ResponseBody
	public Map<String, String> addUser(User user){
		Map<String, String> map=new HashMap<>();
		user.setPassword(MD5Util.StringInMd5(user.getPassword()));
		if(userService.addUser(user)){
			map.put("code", "1001");
			map.put("msg", "添加成功");
		}else {
			map.put("code", "1002");
			map.put("msg", "添加失败");
		}
		return map;
	}
	//修改用户信息
	@RequestMapping("/updateUser.do")
	public String userUpdate(User user){
		if(userService.updateUser(user)){
			return "redirect:/user/userSeacher.do";
		}
		
		return "user/showUpdateUser";
	}
	
	//删除
	@RequestMapping("userDelete.do")
	public String userDelete(String ids){
		if(userService.deleteUser(ids)){
			return "redirect:/user/userSeacher.do";
		}
		return "user/user";
	}
	
	
	
	
	
	
	

}
