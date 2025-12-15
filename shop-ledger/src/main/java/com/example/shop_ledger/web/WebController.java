package com.example.shop_ledger.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shop_ledger.Entity.Shop;
import com.example.shop_ledger.dto.AddCustomerRequest;
import com.example.shop_ledger.dto.AddProductRequest;
import com.example.shop_ledger.dto.CustomerSummaryDTO;
import com.example.shop_ledger.dto.PaymentRequest;
import com.example.shop_ledger.dto.PurchaseRequest;
import com.example.shop_ledger.service.CustomerService;
import com.example.shop_ledger.service.ShopService;


@Controller
public class WebController 
{
	private final ShopService shopService;
	private final CustomerService customerService;
	public WebController(ShopService shopService,CustomerService customerService)
	{
		this.shopService = shopService;
		this.customerService = customerService;
	}
	@GetMapping("/")
	public String home(Model model)
	{
		return "home";
	}
	@GetMapping("/add-shop")
	public String addShopPage()
	{
		return"add-shop";
	}
	@PostMapping("/add-shop")
	public String addShop(@ModelAttribute Shop shop, Model model )
	{
		shopService.createShop(shop);
		model.addAttribute("message","Shop added sucessfully!");
		return "add-shop";
	}
	@GetMapping("/add-customer")
	public String addCustomerPage()
	{
		return "add-customer";
	}
	@PostMapping("/add-customer")
	public String addCustomer(@RequestParam Long shopId,
	                          @ModelAttribute AddCustomerRequest request,
	                          Model model)
	{
		shopService.addCustomer(shopId, request);
		model.addAttribute("message","Customer added sucessfully!");
		return "add-customer";
	}
	@GetMapping("/add-product")
	public String addProductPage()
	{
		return "add-product";
	}
	@PostMapping("/add-product")
	public String addProduct(@RequestParam Long shopId,
			                 @ModelAttribute AddProductRequest request,
			                 Model model)
	{
		shopService.addProduct(shopId, request);
		model.addAttribute("message","Product Added Sucessfully!");
		return "add-product";
	}
	@GetMapping("/customer-transactions")
	public String customerTransactionPage(@RequestParam(required = false)Long shopId,
			                              @RequestParam (required =false)Long customerId,Model model)
	{
		model.addAttribute("shopId", shopId);
		model.addAttribute("customerId", customerId);
		if(shopId != null)
		{
			var products = shopService.getProductsByShop(shopId);
			model.addAttribute("products", products);
		}
		
			if(customerId != null) {
			var balance = customerService.getBalance(customerId);
			model.addAttribute("balance", balance);
		}
		return "customer-transactions";
	}
	@PostMapping("/customer-purchase")
	public String customerPurchase(@RequestParam Long shopId,
			                       @RequestParam Long customerId,
			                       @RequestParam Long productId,
			                       @RequestParam Integer quantity,
			                       Model model)
	{
		PurchaseRequest req = new PurchaseRequest();
		req.setProductId(productId);
		req.setQuantity(quantity);
		shopService.addPurchase(shopId, customerId, req);
		Double balance = customerService.getBalance(customerId);
		model.addAttribute("message","Purchase added Successfully!");
		model.addAttribute("balance", balance);
		return "redirect:/customer-transactions?shopId="+ shopId +"&customerId="+customerId;
	}
	@PostMapping("/customer-payment")
	public String customerPayment(@RequestParam Long shopId,
			                      @RequestParam Long customerId,
			                      @RequestParam Double amount,
			                      Model model)
	{
		PaymentRequest req = new PaymentRequest();
		req.setAmount(amount);
		shopService.addPayment(shopId, customerId, req);
		Double balance = customerService.getBalance(customerId);
		model.addAttribute("message", "Payment recorded Successfully");
		model.addAttribute("balance", balance);
		return"redirect:/customer-transactions?shopId="+ shopId + "&customerId=" +customerId;
	}
	@GetMapping("/shop-customer-summary")
	public String shopCustomerSummsry(@RequestParam(required = false)Long shopId,Model model)
	{
		if (shopId==null)
		{
			return "shop-customer-summary";
		}
		List<CustomerSummaryDTO>summaries=
				shopService.getCustomersByShop(shopId).stream()
				.map(c->customerService.getCustomerSummary(c.getId()))
				.toList();
		model.addAttribute("shopId",shopId);
		model.addAttribute("summaries", summaries);
		return "shop-customer-summary";
	}
	//@GetMapping("/shop-dashboard")
	//public String shopDashboard(@RequestParam(required = false) Long shopId,Model model)
	{
		//if(shopId != null)
		{
			//var summaries = shopService.getCustomersByShop(shopId).stream()
					//.map(c-> customerService.getCustomerSummary(c.getId()))
					//.toList();
			//model.addAttribute("message", shopId);
			//model.addAttribute("summaries",summaries);
		}
		//return"shop-dashboard";
	}
	//@GetMapping("/customer-dashboard")
	//public String customerDashboard(@RequestParam(required = false)Long customerId,Model model)
	{
		//if (customerId != null)
		{
			//var summary = customerService.getCustomerSummary(customerId);
			//var transactions = customerService.getTransactionHistory(customerId);
			//var products = customerService.getProductForCustomer(customerId);
			//model.addAttribute("summary",summary);
			//model.addAttribute("transactions", transactions);
			//model.addAttribute("products", products);
		}
		//return"customer-dashboard";
	}
	@GetMapping("/shop-login")
	public String shopLoginPage()
	{
		return "shop-login";
	}
	@PostMapping("/shop-login")
	public String handleShopLogin(@RequestParam Long shopId,Model model)
	{
		try {
			var shop=shopService.getShopById(shopId);
			var summaries = shopService.getCustomersByShop(shopId).stream()
					.map(c -> customerService.getCustomerSummary(c.getId()))
					.toList();
			model.addAttribute("shop", shop);
			model.addAttribute("shopId", shopId);
			model.addAttribute("summaries", summaries);
			return "shop-login";
		}
		catch(Exception e)
				{
			model.addAttribute("error","Invalid Shop ID . please try again.");
			return"shop-login";
				}
	}
	@GetMapping("/customer-login")
	public String customerLoginPage()
	{
		return "customer-login";
	}
	@PostMapping("/customer-login")
	public String HandleCustomerLogin(@RequestParam Long customerId,Model model)
	{
		try {
			var summary = customerService.getCustomerSummary(customerId);
			var transactions = customerService.getTransactionHistory(customerId);
			var products = customerService.getProductForCustomer(customerId);
			model.addAttribute("summary",summary);
			model.addAttribute("transactions", transactions);
			model.addAttribute("products", products);
			model.addAttribute("customerId", customerId);
			return"customer-login";
		}
		catch(Exception e)
		{
			model.addAttribute("error","Invalid Customer Id. please try again.");
			return"customer-login";
		}
	}
}
