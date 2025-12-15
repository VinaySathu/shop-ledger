package com.example.shop_ledger.dto;

import java.util.List;

public class CustomerSummaryDTO {

    private long customerId;
    private String name;
    private String phone;

    private long shopId;
    private String shopName;      // ✅ exact name used in JSP

    private Double balance;       // ✅ single balance field

    private List<TransactionDTO> transactions;

    public CustomerSummaryDTO() {
    }

    public CustomerSummaryDTO(long customerId,
                              String name,
                              String phone,
                              long shopId,
                              String shopName,
                              Double balance) {
        this.customerId = customerId;
        this.name = name;
        this.phone = phone;
        this.shopId = shopId;
        this.shopName = shopName;   // ✅ matches field
        this.balance = balance;
    }

    // ---- getters & setters ----

    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public long getShopId() {
        return shopId;
    }

    public void setShopId(long shopId) {
        this.shopId = shopId;
    }

    public String getShopName() {        // 🔥 this is what JSP needs
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public List<TransactionDTO> getTransactions() {
        return transactions;
    }

    public void setTransactions(List<TransactionDTO> transactions) {
        this.transactions = transactions;
    }

    @Override
    public String toString() {
        return "CustomerSummaryDTO{" +
                "customerId=" + customerId +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", shopId=" + shopId +
                ", shopName='" + shopName + '\'' +
                ", balance=" + balance +
                '}';
    }
}
