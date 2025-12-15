package com.example.shop_ledger.Controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.shop_ledger.Entity.Customer;
import com.example.shop_ledger.Entity.Product;
import com.example.shop_ledger.Entity.Shop;
import com.example.shop_ledger.Entity.Transaction;
import com.example.shop_ledger.dto.AddCustomerRequest;
import com.example.shop_ledger.dto.AddProductRequest;
import com.example.shop_ledger.dto.PaymentRequest;
import com.example.shop_ledger.dto.PurchaseRequest;
import com.example.shop_ledger.repository.TransactionRepository;
import com.example.shop_ledger.service.CustomerService;
import com.example.shop_ledger.service.ShopService;

@RestController
@RequestMapping("/api/shops")
public class ShopController 
{
	private final ShopService shopService;
	private final CustomerService customerService;
	private final TransactionRepository txRepo;
	
	public ShopController(ShopService shopService,
			              CustomerService customerService,
			              TransactionRepository txRepo)
	{
		this.shopService = shopService;
		this.customerService = customerService;
		this.txRepo = txRepo;
		
	}
	@PostMapping
	public Shop createShop(@RequestBody Shop shop)
	{
		return shopService.createShop(shop);
	}
	@PostMapping("/{shopId}/customers")
	public Customer addCustomer(@PathVariable Long shopId,
			                    @RequestBody AddCustomerRequest request)
	{
		return shopService.addCustomer(shopId, request);
	}
	@GetMapping("/{shopId}/customers")
	public List<Map<String,Object>>getCustomersWithBalance(@PathVariable Long shopId)
	{
		List<Customer>customers = shopService.getCustomersByShop(shopId);
		List<Map<String,Object>>result = new ArrayList<>();
		for(Customer c : customers) 
		{
		Double balance = customerService.getBalance(c.getId());
		Map<String,Object>map = new HashMap<>();
		map.put("CustomerId",c.getId());
		map.put("Name",c.getName());
		map.put("Phone",c.getPhone());
		map.put("balance",balance);
		result.add(map);
		}
		return result;
	}
	@PostMapping("{shopId}/products")
	public Product addProducts(@PathVariable Long shopId,
			                   @RequestBody AddProductRequest request)
	{
		return shopService.addProduct(shopId,request);
	}
	@GetMapping("/{shopId}/products")
	public List<Product>getProduct(@PathVariable Long shopId)
	{
		return shopService.getProductsByShop(shopId);
	}
	@PostMapping("/{shopId}/customers/{customerId}/purchase")
	public Transaction addPurchace(@PathVariable Long shopId,
			                       @PathVariable Long customerId,
			                       @RequestBody PurchaseRequest request)
	{
		return shopService.addPurchase(shopId, customerId, request);
	}
	@PostMapping("/{shopId}/customers/{customerId}/payment")
	public Transaction addPayment(@PathVariable Long shopId,
			                      @PathVariable Long customerId,
			                      @RequestBody PaymentRequest request)
	{
		return shopService.addPayment(shopId, customerId, request);
	}
	@GetMapping("/{shopId}/customers/{customerId}/transactions")
	public List<Transaction>getCustomerTransactions(@PathVariable Long shopId,
			                                        @PathVariable Long customerId)
	{
		return txRepo.findByCustomerId(customerId);
	}
}
