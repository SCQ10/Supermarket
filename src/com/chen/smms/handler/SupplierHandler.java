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

import com.chen.smms.entity.Supplier;
import com.chen.smms.entity.User;
import com.chen.smms.service.SupplierService;

@Controller
public class SupplierHandler {

	@Autowired
	private SupplierService supplierService;
	
	@ResponseBody
	@RequestMapping("/supplier-validateName")
	public String querySupplierByName(@RequestParam(value="name",required=false) String name) {
		if(supplierService.finySupplierByName(name) != null) {
			return "1";
		}
		return "0";
	}
	@RequestMapping("/supplier-query")
	public String listQuery(@RequestParam(value="qName", required=false)String condition,
			HttpSession session){
		System.out.println(111);
		List<Supplier> suppliers = supplierService.querySuppliers(condition);
		System.out.println(suppliers.toString());
		session.setAttribute("suppliers", suppliers);
		return "querysupplier";
	}
	@RequestMapping("/suppliers")
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
		Page<Supplier> page = supplierService.getPage(pageNo, 5);
		map.put("page", page);
		return "listsupplier";
	}
	
	@RequestMapping(value = "/supplier/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id")Integer id){
		supplierService.deleteSupplier(id);
		return "redirect:/suppliers";
	}
	
	@ModelAttribute
	public void getsupplier(@RequestParam(value="id", required = false)Integer id, Map<String,Object>map){
		if(id != null){
			Supplier supplier = supplierService.getSupplier(id);
			map.put("supplier", supplier);
		}
	}
	
	@RequestMapping(value="/supplier/{id}",method=RequestMethod.PUT)
	public String update(Supplier supplier){
		supplierService.saveSupplier(supplier);
		return "redirect:/suppliers";
	}
	@RequestMapping(value="/supplier/{id}",method=RequestMethod.GET)
	public String input(@PathVariable("id")Integer id, Map<String,Object>map){
		Supplier supplier = supplierService.getSupplier(id);
		map.put("supplier", supplier);
		return "inputsupplier";
	}
	@RequestMapping(value="/supplier",method=RequestMethod.POST)
	public String save(Supplier supplier){
		supplierService.saveSupplier(supplier);
		return "redirect:/suppliers";
	}
	
	@RequestMapping(value="/supplier",method=RequestMethod.GET)
	public String input(Map<String,Object>map){
		map.put("supplier", new Supplier());
		return "inputsupplier";
	}
}
