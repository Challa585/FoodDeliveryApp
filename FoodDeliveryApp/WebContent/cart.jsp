<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.fooddelivery.model.Cart" %>
<%@ page import="com.fooddelivery.model.CartItem" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) cart = new Cart();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Your Cart</title>

<style>

/* --------------------- Animated Gradient Background --------------------- */
body {
    margin: 0;
    padding: 30px;
    font-family: "Poppins", sans-serif;
    background: linear-gradient(135deg, #ff9a9e, #fad0c4, #a1c4fd, #c2e9fb);
    background-size: 400% 400%;
    animation: bgShift 15s ease infinite;
}
@keyframes bgShift {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* --------------------- Heading --------------------- */
h1 {
    text-align: center;
    font-size: 45px;
    color: #fff;
    text-shadow: 3px 4px 10px rgba(0,0,0,0.4);
    margin-bottom: 30px;
    animation: fadeDown 1s ease;
}
@keyframes fadeDown {
    from { opacity: 0; transform: translateY(-20px); }
    to   { opacity: 1; transform: translateY(0); }
}

/* --------------------- Cart Table Wrapper --------------------- */
.cart-box {
    width: 85%;
    margin: auto;
    padding: 25px;
    background: rgba(255, 255, 255, 0.22);
    border-radius: 20px;
    border: 1px solid rgba(255, 255, 255, 0.4);
    backdrop-filter: blur(12px);
    box-shadow: 0 12px 40px rgba(0,0,0,0.25);
    animation: float 5s ease-in-out infinite;
}
@keyframes float {
    0%, 100% { transform: translateY(0); }
    50%      { transform: translateY(-10px); }
}

/* --------------------- Table Styling --------------------- */
table {
    width: 100%;
    border-collapse: collapse;
    font-size: 17px;
    color: #333;
}
th {
    background: rgba(255, 255, 255, 0.4);
    padding: 14px;
    font-weight: 600;
    border-radius: 8px;
}
td {
    padding: 14px;
    backdrop-filter: blur(6px);
    border-bottom: 1px solid #ddd;
    color: #111;
}

/* --------------------- Quantity Input --------------------- */
input[type="number"] {
    width: 60px;
    padding: 6px;
    border-radius: 8px;
    border: 1px solid #999;
    font-size: 15px;
}

/* --------------------- Buttons --------------------- */
button {
    padding: 8px 16px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    color: white;
    cursor: pointer;
    background: linear-gradient(45deg, #ff512f, #dd2476);
    transition: .3s ease;
    box-shadow: 0 4px 12px rgba(221,36,118,0.4);
}
button:hover {
    transform: translateY(-3px) scale(1.03);
    background: linear-gradient(45deg, #ff9966, #ff5e62);
    box-shadow: 0 7px 18px rgba(255, 94, 98, 0.6);
}

/* Remove button */
.remove-btn {
    background: linear-gradient(45deg, #ff414d, #ff6b6b);
}
.remove-btn:hover {
    background: linear-gradient(45deg, #ff7b7b, #ff5252);
}

/* Checkout Button */
.checkout-btn {
    display: inline-block;
    padding: 12px 30px;
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    color: white;
    text-decoration: none;
    font-size: 18px;
    border-radius: 12px;
    margin-top: 20px;
    font-weight: bold;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}
.checkout-btn:hover {
    opacity: 0.9;
}


/* --------------------- Empty Cart --------------------- */
.empty-text {
    text-align: center;
    font-size: 26px;
    color: #fff;
    margin-top: 40px;
    text-shadow: 3px 3px 8px rgba(0,0,0,0.4);
    animation: fadeDown 1s ease;
}

</style>
</head>

<body>

<h1 style="color:black">Your Cart</h1>

<% if (cart.isEmpty()) { %>

    <p class="empty-text"> Your cart is empty.</p>

<% } else { %>

<div class="cart-box">
    <table>
        <tr>
            <th>Item</th>
            <th>Qty</th>
            <th>Price </th>
            <th>Total</th>
            <th>Action</th>
        </tr>

        <% for (CartItem it : cart.getItems()) { %>
        <tr>
            <td><strong><%= it.getItemName() %></strong></td>

            <!-- Qty Update -->
            <td>
                <form action="cart" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="menuId" value="<%= it.getMenuId() %>"/>
                    <input type="number" name="qty" value="<%= it.getQuantity() %>" min="1"/>
                    <button type="submit">Update</button>
                </form>
            </td>

            <td><%= it.getPrice() %></td>
            <td><strong><%= it.getTotalPrice() %></strong></td>

            <!-- Remove -->
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="remove"/>
                    <input type="hidden" name="menuId" value="<%= it.getMenuId() %>"/>
                    <button class="remove-btn" type="submit">Remove</button>
                </form>
                
            </td>
        </tr>
        <% } %>

        <tr>
            <td colspan="3" align="right"><strong>Grand Total:</strong></td>
            <td colspan="2"><strong> <%= cart.getTotalAmount() %></strong></td>
        </tr>
    </table>
</div>
<%
Integer rid = (Integer) session.getAttribute("restaurantId");
String addMoreUrl = (rid != null) ? "menu?restaurantId=" + rid : "restaurant";
%>
<div style="text-align: center; margin-top: 20px;">
    <a href="<%= addMoreUrl %>" 
       style="background: linear-gradient(to right, #ff416c, #ff4b2b);
              padding: 12px 30px;
              color: white;
              text-decoration: none;
              border-radius: 10px;
              font-size: 18px;
              font-weight: bold;
              box-shadow: 0px 4px 10px rgba(0,0,0,0.2);">
        Add More Items
    </a>
    </div>

<!-- Checkout Button -->

<form action="cart" method="post">
   <div style="text-align:center; margin-top:20px;">
    <a href="CheckoutServlet" class="checkout-btn">Proceed to Checkout</a>
   
</div> 
</form>

 
<% } %>

</body>
</html>
