<%@page import="com.example.model.*"%>
<%@page import="com.example.dao.*"%>
<%@page import="com.example.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    // Get a connection to the database
    Connection con = DbCon.getConnection();
    
    // Create a ProductDao instance
    ProductDao productDao = new ProductDao(con);
    
    // Retrieve all products from the database
    List<Product> productList = productDao.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>All gifts-Jewellery</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce-Website</title>    
    <link rel="stylesheet" href="style.css">
    <script>
        // Function to toggle the heart icon and add/remove items from the wishlist
        document.getElementById('gifts-category').addEventListener('mouseover', function () {
            document.getElementById('popup').style.display = 'block';
        });

        // Hide the pop-up when the mouse leaves the pop-up
        document.getElementById('popup').addEventListener('mouseleave', function () {
            document.getElementById('popup').style.display = 'none';
        });



        function toggleHeart(element, productName, price, imageUrl) {
            if (element.innerHTML === '♡') {
                element.innerHTML = '♥';
                addToWishlist(productName, price, imageUrl);
            } else {
                element.innerHTML = '♡';
                removeFromWishlist(productName);
            }
        }
    </script>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

	<div class="breadcrumb">
        <a href="Home.html">Home</a> > <a href="index.jsp">Jewellery</a> 
    </div>
    <div class="products-header">
        <h2>Candles and Diffusers</h2>
        <div class="filters">
            <label for="delivery-date">Delivery Date</label>
            <div class="input-group date" data-provide="datepicker">
                <input type="text" class="form-control" id="delivery-date">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-th"></span>
                </div>
            </div>
            <label for="filter-price">Filter By Price</label>
            <select id="filter-price">
                <option>All Products</option>
                <option value="0-499">499 and below</option>
                <option value="500-999">500 - 999</option>
                <option value="1000-1499">1000 - 1499</option>
                <option value="1500-2499">1500 - 2499</option>
                <option value="2500 and Above">2500 and Above</option>
        </select>
            <label for="sort-by">Sort By</label>
            <select id="sort-by">
                <option>Popularity</option>
                <option value="Low to High">Price - Low to High</option>
                <option value="High to Low">Price - High to Low</option>
                <option value="best seller">Best Seller</option>
                <option value="premium">Premium</option>
                <option value="trending">Trending</option>
            </select>
        </div>
    </div>
        <div class="product-grid">
            <%
                for (Product product : productList) {
            %>
            <div class="product-card">
				<a href="product.jsp">
				<img src="image-photes/<%=product.getImageUrl()%>" alt="Aura Boat Base Diffuser"></a>
				<div class="product-info">
						<h3><%=product.getName()%></h3>
						<p class="price"><%=product.getPrice()%></p>
						<p class="price"><%=product.getCategory() %></p>
						<p class="delivery">Earliest Delivery: 27 - Jun</p>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=product.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=product.getId()%>">Buy Now</a>
						</div>
				</div>
		</div>
            <%
                }
            %>
        </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
