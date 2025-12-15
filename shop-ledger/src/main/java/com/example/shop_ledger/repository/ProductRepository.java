package com.example.shop_ledger.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.shop_ledger.Entity.Product;

public interface ProductRepository extends JpaRepository<Product,Long>
{

	List<Product>findByShopId(Long shopId);
}
