package com.example.shop_ledger.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.shop_ledger.Entity.Customer;
import com.example.shop_ledger.Entity.Product;
import com.example.shop_ledger.Entity.Shop;
import com.example.shop_ledger.Entity.Transaction;
import com.example.shop_ledger.Entity.TransactionType;
import com.example.shop_ledger.dto.AddCustomerRequest;
import com.example.shop_ledger.dto.AddProductRequest;
import com.example.shop_ledger.dto.PaymentRequest;
import com.example.shop_ledger.dto.PurchaseRequest;
import com.example.shop_ledger.exception.ResourceNotFoundException;
import com.example.shop_ledger.repository.CustomerRepository;
import com.example.shop_ledger.repository.ProductRepository;
import com.example.shop_ledger.repository.ShopRepository;
import com.example.shop_ledger.repository.TransactionRepository;

@Service
public class ShopService 
{
	private final ShopRepository shopRepo;
	private final CustomerRepository customerRepo;
	private final ProductRepository productRepo;
	private final TransactionRepository txRepo;
	public ShopService(ShopRepository shopRepo,
			           CustomerRepository customerRepo,
			           ProductRepository productRepo,
			           TransactionRepository txRepo)
	{
		this.shopRepo = shopRepo;
		this.customerRepo = customerRepo;
		this.productRepo = productRepo;
		this.txRepo = txRepo;
	}
	public Shop createShop(Shop shop)
	{
		return shopRepo.save(shop);
	}
	public Customer addCustomer(Long ShopId,AddCustomerRequest request)
	{
		Shop shop = shopRepo.findById(ShopId)
				.orElseThrow(() -> new ResourceNotFoundException("Shop Not Found with Id" + ShopId));
		Customer c = new Customer();
		c.setName(request.getName());
		c.setPhone(request.getPhone());
		c.setShop(shop);
		return customerRepo.save(c);
	}
	public Product addProduct(Long ShopId,AddProductRequest request)
	{
		Shop shop = shopRepo.findById(ShopId)
				.orElseThrow(() -> new ResourceNotFoundException("Shop not found with id" + ShopId));
		Product p = new Product();
		p.setName(request.getName());
		p.setPrice(request.getPrice());
		p.setShop(shop);
		return productRepo.save(p);
	}
	public Transaction addPurchase(Long ShopId,Long customerId,PurchaseRequest req)
	{
		Customer customer = customerRepo.findById(customerId)
				.orElseThrow(() ->new ResourceNotFoundException("Customer Not Found With id" + customerId));
		Product product = productRepo.findById(req.getProductId())
				.orElseThrow(() ->new ResourceNotFoundException("Product Not Found With Id" + req.getProductId()));
		Transaction t = new Transaction();
		t.setType(TransactionType.PURCHASE);
		t.setCustomer(customer);
		t.setProduct(product);
		t.setQuantity(req.getQuantity());
		t.setAmount(product.getPrice()*req.getQuantity());
		t.setDatetime(LocalDateTime.now());
		return txRepo.save(t);
		
	}
	public Transaction addPayment(Long ShopId,Long customerId,PaymentRequest req)
	{
		Customer customer = customerRepo.findById(customerId).orElseThrow(() -> new ResourceNotFoundException("Customer not found with id" + customerId));
		Transaction t = new Transaction();
		t.setType(TransactionType.PAYMENT);
		t.setCustomer(customer);
		t.setAmount(req.getAmount());
		t.setDatetime(LocalDateTime.now());
		return txRepo.save(t);
	}
	public List<Customer>getCustomersByShop(Long ShopId)
	{
		return customerRepo.findByShopId(ShopId);
	}
	public List<Product>getProductsByShop(Long ShopId)
	{
		return productRepo.findByShopId(ShopId);
	}
	public Shop getShopById(Long shopId)
	{
		return shopRepo.findById(shopId)
				.orElseThrow(()-> new ResourceNotFoundException("Shop not Found with shopId" + shopId));
	}

}
