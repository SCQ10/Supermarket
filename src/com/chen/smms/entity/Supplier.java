package com.chen.smms.entity;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Cacheable
@Table(name="SSSP_SUPPLIER")
@Entity
public class Supplier
{
	private Integer id; 			 // 供应商编号
    private String supplierName; 		 // 供应商名称
    private String info;		 // 供应商描述
	private String linkman; 	 // 联系人
	private String linkPhone;	 // 联系人电话
	private String linkAddress; // 联系人地址
   
    
    public Supplier()
    {
    }
    
    public Supplier(Integer id)
    {
        this.id = id;
    }
    
    public Supplier(Integer id, String supplierName, String info, String linkman, String linkPhone, String linkAddress)
    {
        this.id = id;
        this.supplierName = supplierName;
        this.info = info;
        this.linkman = linkman;
        this.linkPhone = linkPhone;
        this.linkAddress = linkAddress;
    }
    @GeneratedValue
	@Id
    public Integer getId()
    {
        return id;
    }
    
    public void setId(Integer id)
    {
        this.id = id;
    }
    
    public String getSupplierName()
    {
        return supplierName;
    }
    
    public void setSupplierName(String supplierName)
    {
        this.supplierName = supplierName;
    }
    
    public String getInfo()
    {
        return info;
    }
    
    public void setInfo(String info)
    {
        this.info = info;
    }
    
    public String getLinkman()
    {
        return linkman;
    }
    
    public void setLinkman(String linkman)
    {
        this.linkman = linkman;
    }
    
    public String getLinkPhone()
    {
        return linkPhone;
    }
    
    public void setLinkPhone(String linkPhone)
    {
        this.linkPhone = linkPhone;
    }
    
    public String getLinkAddress()
    {
        return linkAddress;
    }
    
    public void setLinkAddress(String linkAddress)
    {
        this.linkAddress = linkAddress;
    }

    public String toString()
    {
        return "Supplier [id=" + id + ", supplierName=" + supplierName + ", info=" + info + ", linkman=" + linkman + ", linkPhone=" + linkPhone + ", linkAddress=" + linkAddress + "]";
    }

    
    public static String outTitle()
    {
        return "#编号\t供应商名\t备注\t联系人\t联系电话\t联系地址";
    }
    
    public String out()
    {
        return id + "#" + supplierName + "#" + info + "#" + linkman + "#" + linkPhone + "#" + linkAddress;
    }
}
