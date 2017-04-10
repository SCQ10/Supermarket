package com.chen.smms.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chen.smms.entity.Account;
import com.chen.smms.entity.SupAcc;
import com.chen.smms.entity.Supplier;
import com.chen.smms.repository.AccountRepository;

@Service
public class AccountService {
	
	@Autowired
	private AccountRepository accountRepository;
//	@Autowired
//	private SupAccRepository accRepository;
	@Transactional
	public Account findAccountByName(String name) {
		return accountRepository.getByName(name);
	}
	@Transactional(readOnly = true)
	public Page<Account> getPage(int pageNo, int pageSize){
		PageRequest pageable = new PageRequest(pageNo-1, pageSize);
		return accountRepository.findAll(pageable);
	}
	public void deleteAccount(int id) {
		accountRepository.delete(id);
	}
	
	@Transactional(readOnly = true)
	public Account getAccount(Integer id){
		return accountRepository.findOne(id);
	}
	
	@Transactional
	public void saveAccount(Account account){
		if(account == null){
			
		}
		accountRepository.save(account);
	}
	@Transactional(readOnly = true)
	public List<Account> querySuppliers(String condition){
		return accountRepository.queryAllAccountByCondition(condition);
	}
	
	public double getAmountAll(Supplier s) {
		return accountRepository.queryAllAmounts(s);
	}

	public int getNumsAll(Supplier s) {
		return accountRepository.queryAllNums(s);
	}

	public int getTypesAll(Supplier s) {
		return (int) accountRepository.queryAllTypes(s);
	}
}
