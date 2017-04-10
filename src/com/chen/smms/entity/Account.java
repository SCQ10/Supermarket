package com.chen.smms.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Table(name="SSSP_ACCOUNT")
@Entity
public class Account 
{
   
    private Integer id;   				// 账单编号
    private String name;  			// 商品名称
    private int nums;  			// 商品数量
    private double amount; 		// 交易金额
    private boolean ispayed;  	// 是否付款
    private Supplier supplier;
    private String info; 			// 商品描述
    private Date date; 			// 账单时间

    //Account类的无参构造
    public Account()
    {
    }
    
    //带参数的（账单编号）构造方法
    public Account(Integer id)
    {
        this.id = id;
    }
    
    //带所有参数的构造方法
    public Account(Integer id, String name, int nums, double amount,
			boolean ispayed, Supplier supplier, String info, Date date) {
		this.id = id;
		this.name = name;
		this.nums = nums;
		this.amount = amount;
		this.ispayed = ispayed;
		this.supplier = supplier;
		this.info = info;
		this.date = date;
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
    
    public String getName()
    {
        return name;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    
    public int getNums()
    {
        return nums;
    }
    
    public void setNums(int nums)
    {
        this.nums = nums;
    }
    
    public double getAmount()
    {
        return amount;
    }
    
    public void setAmount(double amount)
    {
        this.amount = amount;
    }
    
    public boolean isIspayed()
    {
        return ispayed;
    }
    
    public void setIspayed(boolean ispayed)
    {
        this.ispayed = ispayed;
    }
    @JoinColumn(name="SUPPLIER_ID")
	@ManyToOne(fetch=FetchType.LAZY)
    public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public String getInfo()
    {
        return info;
    }
    
    public void setInfo(String info)
    {
        this.info = info;
    }
    @Temporal(TemporalType.DATE)
    public Date getDate()
    {
        return date;
    }
    
    public void setDate(Date date)
    {
        this.date = date;
    }

    @Override
	public String toString() {
		return "Account [id=" + id + ", name=" + name + ", nums=" + nums
				+ ", amount=" + amount + ", ispayed=" + ispayed + ", supplier="
				+ supplier + ", info=" + info + ", date=" + date + "]";
	}

	public static String outTitle()
    {
        return "#商品编号#商品名称#交易数量#交易总金额#是否付款#供应商编号#供应商名称#商品信息#时间";
    }
    
    public String out()
    {
        return id + "#" + name + "#" + nums + "#" + amount + "#" + ispayed + "#" + supplier.toString() + "#" + info + "#" + date;
    }
    
//    public static Account in(String s)
//    {
//        String[] data = s.split("#");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Account account = new Account();
//        try
//        {
//        account.setName(data[1]);
//        account.setNums(new Integer(data[2]));
//        account.setAmount(new Double(data[3]));
//        account.setIspayed(new Boolean(data[4]));
//        account.setSupplierId(new Integer(data[5]));
//        account.setSupplierName(data[6]);
//        account.setInfo(data[7]);
//        account.setDate(sdf.parse(data[8]));
//        }
//        catch(Exception e)
//        {
//            return null;
//        }
//        return account;
//    }
}
