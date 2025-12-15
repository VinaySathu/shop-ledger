package com.example.shop_ledger.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.shop_ledger.Entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long>
{
	List<Customer>findByShopId(Long shopId);

}
