package com.etc.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.etc.model.Dept;
import com.etc.model.Employee;
import com.etc.model.Job;
import com.etc.service.EmployeeService;
import com.etc.util.Page;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	@Qualifier("employeeService")
	private EmployeeService employeeService;
	

	@RequestMapping("/addEmployee.do")
	public String AddEmployee(Employee employee,Model model){
		
		if(employeeService.addEmployee(employee)){
			model.addAttribute("msg", "添加成功");
			return "employee/showAddEmployee";
		}else {
			model.addAttribute("msg", "添加失败");
			return "employee/showAddEmployee";
		}
	}
	
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	@RequestMapping("/employeeSearch.do")
	public ModelAndView employeeSeacher(Employee employee,Page page,Model model){
		model.addAttribute("lastemployee", employee);
		ModelAndView mv=new ModelAndView("employee/employee");
		List<Employee> employeelist=employeeService.getEmployeeListByPage(employee,page);
		
		List<Job> jobList=employeeService.getJobList();
		List<Dept> deptList=employeeService.getDeptList();
		mv.addObject("employeelist",employeelist);
		mv.addObject("jobList", jobList);
		mv.addObject("deptList",deptList);
		return mv;
	}
	
	@RequestMapping("/deleteEmployee.do")
	public String employeeDelete(String ids){
		if(employeeService.deleteemployee(ids)){
			return "redirect:employee.jsp";
		}
		return "employee/employee";
	}
	
	@RequestMapping("/employeeUpdate.do")
	public String employeeUpdate(Employee employee){
		if(employeeService.updateEmployee(employee)){
			return "redirect:employeeSearch.do?currentPage=1&job.id=0&name=&cardId=&sex=0&phone=&dept.id=0&msg=2";
		}
		return "redirect:showUpdateEmployee.jsp?msg=1";
	}
	
	@RequestMapping("/searchEmployeeById.do")
	public String searchEmployeeById(Employee employee,Model model){
		Employee getemployee= employeeService.searchEmployeeById(employee);
		List<Job> jobList=employeeService.getJobList();
		List<Dept> deptList=employeeService.getDeptList();
		model.addAttribute("jobList", jobList);
		model.addAttribute("deptList",deptList);
		model.addAttribute("getemployee",getemployee);
        return "employee/showUpdateEmployee";
		
	}
	
	
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView ExceptionHander(Exception exception){
		ModelAndView mv=new ModelAndView("employee/employee");
		mv.addObject("msg","1");
		return mv;
	}


}
