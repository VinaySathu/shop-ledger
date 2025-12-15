package com.example.shop_ledger.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PurchaseRequest 
{
	private long productId;
	@Override
	public String toString() {
		return "PurchaseRequest [productId=" + productId + ", quantity=" + quantity + "]";
	}
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	private Integer quantity;

}
