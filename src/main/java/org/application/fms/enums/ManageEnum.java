package org.application.fms.enums;

public enum ManageEnum {
	ENABLE(1,"拥有权限"),
	DISABLE(0,"没有权限");

    private int key;
    private String value;
    ManageEnum(int key, String value){
        this.key = key;
        this.value = value;
    }

    public static ManageEnum getEnumByCode(Integer key) {
        if(key == null){
            return DISABLE;
        }
        for(ManageEnum e : ManageEnum.values()){
            if(e.getKey() == key.intValue()){
                return e;
            }
        }
        return DISABLE;
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
