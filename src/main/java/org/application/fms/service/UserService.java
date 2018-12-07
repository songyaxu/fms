package org.application.fms.service;

import java.util.List;

import org.application.fms.bean.Page;
import org.application.fms.bean.User;

public interface UserService {
	
	User login(User u);
	
	User get(Long id);
	
	Integer add(User user);
	
	User getByAccount(String id);
	
	List<User> getList(Page page);
	
	Integer getCount();
}
