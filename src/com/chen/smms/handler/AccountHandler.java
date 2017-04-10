package com.chen.smms.handler;

import java.util.ArrayList;
import java.util.Date;
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

import com.chen.smms.entity.Account;
import com.chen.smms.entity.SupAcc;
import com.chen.smms.entity.Supplier;
import com.chen.smms.service.AccountService;
import com.chen.smms.service.SupplierService;
import com.sun.org.apache.bcel.internal.generic.SIPUSH;

@Controller
public class AccountHandler {
	
	@Autowired
	private AccountService accountService;
	@Autowired 
	private SupplierService supplierService;
	
	@RequestMapping(value = "/account/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id")Integer id){
		accountService.deleteAccount(id);
		return "redirect:/accounts";
	}
	
	@ModelAttribute
	public void getaccount(@RequestParam(value="id", required=false)Integer id, Map<String, Object> map){
		if(id != null){
			Account account = accountService.getAccount(id);
			account.setSupplier(null);
			map.put("account", account);
		}
		
	}
	@RequestMapping("/account-query")
	public String listQuery(@RequestParam(value="qName", required=false)String condition,
			HttpSession session){
		List<Account> accounts = accountService.querySuppliers(condition);
		session.setAttribute("accounts", accounts);
		return "queryaccount";
	}
//	@RequestMapping(value = "/account/{accountId}", method = RequestMethod.PUT)
//	public String update(Account account){
//		System.out.println("update");
//		accountService.saveAccount(account);
//		return "redirect:/accounts";
//	}
	@RequestMapping("/accountpre")
	public String preUpdate(@RequestParam(value="id",required=false)Integer id,HttpSession session) {
		Account account = accountService.getAccount(id);
		account.setSupplier(null);
		session.setAttribute("account", account);
		session.setAttribute("suppliers", supplierService.getAll());
		return "updateaccount";
	}
	@RequestMapping("/account-update")
	public String updateAccount(@RequestParam(value="flag",required=false)Integer supplierId, 
			@RequestParam(value="nums",required=false)int nums,
			@RequestParam(value="amount",required=false)double amount,
			@RequestParam(value="name",required=false)String name,
			@RequestParam(value="info",required=false)String info,
			@RequestParam(value="ispayed",required=false)Integer ispay,
			HttpSession session){
		
		Account account = (Account) session.getAttribute("account");
		account.setName(name);
		account.setSupplier(supplierService.getSupplier(supplierId));
		account.setAmount(amount);
		account.setInfo(info);
		if(ispay == 1) {
			account.setIspayed(true);
		}else {
			account.setIspayed(false);
		}
		account.setNums(nums);
		//account.setDate(new Date());
		accountService.saveAccount(account);
		return "redirect:/accounts";
	}
	@RequestMapping(value = "/account/{id}", method = RequestMethod.GET)
	public String input(@PathVariable("id")Integer id, Map<String, Object> map){
		Account account = accountService.getAccount(id);
		map.put("account", account);
		map.put("suppliers", supplierService.getAll());
		return "inputaccount";
	}
	
//	@RequestMapping(value = "/account", method = RequestMethod.POST)
//	public String save(Account account){
//		System.out.println("save");
//		accountService.saveAccount(account);
//		return "redirect:/accounts";
//	}
	
	@RequestMapping("/accountpreadd")
	public String preAccount(HttpSession session) {
		session.setAttribute("suppliers", supplierService.getAll());
		return "addaccount";
	}
	@RequestMapping("/account-add")
	public String addQuestion(@RequestParam(value="flag",required=false)Integer supplierId, 
			@RequestParam(value="nums",required=false)int nums,
			@RequestParam(value="amount",required=false)double amount,
			@RequestParam(value="name",required=false)String name,
			@RequestParam(value="info",required=false)String info,
			@RequestParam(value="ispayed",required=false)Integer ispay,
			HttpSession session){
		
		Account account = new Account();
		account.setName(name);
		account.setSupplier(supplierService.getSupplier(supplierId));
		account.setAmount(amount);
		account.setInfo(info);
		if(ispay == 1) {
			account.setIspayed(true);
		}else {
			account.setIspayed(false);
		}
		account.setNums(nums);
		account.setDate(new Date());
		accountService.saveAccount(account);
		return "redirect:/accounts";
	}
	@ResponseBody
	@RequestMapping(value = "/account-validateName", method = RequestMethod.POST)
	public String validateLastName(@RequestParam(value = "name", required = true)String name){
		Account account = accountService.findAccountByName(name);
		if(account != null){
			return "1";
		}
		return "0";
	}
	
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String input(Map<String,Object> map){
		map.put("suppliers", supplierService.getAll());
		map.put("account", new Account());
		return "inputaccount";
	}
	
	@RequestMapping("/accounts")
	public String list(@RequestParam(value = "pageNo", required = false, defaultValue = "1")String pageNoStr, Map<String,Object> map){
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
		Page<Account> page = accountService.getPage(pageNo, 5);
		map.put("page", page);
		return "listaccount";
	}
	
	@RequestMapping("/goods")
	public String listGoods(@RequestParam(value = "pageNo", required = false, defaultValue = "1")String pageNoStr, Map<String,Object> map
			,HttpSession session){
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
		Page<Account> page = accountService.getPage(pageNo, 5);
		map.put("page", page);
		session.setAttribute("suppliers", supplierService.getAll());
		return "listgoods";
	}
	
	@RequestMapping("/sups-div")
	public String listSup(HttpSession session) {
		List<Supplier> suppliers = supplierService.getAll();
		List<SupAcc> supAccs = new ArrayList<>();
		for(Supplier s : suppliers) {
			SupAcc sa = new SupAcc();
			sa.setId(s.getId());
			sa.setSupName(s.getSupplierName());
			sa.setAccAll(accountService.getAmountAll(s));
			sa.setNumAll(accountService.getNumsAll(s));
			sa.setTypes(accountService.getTypesAll(s));
			System.out.println(sa);
			supAccs.add(sa);
		}
		System.out.println(supAccs);
		session.setAttribute("supAccs", supAccs);
		return "listsupacc";
	}

}
