package com.chen.smms.test;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.sql.DataSource;

import org.hibernate.ejb.QueryHints;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chen.smms.entity.Supplier;
import com.chen.smms.repository.AccountRepository;
import com.chen.smms.repository.SupplierRepository;

public class TestSSSP {

	private	ApplicationContext ctx=null;
	private AccountRepository accountRepository;
	private EntityManagerFactory entityManagerFactory;
	private SupplierRepository supplierRepository;
	{
		ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		accountRepository=ctx.getBean(AccountRepository.class);
		supplierRepository=ctx.getBean(SupplierRepository.class);
		entityManagerFactory=ctx.getBean(EntityManagerFactory.class);
	}
	@Test
	public void test() throws SQLException {
		DataSource dataSource=ctx.getBean(DataSource.class);
		System.out.println(dataSource.getConnection());
	}
	@Test
	public void testRepositoryQuery(){
		List<Supplier> suppliers = supplierRepository.findAll();
		for(Supplier s : suppliers) {
			int a = (int) accountRepository.queryAllTypes(s);
			System.out.println(a);
		}
	
	}
}
