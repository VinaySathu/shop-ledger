package com.example.shop_ledger.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.example.shop_ledger.Entity.Customer;
import com.example.shop_ledger.Entity.Product;
import com.example.shop_ledger.Entity.Transaction;
import com.example.shop_ledger.dto.CustomerSummaryDTO;
import com.example.shop_ledger.dto.TransactionDTO;
import com.example.shop_ledger.exception.ResourceNotFoundException;
import com.example.shop_ledger.repository.CustomerRepository;
import com.example.shop_ledger.repository.ProductRepository;
import com.example.shop_ledger.repository.TransactionRepository;

@Service
public class CustomerService
{
	private final CustomerRepository customerRepo;
	private final TransactionRepository txRepo;
	private final ProductRepository productRepo;
	public CustomerService(CustomerRepository customerepo,
			               TransactionRepository txRepo,
			               ProductRepository productRepo, CustomerRepository customerRepo)
	{
		this.customerRepo = customerRepo;
		this.txRepo = txRepo;
		this.productRepo = productRepo;
		
	}
	public Customer getCustomer(Long id)
	{
		return customerRepo.findById(id).
				orElseThrow(() -> new ResourceNotFoundException("Customer not Found with Id" + id));
	}
	public Double getBalance(Long CustomerId)
	{
		Double balance = txRepo.findBalanceByCustomerId(CustomerId);
		return balance == null ? 0.0 : balance;
	}
	public CustomerSummaryDTO getCustomerSummary(Long CustomerId)
	{
		Customer c = getCustomer(CustomerId);
		Double balance = getBalance(CustomerId);
		return new CustomerSummaryDTO(
				c.getId(),
				c.getName(),
				c.getPhone(),
				c.getShop().getId(),
				c.getShop().getName(),
				balance
	   );
	}
	public List<TransactionDTO> getTransactionHistory(Long customerId)
	{
		List<Transaction>txs = txRepo.findByCustomerId(customerId);
		return txs.stream()
				.map(t -> new TransactionDTO(
						t.getId(),
						t.getType(),
						t.getAmount(),
						t.getQuantity(),
						t.getProduct() != null ? t.getProduct().getName(): null,
						t.getDatetime()		
					))
				 .collect(Collectors.toList());
	}
	public List<Product>getProductForCustomer(Long customerId)
	{
		Customer c = getCustomer(customerId);
		Long shopId = c.getShop().getId();
		return productRepo.findByShopId(shopId);
	}

}
