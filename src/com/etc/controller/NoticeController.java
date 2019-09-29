package com.etc.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.etc.model.Notice;
import com.etc.service.NoticeService;
import com.etc.util.Page;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;
	
	
	@RequestMapping("/noticeAdd.do")
	public String AddNotice(Notice notice){
		if(noticeService.addNotice(notice)){
			return "notice/showAddNotice";
		}else {
			return "notice/showAddNotice";
		}
	}
	
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	@RequestMapping("/noticeSearch.do")
	public ModelAndView noticeSearch(Notice notice,Page page){
		ModelAndView mv=new ModelAndView("notice/notice");
		List<Notice> noticelist=noticeService.getNoticeListByPage(notice,page);
		mv.addObject("noticelist",noticelist);
		return mv;
	}
	
	@RequestMapping("/removeNotice.do")
	public String EoticeDelet(String ids){
		if(noticeService.deleteNotice(ids)){
			return "redirect:noticeSearch.do?msg=1&currentPage=1";
		}
		return "redirect:noticeSearch.do?msg=2&currentPage=1";
	}
	
	@RequestMapping("/noticeUpdate.do")
	public String noticeUpdate(Notice notice){
		if(noticeService.updateNotice(notice)){
			return "redirect:noticeSearch.do?msg=3&currentPage=1";
		}
		return "redirect:showUpdateNotice.jsp?msg=1";
	}
//	
//	@RequestMapping("/deleteEmployee.do")
//	public String employeeDelete(String ids){
//		if(noticeService.deleteemployee(ids)){
//			return "redirect:employee.jsp";
//		}
//		return "employee/employee";
//	}
//	
//	@RequestMapping("/employeeUpdate.do")
//	public String employeeUpdate(Employee employee){
//		if(noticeService.updateEmployee(employee)){
//			return "redirect:employeeSearch.do?currentPage=1&job.id=0&name=&cardId=&sex=0&phone=&dept.id=0&msg=2";
//		}
//		return "redirect:showUpdateEmployee.jsp?msg=1";
//	}
//	
//	@RequestMapping("/searchEmployeeById.do")
//	public String searchEmployeeById(Employee employee,Model model){
//		Employee getemployee= noticeService.searchEmployeeById(employee);
//		List<Job> jobList=noticeService.getJobList();
//		List<Dept> deptList=noticeService.getDeptList();
//		model.addAttribute("jobList", jobList);
//		model.addAttribute("deptList",deptList);
//		model.addAttribute("getemployee",getemployee);
//        return "employee/showUpdateEmployee";
//		
//	}
//	
//	
//	@ExceptionHandler(RuntimeException.class)
//	public ModelAndView ExceptionHander(Exception exception){
//		ModelAndView mv=new ModelAndView("employee/employee");
//		mv.addObject("msg","1");
//		return mv;
//	}


}
