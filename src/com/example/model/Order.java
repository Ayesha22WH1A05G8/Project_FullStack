package com.example.model;

public class Order {
    private int orderId;
    private int id;
    private int uid;
    private int qunatity;
    private String date;
    private String name;
    private String category;
    private double price;

    public Order() {}

    public Order(int orderId, int id, int uid, int qunatity, String date, String name, String category, double price) {
        this.orderId = orderId;
        this.id = id;
        this.uid = uid;
        this.qunatity = qunatity;
        this.date = date;
        this.name = name;
        this.category = category;
        this.price = price;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getQunatity() {
        return qunatity;
    }

    public void setQunatity(int qunatity) {
        this.qunatity = qunatity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
