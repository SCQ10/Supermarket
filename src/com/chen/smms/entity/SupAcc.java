package com.chen.smms.entity;

public class SupAcc {
	
	private int id;			//供应商编号
	private String supName;	//供应商名称
	private double accAll;	//总交易金额
	private int types;		//商品种类
	private int numAll; 	//总商品数量
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public double getAccAll() {
		return accAll;
	}
	public void setAccAll(double accAll) {
		this.accAll = accAll;
	}
	public int getTypes() {
		return types;
	}
	public void setTypes(int types) {
		this.types = types;
	}
	public int getNumAll() {
		return numAll;
	}
	public void setNumAll(int numAll) {
		this.numAll = numAll;
	}
	public SupAcc(int id, String supName, double accAll, int types, int numAll) {
		this.id = id;
		this.supName = supName;
		this.accAll = accAll;
		this.types = types;
		this.numAll = numAll;
	}
	@Override
	public String toString() {
		return "SupAcc [id=" + id + ", supName=" + supName + ", accAll="
				+ accAll + ", types=" + types + ", numAll=" + numAll + "]";
	}
	public SupAcc() {
	}
	
	
}
