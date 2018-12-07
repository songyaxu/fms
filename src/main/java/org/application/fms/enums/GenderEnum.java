package org.application.fms.enums;

public enum GenderEnum {
	UNKNOW(0,"-"),
	MALE(1,"男士"),
	FEMALE(2,"女士");

    private int key;
    private String value;
    GenderEnum(int key, String value){
        this.key = key;
        this.value = value;
    }

    public static GenderEnum getEnumByCode(Integer key) {
        if(key == null){
            return UNKNOW;
        }
        for(GenderEnum e : GenderEnum.values()){
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
