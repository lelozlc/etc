package com.etc.util;

public class Page {
	private int total=0;
	private int pageSize=5;
	private int totalPage=0;
	private int currentPage=0;
	private int start=0;
	private int end=0;
	private String pageStr="";
	
	public void count(){
		totalPage=(total%pageSize>0)?(total/pageSize+1):(total/pageSize);
		if(currentPage>totalPage){
			currentPage=totalPage;
		}
		if(currentPage<1){
			currentPage=1;
		}
		//查询的起始和结束
		start=(currentPage-1)*pageSize;
		end=(currentPage<totalPage)?(start+pageSize):(total);
		
		if(totalPage<=5){
			for(int i=1;i<=totalPage;i++){
				pageStr=pageStr+i+",";
			}
		}else if(currentPage<=3){
			for(int i=1;i<5;i++){
				pageStr=pageStr+i+",";
			}
		}else {
			for(int i=currentPage-2;i<=currentPage+2;i++){
				pageStr=pageStr+i+",";
			}
		}
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
		count();
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	public String getPageStr() {
		return pageStr;
	}

	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}

	

}
