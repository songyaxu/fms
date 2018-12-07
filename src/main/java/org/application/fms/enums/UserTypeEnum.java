package org.application.fms.enums;

public enum UserTypeEnum {
	UNKNOW(0,"-"),
	COLLEGE(1,"学院党总支"),
	BRANCHOFTEACHERONE(2,"教工一支部"),
	BRANCHOFTEACHERTWO(3,"教工二支部"),
    POSTGRADUATE(4,"研究生支部"),
    UNDERGRADUATE(5,"本科生支部"),
    UNIVERSITY(6,"学校党总支");

    private int key;
    private String value;

    UserTypeEnum(int key, String value){
        this.key = key;
        this.value = value;
    }

    public static UserTypeEnum getEnumByCode(Integer key) {
        if(key == null){
            return UNKNOW;
        }
        for(UserTypeEnum e : UserTypeEnum.values()){
            if(e.getKey() == key.intValue()){
                return e;
            }
        }
        return UNKNOW;
    }

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
