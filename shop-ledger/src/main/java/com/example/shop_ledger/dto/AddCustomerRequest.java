package com.example.shop_ledger.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddCustomerRequest 
{

	private String name;
	private String phone;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "AddCustomerRequest [name=" + name + ", phone=" + phone + "]";
	}
}
