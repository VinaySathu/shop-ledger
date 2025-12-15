package com.example.shop_ledger.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.shop_ledger.Entity.Shop;

public interface ShopRepository extends JpaRepository<Shop, Long>
{

}
