package org.application.fms.enums;

public enum InputTypeEnum {
	ENTER(1,"录入"),
	IMPORT(2,"导入");

    private int key;
    private String value;
    InputTypeEnum(int key, String value){
        this.key = key;
        this.value = value;
    }

    public static InputTypeEnum getEnumByCode(Integer key) {
        if(key == null){
            return ENTER;
        }
        for(InputTypeEnum e : InputTypeEnum.values()){
            if(e.getKey() == key.intValue()){
                return e;
            }
        }
        return ENTER;
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
