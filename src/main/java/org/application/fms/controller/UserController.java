package org.application.fms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.application.fms.bean.Page;
import org.application.fms.bean.Result;
import org.application.fms.bean.User;
import org.application.fms.enums.GenderEnum;
import org.application.fms.enums.UserTypeEnum;
import org.application.fms.service.UserService;
import org.application.fms.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("login")
	public Result login(User u,HttpSession session) {
		User res = userService.login(u);
		if(res!=null)
		{
			res.setUserType(UserTypeEnum.getEnumByCode(res.getTypeId()).getValue());
			session.setAttribute("user", res);
			return Result.success("登录成功");
		}
		return Result.failure("用户名或密码错误");
	}
	
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("info/{id}")
	public String info(@PathVariable("id") Long id,HttpServletRequest req) {
		User u = userService.get(id);
		u.setUserType(UserTypeEnum.getEnumByCode(u.getTypeId()).getValue());
		req.setAttribute("userinfo", u);
		return "user/info";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}
	@RequestMapping("init")
	public String init(){
		return "user/add"; 
	}
	@ResponseBody
	@RequestMapping("save")
	public Result save(User user) {
		if(user.getPassword()==null||"".equals(user.getPassword()))
			user.setPassword(user.getAccount());
		user.setGender(GenderEnum.getEnumByCode(Integer.valueOf(user.getGender()==null?"0":user.getGender())).getValue());
		User u = userService.getByAccount(user.getAccount());
		if(u!=null)
		{
			return Result.failure("该用户名已被注册");
		}
		int res = userService.add(user);
		if(res>=1)
			return Result.success("添加成功");
		return Result.failure("添加失败");
	}
	
	@RequestMapping("list/{pageNo}")
	public String list(@PathVariable("pageNo") int pageNo,HttpSession session) {
		Integer total =0;
		total=userService.getCount();
		Page page = new Page();
		page=PageUtil.createPage(10, total, pageNo);
		List<User> userList=userService.getList(page);
		for(User u: userList)
		{
			u.setUserType(UserTypeEnum.getEnumByCode(u.getTypeId()).getValue());
		}
		session.setAttribute("uList", userList);
		session.setAttribute("page", page);
		return "user/list";
	}
}
