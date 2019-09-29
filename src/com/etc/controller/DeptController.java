package com.etc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.etc.model.Dept;
import com.etc.service.DeptService;
import com.etc.util.Page;

@Controller
@RequestMapping("/dept")
public class DeptController {
	@Autowired
	@Qualifier("deptService")
	private DeptService deptService;
	
	@RequestMapping("/deptSearch.do")
	public ModelAndView deptSearch(Dept dept,Page page,Model model){
		model.addAttribute("name", dept.getName());
		ModelAndView mv=new ModelAndView("dept/dept");
		List<Dept> deptlist=deptService.getUserListByPage(dept,page);
		mv.addObject("deptlist",deptlist);
		return mv;
		
	}
	
	@RequestMapping("/addDept.do")
	public String addDept(Dept dept,Model model){
		if(deptService.addDept(dept)){
			model.addAttribute("msg", "添加成功");
			return "dept/showAddDept";
		}else {
			model.addAttribute("msg", "添加失败");
			return "dept/showAddDept";
		}
		
	}
	
	@RequestMapping("/deleteDept.do")
	public String deptDelete(String ids){
		if(deptService.deleteDept(ids)){
			return "redirect:/dept/deptSearch.do";
		}
		return "dept/dept";
	}
	
	@RequestMapping("/updateDept.do")
	public String updateDept(Dept dept,Model model){
		if(deptService.updateDept(dept)){
			return "redirect:deptSearch.do";
		}else {
			model.addAttribute("msg", "修改失败");
			return "dept/showUpdateDept";
		}
	}

}
