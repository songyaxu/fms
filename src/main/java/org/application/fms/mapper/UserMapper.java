package org.application.fms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.application.fms.bean.Page;
import org.application.fms.bean.User;

public interface UserMapper {
	User getUserByAccountAndPassword(@Param("u") User u);
	
	User get(Long id);
	
	Integer add(@Param("u") User user);
	
	User getByAccount(String id);
	
	List<User> getList(@Param("page") Page page);
	
	Integer getCount();
}
