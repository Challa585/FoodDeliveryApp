<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.Menu" %>
<%@ page import="com.fooddelivery.model.Restaurant" %>

<%
    Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
    List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Menu</title>

<style>

/* =============================
   PREMIUM MULTI-LAYER BACKGROUND
   ============================= */
body {
    margin: 0;
    padding: 20px;
    font-family: "Poppins", Arial, sans-serif;

    background: linear-gradient(
        135deg,
        #ff9a9e,
        #fad0c4,
        #fbc2eb,
        #a6c1ee,
        #d4fc79,
        #96e6a1
    );
    background-size: 600% 600%;
    animation: gradientShift 18s ease infinite;
}

@keyframes gradientShift {
    0%   { background-position: 0% 50%; }
    50%  { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* =============================
   TITLE
   ============================= */
h1 {
    text-align: center;
    color: #fff;
    font-size: 45px;
    letter-spacing: 1.5px;
    text-shadow: 3px 4px 12px rgba(0,0,0,0.4);
    margin-bottom: 35px;
    animation: fadeDown 1s ease;
}

@keyframes fadeDown {
    from { opacity: 0; transform: translateY(-20px); }
    to   { opacity: 1; transform: translateY(0); }
}

/* =============================
   MENU GRID LAYOUT
   ============================= */
.menu-container {
    display: grid;
    grid-template-columns: repeat(3, 320px); /* FIXED CARD WIDTH LIKE FIRST IMAGE */
    justify-content: center; /* CENTER GRID */
    gap: 35px; /* EQUAL GAP */
    p
/* =============================
   NEO GLASS CARD DESIGN
   ============================= */
.menu-card {
    background: rgba(255, 255, 255, 0.28);
    width: 320px;  /* FIX card width like first image */
    margin: auto;
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);

    border-radius: 18px;
    padding: 18px;
    overflow: hidden;
    box-shadow: 0 15px 30px rgba(0,0,0,0.25);

    transition: transform .35s ease, box-shadow .35s ease;
    animation: float 4s ease-in-out infinite, fadeUp .9s ease;
}

@keyframes fadeUp {
    from { opacity: 0; transform: translateY(20px); }
    to   { opacity: 1; transform: translateY(0); }
}

@keyframes float {
    0%,100% { transform: translateY(0px); }
    50%     { transform: translateY(-8px); }
}

.menu-card:hover {
    transform: scale(1.06) translateY(-6px);
    box-shadow: 0 18px 40px rgba(0,0,0,0.35);
}

/* =============================
   IMAGE STYLING
   ============================= */
.menu-card img {
    width: 100%;
    height: 190px;
    border-radius: 14px;
    object-fit: cover;
    box-shadow: 0 4px 14px rgba(0,0,0,0.25);
}

/* =============================
   TEXT STYLE
   ============================= */
.menu-card h3 {
    margin-top: 12px;
    color: #222;
    font-size: 22px;
    font-weight: 600;
}

.menu-card p {
    margin: 6px 0;
    color: #444;
    font-size: 15px;
}

/* PRICE TAG */
.price-tag {
    background: linear-gradient(135deg, #ff512f, #dd2476);
    padding: 6px 12px;
    border-radius: 8px;
    display: inline-block;
    color: #fff;
    font-weight: bold;
    box-shadow: 0 3px 8px rgba(221,36,118,0.45);
}

/* AVAILABILITY BADGE */
.badge {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 12px;
    font-size: 13px;
    margin-top: 4px;
    font-weight: bold;
    text-transform: uppercase;
}

.available {
    background: #28c76f;
    color: #fff;
}

.not-available {
    background: #ff3e3e;
    color: #fff;
}

/* =============================
   BUTTON
   ============================= */
button {
    background: linear-gradient(45deg, #ff512f, #dd2476);
    border: none;
    padding: 10px 16px;
    color: white;
    border-radius: 9px;
    cursor: pointer;
    width: 100%;
    font-size: 16px;
    margin-top: 15px;

    transition: 0.3s ease;
    box-shadow: 0 5px 15px rgba(255, 94, 98, 0.3);
}

button:hover {
    background: linear-gradient(45deg, #ff9966, #ff5e62);
    transform: translateY(-3px) scale(1.03);
    box-shadow: 0 8px 20px rgba(255, 94, 98, 0.5);
}

/* QUANTITY INPUT */
input[type="number"] {
    width: 65px;
    padding: 6px;
    border-radius: 6px;
    border: 1px solid #aaa;
}

</style>
</head>

<body>

<h1 style="color:black"> Menu  <%= restaurant != null ? restaurant.getRestaurantname() : "Restaurant" %> </h1>

<div class="menu-container">

<%
if(menuList != null){
    for(Menu m : menuList){
%>

    <div class="menu-card">

        <img src="<%= request.getContextPath() + "/Images/" + m.getImageurl() %>" alt="menu">

        <h3><%= m.getMenuname() %></h3>
        <p><%= m.getDescription() %></p>

        <!-- Price -->
        <span class="price-tag"> <%= m.getPrice() %></span>
        <br>

        <!-- Availability -->
        <span class="badge <%= m.isIsavailable() ? "available" : "not-available" %>">
            <%= m.isIsavailable() ? "Available" : "Not Available" %>
        </span>

        <form method="post" action="cart">
            <input type="hidden" name="action" value="add"/>
            <input type="hidden" name="menuId" value="<%= m.getMenuid() %>"/>
            <input type="hidden" name="name" value="<%= m.getMenuname() %>"/>
            
            <input type="hidden" name="price" value="<%= m.getPrice() %>"/>

            <br> Qty:
            <input type="number" name="qty" value="1" min="1"/>

            <button type="submit">Add to Cart</button>
        </form>

    </div>

<%
    }
} else {
%>

<p>No menu items found.</p>

<% } %>

</div>

</body>
</html>
