package com.example.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.BestDao;
import com.example.connection.DbCon;
import com.example.model.Best;

@WebServlet("/BestServlet")
public class BestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BestServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");

        if (productId != null) {
            try {
            	BestDao ProductDao = new BestDao(DbCon.getConnection());
                Best Product = ProductDao.getSingleProduct(Integer.parseInt(productId));

                if (Product != null) {
                    request.setAttribute("softtoys", productId);
                    request.getRequestDispatcher("Best.jsp").forward(request, response);
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
