package org.application.fms.bean.vo;

import java.util.Date;
import java.util.List;

public class DocumentVO {
	private int serial;
	private int type;
	private String title;
	private String content;
	private String remark;
	private Date date;
	private String dateTime;
	private Long signatory;
	private String sendName;
	private int from;
	private String fromStr;
	private int to;
	private List<Integer> toList;
	private String toListStr; 
	private String toStr;
	private int crypticClass;
	private String crypticClassStr;
	private String applyScope;
	private String imageFile;
	private String attachment;
	private String fileNo;
	private String filePassword;
	private String imageFileName;
	private String attachmentName;
	private int inputType;
	private String inputStr;
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Long getSignatory() {
		return signatory;
	}
	public void setSignatory(Long signatory) {
		this.signatory = signatory;
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
	public int getCrypticClass() {
		return crypticClass;
	}
	public void setCrypticClass(int crypticClass) {
		this.crypticClass = crypticClass;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getFilePassword() {
		return filePassword;
	}
	public void setFilePassword(String filePassword) {
		this.filePassword = filePassword;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getAttachmentName() {
		return attachmentName;
	}
	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}
	public int getInputType() {
		return inputType;
	}
	public void setInputType(int inputType) {
		this.inputType = inputType;
	}
	public String getSendName() {
		return sendName;
	}
	public void setSendName(String sendName) {
		this.sendName = sendName;
	}
	public String getFromStr() {
		return fromStr;
	}
	public void setFromStr(String fromStr) {
		this.fromStr = fromStr;
	}
	public String getToStr() {
		return toStr;
	}
	public void setToStr(String toStr) {
		this.toStr = toStr;
	}
	public String getCrypticClassStr() {
		return crypticClassStr;
	}
	public void setCrypticClassStr(String crypticClassStr) {
		this.crypticClassStr = crypticClassStr;
	}
	public String getInputStr() {
		return inputStr;
	}
	public void setInputStr(String inputStr) {
		this.inputStr = inputStr;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public void setApplyScope(String applyScope) {
		this.applyScope = applyScope;
	}
	public String getApplyScope() {
		return applyScope;
	}
	public List<Integer> getToList() {
		return toList;
	}
	public void setToList(List<Integer> toList) {
		this.toList = toList;
	}
	public String getToListStr() {
		return toListStr;
	}
	public void setToListStr(String toListStr) {
		this.toListStr = toListStr;
	}
	
	
}
