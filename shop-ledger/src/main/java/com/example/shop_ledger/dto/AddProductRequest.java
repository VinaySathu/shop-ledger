package com.example.shop_ledger.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddProductRequest 
{
	private String name;
	private Double price;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "AddProductRequest [name=" + name + ", price=" + price + "]";
	}

}
