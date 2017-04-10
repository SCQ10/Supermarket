package com.chen.smms.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.chen.smms.entity.Account;
import com.chen.smms.entity.SupAcc;
import com.chen.smms.entity.Supplier;
import com.chen.smms.entity.User;

public interface AccountRepository extends PagingAndSortingRepository<Account, Integer>{
	
	Account getByName(String name);
	@Query("SELECT a FROM Account a WHERE a.name LIKE %?1%")
	List<Account> queryAllAccountByCondition(String condition);
	
	@Query("SELECT sum(nums) FROM Account a WHERE a.supplier = ?1")
	int queryAllNums(Supplier s);
	@Query("SELECT count(id) FROM Account a WHERE a.supplier = ?1")
	long queryAllTypes(Supplier s);
	@Query("SELECT sum(amount) FROM Account a WHERE a.supplier = ?1")
	double queryAllAmounts(Supplier s);
	
}
