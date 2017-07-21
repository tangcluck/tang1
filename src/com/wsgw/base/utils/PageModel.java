package com.wsgw.base.utils;

public class PageModel {
	private Integer first = 1;
	public Integer getFirst() {
		return first;
	}
	public void setFirst(Integer first) {
		this.first = first;
	}
	private Integer currentPage;
	private Integer size = 5;
	private Integer last;
	private Integer startIndex = 0;
	
	private String path;
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public Integer getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(Integer currInteger,Integer size) {
		startIndex = (currInteger-1) * size;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getLast() {
		return last;
	}
	public void setLast(Integer count) {
		last = (count + size -1)/size;
	}

	
	
}
