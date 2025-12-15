package com.example.shop_ledger.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentRequest 
{
	private Double amount;

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "PaymentRequest [amount=" + amount + "]";
	}

}
