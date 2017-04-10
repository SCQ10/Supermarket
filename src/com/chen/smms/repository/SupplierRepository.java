package com.chen.smms.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

import com.chen.smms.entity.Supplier;
import com.chen.smms.entity.User;

public interface SupplierRepository extends JpaRepository<Supplier, Integer>{
	
	Supplier getBySupplierName(String supplierName);
	
	@QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
	@Query("FROM Supplier s")
	List<Supplier> getAll();
	@Query("SELECT s FROM Supplier s WHERE s.supplierName LIKE %?1%")
	List<Supplier> queryAllSupplierByCondition(String condition);
}
