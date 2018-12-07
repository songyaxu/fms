package org.application.fms.bean;

public class User {
	private long serial;
	private int typeId;
	private String userType;
	private String account;
	private String password;
	private int power;
	private String gender;
	private String politicsCharacter;
	private String email;
	private String name;
	public long getSerial() {
		return serial;
	}
	public void setSerial(long serial) {
		this.serial = serial;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPoliticsCharacter() {
		return politicsCharacter;
	}
	public void setPoliticsCharacter(String politicsCharacter) {
		this.politicsCharacter = politicsCharacter;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
}
