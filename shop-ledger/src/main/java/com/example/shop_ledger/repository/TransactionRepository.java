package com.example.shop_ledger.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.shop_ledger.Entity.Transaction;

public interface TransactionRepository extends JpaRepository<Transaction,Long>
{
	List<Transaction>findByCustomerId(Long customerId);
	@Query("""
			SELECT COALESCE(SUM(CASE WHEN t.type = com.example.shop_ledger.Entity.TransactionType.PURCHASE
            THEN t.amount
            ELSE -t.amount
            END
            ), 0)
FROM Transaction t
WHERE t.customer.id = :customerId""")
	Double findBalanceByCustomerId(@Param("customerId")Long customerId);

}
