package com.example.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.HampersDao;
import com.example.connection.DbCon;
import com.example.model.Hampers;

@WebServlet("/HampersServlet")
public class HampersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HampersServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");

        if (productId != null) {
            try {
            	HampersDao ProductDao = new HampersDao(DbCon.getConnection());
                Hampers Product = ProductDao.getSingleProduct(Integer.parseInt(productId));

                if (Product != null) {
                    request.setAttribute("Hampers", productId);
                    request.getRequestDispatcher("Hampers.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Product not found.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error retrieving product.");
            }
        } else {
            response.getWriter().println("Product ID is missing.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
