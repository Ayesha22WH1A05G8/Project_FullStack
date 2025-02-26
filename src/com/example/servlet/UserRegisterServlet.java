package com.example.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.connection.DbCon;
import com.example.dao.UserDao;
import com.example.model.User;

@WebServlet("/user-register")
public class UserRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("register-name");
            String email = request.getParameter("register-email");
            String password = request.getParameter("register-password");
            String confirmPassword = request.getParameter("register-confirm-password");

            if (password.equals(confirmPassword)) {
                UserDao udao = new UserDao(DbCon.getConnection());
                User newUser = new User();
                newUser.setName(name);
                newUser.setEmail(email);
                newUser.setPassword(password); // Ideally, you should hash the password before setting it

                boolean userCreated = udao.registerUser(newUser);

                if (userCreated) {
                    request.getSession().setAttribute("auth", newUser);
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("Registration failed, please try again.");
                }
            } else {
                out.println("Passwords do not match.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
