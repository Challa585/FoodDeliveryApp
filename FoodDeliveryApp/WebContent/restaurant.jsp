<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fooddelivery.model.Restaurant"%>

<%
    List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurantList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurants</title>

<style>
/* ============================
   Animated Background
============================ */
body {
    margin: 0;
    padding: 0;
    font-family: "Poppins", sans-serif;
    background: linear-gradient(125deg,#ff9a9e,#fad0c4,#a18cd1,#fbc2eb,#f6d365,#fda085);
    background-size: 500% 500%;
    animation: gradientBG 15s ease infinite;
}

@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* ============================
   Navbar
============================ */
.navbar {
    display: flex;
    align-items: center;
    justify-content: space-between; /* Distribute space evenly */
    width: 100%;
    padding: 15px 40px;
    background: rgba(255,255,255,0.25);
    backdrop-filter: blur(12px);
    position: sticky;
    top: 0;
    z-index: 10;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

/* Center search bar */
.nav-center {
    flex: 1;                 /* Take up all middle space */
    display: flex;
    justify-content: center;  /* Center search bar */
}

/* Right side buttons */
.nav-right {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-right: 20px; /* Pushes the buttons further to the right */
}

/* Button styling */
.nav-btn {
    text-decoration: none;
    color: #fff;
    background: rgba(255,255,255,0.35);
    padding: 8px 16px;
    border-radius: 20px;
    transition: 0.3s;
    font-size: 15px;
}

.nav-btn:hover {
    background: rgba(255,255,255,0.6);
    color: #000;
}

/* Search bar styling remains same */
.search-box input {
    padding: 10px 16px;
    width: 280px;
    border-radius: 20px;
    border: none;
    outline: none;
    font-size: 15px;
}


/* Search bar */
.search-box input {
    padding: 10px 16px;
    width: 280px;
    border-radius: 20px;
    border: none;
    outline: none;
    font-size: 15px;
}

/* ============================
   Filters
============================ */
.filters {
    display: flex;
    justify-content: center;
    gap: 16px;
    margin-top: 25px;
}

.filter-btn {
    padding: 8px 18px;
    border: none;
    border-radius: 20px;
    background: rgba(255,255,255,0.35);
    font-size: 14px;
    cursor: pointer;
    transition: 0.3s;
}

.filter-btn:hover {
    transform: scale(1.08);
    background: rgba(255,255,255,0.6);
}

/* ============================
   Title
============================ */
h1 {
    text-align: center;
    font-size: 40px;
    font-weight: 700;
    color: #fff;
    margin-top: 20px;
    text-shadow: 3px 3px 10px rgba(0,0,0,0.35);
}

/* ============================
   Grid (4 per row)
============================ */
.restaurant-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 25px;
    width: 90%;
    margin: 35px auto;
}

/* ============================
   Glass Cards
============================ */
.card {
    background: rgba(255,255,255,0.35);
    backdrop-filter: blur(12px);
    border-radius: 18px;
    overflow: hidden;
    box-shadow: 0 15px 35px rgba(0,0,0,0.25);
    transition: 0.35s ease;
}

.card:hover {
    transform: translateY(-10px) scale(1.03);
}

.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.card-content {
    padding: 18px;
}

.card h3 {
    margin: 10px 0;
    font-size: 20px;
    color: #222;
}

.card p {
    margin: 4px 0;
    color: #333;
    font-size: 14px;
}

.rating {
    background: linear-gradient(90deg,#ff512f,#dd2476);
    color: white;
    padding: 4px 10px;
    border-radius: 12px;
    font-weight: 600;
    display: inline-block;
    margin: 8px 0;
}
</style>
</head>

<body>

<!-- ============================
      Navbar
============================ -->
<div class="navbar">

    <div class="nav-left">
        <h2 style="color:black">Food Delivery</h2>
    </div>

    <div class="nav-center">
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Search restaurants..." onkeyup="searchRestaurants()">
        </div>
    </div>

    <div class="nav-right">
        <a href="login.jsp" class="nav-btn">Login</a>
        <a href="register.jsp" class="nav-btn">Register</a>
    </div>

</div>



<!-- ============================
      Filters
============================ -->
<h1 style="color:black">✨ Explore Restaurants ✨</h1>

<div class="filters">
    <button class="filter-btn" onclick="filterCuisine('all')">All</button>
    <button class="filter-btn" onclick="filterCuisine('Biryani')">Biryani</button>
    <button class="filter-btn" onclick="filterCuisine('Pizza')">Pizza</button>
    <button class="filter-btn" onclick="filterCuisine('Chinese')">Chinese</button>
    <button class="filter-btn" onclick="filterCuisine('Burger')">Burger</button>
    <button class="filter-btn" onclick="filterCuisine('Dessert')">Desserts</button>
</div>



<!-- ============================
      Restaurant Cards
============================ -->
<div class="restaurant-container" id="restaurantContainer">

<%
    if (restaurants != null) {
        for (Restaurant r : restaurants) {
%>

    <div class="card" data-cuisine="<%= r.getCilisine() %>" data-name="<%= r.getRestaurantname().toLowerCase() %>">
        <a href="menu?restaurantId=<%= r.getRestaurantid() %>">
            <img src="<%= request.getContextPath() + "/Images/" + r.getImageurl() %>">
        </a>

        <div class="card-content">
            <h3><%= r.getRestaurantname() %></h3>
            <p><strong>Cuisine:</strong> <%= r.getCilisine() %></p>
            <p><strong>Address:</strong> <%= r.getAddress() %></p>
            <span class="rating">⭐ <%= r.getRating() %></span>
            <p><strong>Delivery:</strong> <%= r.getDeliverytime() %> mins</p>
        </div>
    </div>

<%
        }
    }
%>

</div>

<!-- ============================
      JavaScript
============================ -->
<script>
function searchRestaurants() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let cards = document.querySelectorAll(".card");

    cards.forEach(card => {
        let name = card.getAttribute("data-name");
        card.style.display = name.includes(input) ? "block" : "none";
    });
}

function filterCuisine(type) {
    let cards = document.querySelectorAll(".card");

    cards.forEach(card => {
        let cuisine = card.getAttribute("data-cuisine");

        if (type === "all" || cuisine.toLowerCase().includes(type.toLowerCase())) {
            card.style.display = "block";
        } else {
            card.style.display = "none";
        }
    });
}
</script>

</body>
</html>
