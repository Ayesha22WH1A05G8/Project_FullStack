<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All gifts</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="apple-icon-120x120.avif" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
</head>
<style>
        /* Pop-up styling */
        .popup {
            display: none;
            position: absolute;
            top: 170px;
            left: 50%;
            transform: translateX(-50%);
            width: 90%;
            max-width: 1250px;
            background-color: #fff;
            box-shadow: 0 5px 15px rgba(0,0,0,.5);
            z-index: 1000;
            padding: 20px;
            border-radius: 0%;
        }
        .popup .container {
            display: flex;
            justify-content: space-between;
        }
        .popup .column {
            flex: 1;
            margin-right: 20px;
        }
        .popup .column:last-child {
            margin-right: 0;
        }
        .popup .column ul {
            list-style-type: none;
            padding: 0;
        }
        .popup .column ul li {
            margin: 10px 0;
        }
        .popup .column ul li a {
            text-decoration: none;
            color: #333;
        }
        .popup .menu ul li a {
            color: black;
        }
        .popup .featured ul li a {
            color: black;
        }
        .popup .recipient ul li a {
            color: black;
        }
        .popup .occasion ul li a {
            color: black;
        }
        .popup .column-title {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .popup .images {
            display: flex;
            flex-direction: column;
            margin-left: 20px;
        }
        .popup .images img {
            width: 70%;
            max-width: 300px;
            height: auto;
            margin-bottom: 20px;
            border-radius: 10px;
        }
    </style>
    <style>
        .filters {
            display: flex;
            align-items: center;
        }
        .filters select,
        .filters label {
            margin-right: 10px;
        }
    </style>
<div class="navbar main-navbar">
        <div class="container">
            <div class="top-nav text-right">
                <span>
                    <a href="#">Help</a> | Currency - <strong>INR</strong> | 
                    <a href="#">Corporate Gifts</a> | <a href="#">Partner With Us</a> | 
                    <a href="#">Track Order</a>
                </span>
            </div>
            <div class="row align-items-center text-center">
                <div class="col-md-3 logo">
                    <a href="Home.html"><img src="aa.jpg"alt="Logo" width="160px"></a>
                </div>
                <div class="col-md-6 search-bar">
                    <form action="/search" method="get" class="form-inline">
                        <input type="text" name="query" placeholder="Search for gifts" class="form-control" id="search-input">
                        <datalist id="gift-options">
                            <a href="index.jsp"><option value="Jwellery"></option></a>
                            <a href="softtoy.jsp"><option value="Soft Toy"></option></a>
                            <a href="Decor.jsp"><option value="Candles"></option></a>
                            <a href="Best.jsp"><option value="Best-Seller"></option></a>
                        </datalist>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                        <button type="button" class="btn btn-default location-btn"><span class="glyphicon glyphicon-map-marker"></span> <a href="location.html">Delivery Location ></a></button>
                    </form>
                </div>
                <div class="col-md-3 icon-bar">
                    <a href="login.jsp"><img src="user1.jpg" alt="User Icon" class="nav-icon"></a>
                    <a href="wishlist2.html"><img src="heart.jpg" alt="Wishlist Icon" class="nav-icon"></a>
                    <a href="cart.jsp"><img src="cart.png" alt="Cart Icon" class="nav-icon"></a>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar categories-navbar">
        <div class="container text-center">
            <ul class="nav navbar-nav main-nav">
                <li><a href="#">EXPRESS</a></li>
                <li><a href="#">CAKES</a></li>
                <li><a href="#">FLOWERS</a></li>
                <li><a href="#">PLANTS</a></li>
                <li class="active" id="gifts-category"><a href="#">GIFTS</a></li>
                <li><a href="#">PERSONALIZED GIFTS</a></li>
                <li><a href="chocolates.jsp">CHOCOLATES</a></li>
                <li><a href="#">COMBOS</a></li>
                <li><a href="#">BIRTHDAY</a></li>
                <li><a href="#">ANNIVERSARY</a></li>
                <li><a href="#">OCCASIONS</a></li>
            </ul>
        </div>
    </div>
    <div id="popup" class="popup">
        <div class="container">
            <div class="column menu">
                <div class="column-title">Gifts</div>
                <ul>
                    <li><a href="Best.jsp">Best Seller Gifts</a></li>
                    <li><a href="#">Home Decor</a></li>
                    <li><a href="index.jsp">Jewellery</a></li>
                    <li><a href="#">Perfumes & Fragrances</a></li>
                    <li><a href="#">Gift Basket</a></li>
                    <li><a href="softtoy.jsp">Soft Toys</a></li>
                    <li><a href="#">Handbags & Wallets</a></li>
                    <li><a href="#">Idols And Figurines</a></li>
                    <li><a href="Decor.jsp">Diffusers & Candles</a></li>
                    <li><a href="#">Greeting Cards</a></li>
                </ul>
            </div>
            <div class="column featured">
                <div class="column-title">Featured Gifts</div>
                <ul>
                    <li><a href="#">New Arrival</a></li>
                    <li><a href="Hampers.jsp">Gifts Hampers</a></li>
                    <li><a href="#">Sweets</a></li>
                    <li><a href="#">Dryfruits</a></li>
                    <li><a href="#">Chocolates</a></li>
                </ul>
            </div>
            <div class="column recipient">
                <div class="column-title">By Recipient</div>
                <ul>
                    <li><a href="#">For Her</a></li>
                    <li><a href="#">For Him</a></li>
                    <li><a href="Husband.jsp">For Husband</a></li>
                    <li><a href="#">For Wife</a></li>
                    <li><a href="Kids.jsp">For Kids</a></li>
                    <li><a href="#">For Couples</a></li>
                </ul>
            </div>
            <div class="column occasion">
                <div class="column-title">By Occasions</div>
                <ul>
                    <li><a href="#">Birthday Gifts</a></li>
                    <li><a href="#">Anniversary</a></li>
                    <li><a href="#">Wedding Gifts</a></li>
                    <li><a href="#">Love & Romance</a></li>
                </ul>
            </div>
            <div class="images">
                <img src="gift-hampers.avif" alt="Gift Hampers">
                <img src="all-gifts.avif" alt="All Gifts">
            </div>
        </div>
    </div>
    <script>
	    $(document).ready(function () {
	        $("#gift-options").hover(function () {
	            $("#popup-menu").toggle();
	            });
	    $('#search-input').on('focus', function () {
	        $(this).attr('list', 'gift-options');
	    }).on('blur', function () {
	        setTimeout(() => { $(this).removeAttr('list'); }, 100); // Delay to allow click on datalist options
	            });
        // Show the pop-up when the "GIFTS" tab is hovered over
        document.getElementById('gifts-category').addEventListener('mouseover', function () {
            document.getElementById('popup').style.display = 'block';
        });

        // Hide the pop-up when the mouse leaves the pop-up
        document.getElementById('popup').addEventListener('mouseleave', function () {
            document.getElementById('popup').style.display = 'none';
        });

        // Toggle wishlist heart icon
        function toggleHeart(element) {
            if (element.innerHTML === '♡') {
                element.innerHTML = '♥';
                element.style.color = 'red';
            } else {
                element.innerHTML = '♡';
                element.style.color = 'black';
            }
        }
    </script>