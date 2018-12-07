package org.application.fms.enums;

public enum CrypticClassEnum {
	SECRET(1,"绝密"),
	PRIVACY(2,"机密"),
	PUBLIC(3,"公开");

    private int key;
    private String value;

    CrypticClassEnum(int key, String value){
        this.key = key;
        this.value = value;
    }

    public static CrypticClassEnum getEnumByCode(Integer key) {
        if(key == null){
            return PUBLIC;
        }
        for(CrypticClassEnum e : CrypticClassEnum.values()){
            if(e.getKey() == key.intValue()){
                return e;
            }
        }
        return PUBLIC;
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
