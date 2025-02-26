package com.example.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.ProductDao;
import com.example.connection.DbCon;
import com.example.model.Product;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProductServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");

        if (productId != null) {
            try {
                ProductDao ProductDao = new ProductDao(DbCon.getConnection());
                Product Product = ProductDao.getSingleProduct(Integer.parseInt(productId));

                if (Product != null) {
                    request.setAttribute("product", productId);
                    request.getRequestDispatcher("product.jsp").forward(request, response);
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
