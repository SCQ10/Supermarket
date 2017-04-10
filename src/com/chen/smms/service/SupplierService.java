package com.chen.smms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chen.smms.entity.Supplier;
import com.chen.smms.entity.User;
import com.chen.smms.repository.SupplierRepository;

@Service
public class SupplierService {
	
	@Autowired
	private SupplierRepository supplierRepository;
	
	@Transactional(readOnly=true)
	public List<Supplier> getAll(){
		return supplierRepository.getAll();
	}
	
	@Transactional
	public Supplier finySupplierByName(String name) {
		return supplierRepository.getBySupplierName(name);
	}
	@Transactional(readOnly = true)
	public Page<Supplier> getPage(int pageNo, int pageSize){
		PageRequest pageable = new PageRequest(pageNo-1, pageSize);
		return supplierRepository.findAll(pageable);
	}
	
	public void deleteSupplier(int id) {
		supplierRepository.delete(id);
	}
	
	@Transactional(readOnly = true)
	public Supplier getSupplier(Integer id){
		return supplierRepository.findOne(id);
	}
	
	@Transactional
	public void saveSupplier(Supplier supplier){
		if(supplier == null){
			
		}
		supplierRepository.saveAndFlush(supplier);
	}
	@Transactional(readOnly = true)
	public List<Supplier> querySuppliers(String condition){
		return supplierRepository.queryAllSupplierByCondition(condition);
	}

	
}
