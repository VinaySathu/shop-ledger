package com.example.shop_ledger.dto;

import java.time.LocalDateTime;

import com.example.shop_ledger.Entity.TransactionType;

public class TransactionDTO {

    private long id;
    private TransactionType type;
    private Double amount;
    private Integer quantity;
    private String productName;
    private LocalDateTime dateTime;   // ✅ use dateTime here

    public TransactionDTO(long id,
                          TransactionType type,
                          Double amount,
                          Integer quantity,
                          String productName,
                          LocalDateTime dateTime) {
        this.id = id;
        this.type = type;
        this.amount = amount;
        this.quantity = quantity;
        this.productName = productName;
        this.dateTime = dateTime;
    }

    public TransactionDTO() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public TransactionType getType() {
        return type;
    }

    public void setType(TransactionType type) {
        this.type = type;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    // ⭐ This is what JSP EL looks for when you write ${t.dateTime}
    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    @Override
    public String toString() {
        return "TransactionDTO{" +
                "id=" + id +
                ", type=" + type +
                ", amount=" + amount +
                ", quantity=" + quantity +
                ", productName='" + productName + '\'' +
                ", dateTime=" + dateTime +
                '}';
    }
}
