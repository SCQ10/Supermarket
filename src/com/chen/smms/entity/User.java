package com.chen.smms.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="SSSP_User")
@Entity
public class User
{
    private Integer id; 					// 管理员编号
    private String name; 				// 管理员名
    private String password;			// 管理员密码
    private String gender;				// 管理员性别
    private int age;					// 管理员年龄
    private String phone; 				// 管理员电话
    private String address;			// 管理员地址
    private boolean hasJurisdiction;  // 管理员权限
    
    public User()
    {
    }
    
    public User(int id)
    {
        this.id = id;
    }
    
    public User(int id, String name, String password, String gender, int age, String phone, String address, boolean hasJurisdiction)
    {
        this.id = id;
        this.name = name;
        this.password = password;
        this.gender = gender;
        this.age = age;
        this.phone = phone;
        this.address = address;
        this.hasJurisdiction = hasJurisdiction;
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
    
    public String getPassword()
    {
        return password;
    }
    
    public void setPassword(String password)
    {
        this.password = password;
    }
    
    public String getGender()
    {
        return gender;
    }
    
    public void setGender(String gender)
    {
        this.gender = gender;
    }
    
    public int getAge()
    {
        return age;
    }
    
    public void setAge(int age)
    {
        this.age = age;
    }
    
    public String getPhone()
    {
        return phone;
    }
    
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    
    public String getAddress()
    {
        return address;
    }
    
    public void setAddress(String address)
    {
        this.address = address;
    }
    
    public boolean isHasJurisdiction()
    {
        return hasJurisdiction;
    }
    
    public void setHasJurisdiction(boolean hasJurisdiction)
    {
        this.hasJurisdiction = hasJurisdiction;
    }

   
    public String toString()
    {
        return "User [id=" + id + ", name=" + name + ", password=" + password + ", gender=" + gender + ", age=" + age + ", phone=" + phone + ", address=" + address + ", hasJurisdiction="
            + hasJurisdiction + "]";
    }

    
    
}
