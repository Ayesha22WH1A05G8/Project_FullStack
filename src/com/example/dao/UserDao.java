package com.example.dao;

import java.sql.*;
import com.example.model.*;

public class UserDao {
    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;
    }

    public User userLogin(String email, String password) {
        User user = null;
        try {
            query = "select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }

    public boolean registerUser(User user) {
        boolean status = false;
        try {
            // Check if user already exists
            query = "select * from users where email=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, user.getEmail());
            rs = pst.executeQuery();
            if (rs.next()) {
                // User with this email already exists
                return false;
            }

            // Insert new user into the database
            query = "insert into users (name, email, password) values (?, ?, ?)";
            pst = this.con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword()); // Ideally, you should hash the password before storing it
            int affectedRows = pst.executeUpdate();

            if (affectedRows > 0) {
                status = true;
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return status;
    }
}
