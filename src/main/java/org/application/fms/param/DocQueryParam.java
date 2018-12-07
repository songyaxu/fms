package org.application.fms.param;

import java.util.Date;

import org.application.fms.bean.Page;

public class DocQueryParam {
	private Long sendId; //签发人
	private int level;   //部门类型
	private String keyWord; //关键字，可对content、remark、title进行检索
	private Page page; 
	private String datetime;
	private Date date;
	private int from;
	private int to;
	public Long getSendId() {
		return sendId;
	}
	public void setSendId(Long sendId) {
		this.sendId = sendId;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getTo() {
		return to;
	}
	public void setTo(int to) {
		this.to = to;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	
	
}
