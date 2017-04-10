package com.chen.smms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chen.smms.entity.User;
import com.chen.smms.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public User finyUserByName(String name) {
		return userRepository.getByName(name);
	}
	
	@Transactional
	public User checkUser(String name, String password,
			boolean hasJurisdiction) {
		return userRepository.checkUser(name, password, hasJurisdiction);
	}
	
	@Transactional(readOnly = true)
	public Page<User> getPage(int pageNo, int pageSize) {
		PageRequest pageable = new PageRequest(pageNo-1, pageSize);
		return userRepository.findAll(pageable);
	}
	public void deleteUser(int id) {
		userRepository.delete(id);
	}
	
	@Transactional(readOnly = true)
	public User getUser(Integer id){
		return userRepository.findOne(id);
	}
	@Transactional(readOnly = true)
	public List<User> queryUsers(String condition){
		return userRepository.queryAllUsersByCondition(condition);
	}
	@Transactional
	public void saveUser(User user){
		if(user.getId() == null){

		}
		userRepository.save(user);
	}

}
