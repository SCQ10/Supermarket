package com.chen.smms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.chen.smms.entity.User;

public interface UserRepository extends PagingAndSortingRepository<User,Integer>{
	
	User getByName(String name);
	@Query("SELECT u FROM User u WHERE u.name = ? and u.password = ? and u.hasJurisdiction = ?")
	User checkUser(String name,String password, boolean hasJurisdiction);
	@Query("SELECT u FROM User u WHERE u.name LIKE %?1%")
	List<User> queryAllUsersByCondition(String condition);
}
