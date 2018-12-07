package org.application.fms.service.impl;

import java.util.List;

import org.application.fms.bean.Page;
import org.application.fms.bean.User;
import org.application.fms.mapper.UserMapper;
import org.application.fms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	@Override
	public User login(User u) {
		return this.userMapper.getUserByAccountAndPassword(u);
	}
	@Override
	public User get(Long id) {
		return this.userMapper.get(id);
	}
	@Override
	public Integer add(User user) {
		return this.userMapper.add(user);
	}
	@Override
	public User getByAccount(String id) {
		return this.userMapper.getByAccount(id);
	}
	@Override
	public List<User> getList(Page page) {
		return this.userMapper.getList(page);
	}
	@Override
	public Integer getCount() {
		return this.userMapper.getCount();
	}
	
	
	
}
