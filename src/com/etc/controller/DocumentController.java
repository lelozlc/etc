package com.etc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.etc.model.Document;
import com.etc.service.DocumentService;
import com.etc.util.Page;

@Controller
@RequestMapping("/document")
public class DocumentController {
	@Autowired
	@Qualifier("documentService")
	private DocumentService documentService;
	
	//添加文件
	@RequestMapping("/documentAdd.do")
	public String documentAdd(Document document,MultipartFile file,HttpServletRequest request)throws Exception{
		System.out.println(document.getTitle());
		System.out.println("获取文件类型"+file.getContentType());
		System.out.println("获取文件name标签"+file.getName());
		System.out.println("获取上传文件的名称"+file.getOriginalFilename());
		//获取上传文件路径
		ServletContext context=request.getServletContext();
		//获取绝对路径
		String realPath=context.getRealPath("/upload");
		//上传时文件名称
		String filename=file.getOriginalFilename();
		filename=UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(filename);
		File f=new File(realPath,filename);
		//将文件存储到指定位置
		file.transferTo(f);
		document.setFilename(filename);
		if(documentService.addDocument(document)){
			return "redirect:showAddDocument.jsp?msg=1";
		}else {
			return "redirect:showAddDocument.jsp?msg=2";
		}
	}
//	
	
	@RequestMapping("/documentSearch.do")
	public ModelAndView documentSearch(Document document,Page page){
		ModelAndView mv=new ModelAndView("document/document");
		List<Document> documentlist=documentService.documentSearchByPage(document,page);
		mv.addObject("documentlist",documentlist);
		return mv;
	}
	
	@RequestMapping("/documentUpdate.do")
	public String documentUpdate(Document document,MultipartFile file,HttpServletRequest request)throws Exception{
		System.out.println(document.getTitle());
		System.out.println("获取文件类型"+file.getContentType());
		System.out.println("获取文件name标签"+file.getName());
		System.out.println("获取上传文件的名称"+file.getOriginalFilename());
		//获取上传文件路径
		ServletContext context=request.getServletContext();
		//获取绝对路径
		String realPath=context.getRealPath("/upload");
		//上传时文件名称
		String filename=file.getOriginalFilename();
		filename=UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(filename);
		File f=new File(realPath,filename);
		//将文件存储到指定位置
		file.transferTo(f);
		document.setFilename(filename);
		if(documentService.updateDocument(document)){
			return "redirect:documentSearch.do?msg=1&currentPage=1";
		}
		return "showUpdateDocument";
	}
	
	@RequestMapping("/removeDocument.do")
	public String deleteDocument(String ids){
		if(documentService.deleteDocument(ids)){
			return "redirect:documentSearch.do?msg=2&currentPage=1";
		}
		return "redirect:documentSearch.do?msg=3&currentPage=1";
	}
    //文件下载
	@RequestMapping("/documentDown.do")
	public ResponseEntity<byte[]> download(HttpServletRequest request,String filename)throws IOException{
		System.out.println("文件名为："+filename);
		String realpath=request.getServletContext().getRealPath("/upload");
		File file=new File(realpath,filename);
		//设置头信息
		HttpHeaders headers=new HttpHeaders();
		String downloadFileName=new String(filename.getBytes("UTF-8"),"iso-8859-1");
		headers.setContentDispositionFormData("attachment", downloadFileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new  ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
	}



}
