package com.example.shop_ledger.Controllers;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.shop_ledger.Entity.Product;
import com.example.shop_ledger.Entity.Transaction;
import com.example.shop_ledger.dto.CustomerSummaryDTO;
import com.example.shop_ledger.dto.TransactionDTO;
import com.example.shop_ledger.service.CustomerService;

@RestController
@RequestMapping("/api/customers")
public class CustomerController 
{
	private final CustomerService customerservice;

	public CustomerController(CustomerService customerservice) {
		super();
		this.customerservice = customerservice;
	}
	@GetMapping("/{id}/summary")
	public CustomerSummaryDTO getSummary(@PathVariable Long id)
	{
		return customerservice.getCustomerSummary(id);
	}
	@GetMapping("/{id}/transaction")
	public List<TransactionDTO>getTransaction(@PathVariable Long id)
	{
		return customerservice.getTransactionHistory(id);
	}
	@GetMapping("/{id}/products")
	public List<Product>getProduct(@PathVariable Long id)
	{
		return customerservice.getProductForCustomer(id);
	}
}
