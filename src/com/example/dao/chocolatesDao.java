package com.example.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Cart;
import com.example.model.chocolates;

public class chocolatesDao {
    
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public chocolatesDao(Connection con) {
        this.con = con;
    }
    public List<chocolates> getAllProducts() {
        List<chocolates> products = new ArrayList<>();
        try {
            query = "select * from chocolates";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	chocolates product = new chocolates();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("image"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return products;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from chocolates where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("price") * item.getQuantity();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
    public chocolates getSingleProduct(int id) {
    	chocolates product = null;
        try {
            query = "select * from chocolates where id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                product = new chocolates();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return product;
    }
}
