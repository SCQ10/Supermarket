package com.chen.smms.handler;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chen.smms.entity.User;
import com.chen.smms.service.UserService;

@Controller
public class UserHandler {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/user-validateName")
	public String queryUserByName(@RequestParam(value="name",required=false) String name) {
		if(userService.finyUserByName(name) != null) {
			return "1";
		}
		return "0";
	}
	
	@RequestMapping("/user-query")
	public String listQuery(@RequestParam(value="qName", required=false)String condition,
			HttpSession session){
		List<User> users = userService.queryUsers(condition);
		session.setAttribute("users", users);
		return "queryuser";
	}
	
	@ResponseBody
	@RequestMapping("/user-validatePassword")
	public String checkUser(@RequestParam(value="name",required=false) String name, 
			@RequestParam(value="password",required=false) String password,
			@RequestParam(value="hasJurisdiction",required=false) boolean hasJurisdiction,
			HttpSession session) {
		User user = userService.checkUser(name, password, hasJurisdiction);
		if(user != null) {
			session.setAttribute("user", user);
			return "1";
		}else {
			return "0";
		}
		
	}
	@RequestMapping("/users")
	public String list(@RequestParam(value="pageNo", required=false, defaultValue="1")String pageNoStr,
			Map<String,Object>map){
		int pageNo = 1;
		try {
			//对pageNo的校验
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		Page<User> page = userService.getPage(pageNo, 5);
		map.put("page", page);
		return "listuser";
	}
	
	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id")Integer id){
		userService.deleteUser(id);
		return "redirect:/users";
	}
	
	@ModelAttribute
	public void getUser(@RequestParam(value="id", required = false)Integer id, Map<String,Object>map){
		if(id != null){
			User user = userService.getUser(id);
			map.put("user", user);
		}
	}
	
	@RequestMapping(value="/user/{id}",method=RequestMethod.PUT)
	public String update(User user){
		userService.saveUser(user);
		return "redirect:/users";
	}
	@RequestMapping(value="/user/{id}",method=RequestMethod.GET)
	public String input(@PathVariable("id")Integer id, Map<String,Object>map){
		User user = userService.getUser(id);
		map.put("user", user);
		return "inputuser";
	}
	@RequestMapping(value="/user",method=RequestMethod.POST)
	public String save(User user){
		userService.saveUser(user);
		return "redirect:/users";
	}
	
	@RequestMapping(value="/user",method=RequestMethod.GET)
	public String input(Map<String,Object>map){
		map.put("user", new User());
		return "inputuser";
	}
	
	@RequestMapping("/user-login")
	public String login() {
		return "index";
	}
	
	@RequestMapping("/user-exit")
	public String exit() {
		return "login";
	}
	@RequestMapping("/user-main")
	public String relogin() {
		return "login";
	}
}
