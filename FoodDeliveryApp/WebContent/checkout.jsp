<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>

<style>
/* -----------------------------------
   ANIMATED GRADIENT BACKGROUND (LIGHT)
------------------------------------ */
body {
    margin: 0;
    padding: 0;
    height: 100vh;
    font-family: "Poppins", sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;

    background: linear-gradient(135deg, #b8e1ff, #e2c6ff);
    background-size: 300% 300%;
    animation: gradientMove 12s infinite ease-in-out;
}

@keyframes gradientMove {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* -----------------------------------
   FLOATING BUBBLES (LIGHTER)
------------------------------------ */
.bubble {
    position: absolute;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.35);
    animation: floatUp 8s infinite ease-in-out;
}

.b1 { width: 120px; height: 120px; left: 10%; bottom: -100px; animation-duration: 9s; }
.b2 { width: 80px; height: 80px; right: 15%; bottom: -120px; animation-duration: 7s; }
.b3 { width: 150px; height: 150px; left: 40%; bottom: -150px; animation-duration: 10s; }

@keyframes floatUp {
    0% { transform: translateY(0); opacity: 0.5; }
    50% { opacity: 0.8; }
    100% { transform: translateY(-900px); opacity: 0; }
}

/* -----------------------------------
   GLASS EFFECT CHECKOUT CARD (LIGHT)
------------------------------------ */
.container {
    position: relative;
    width: 450px;
    padding: 35px;
    border-radius: 18px;
    backdrop-filter: blur(12px);
    background: rgba(255, 255, 255, 0.35);
    border: 1px solid rgba(255, 255, 255, 0.5);
    box-shadow: 0px 10px 30px rgba(0,0,0,0.15);
    animation: fadeIn 1.2s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}

h2 {
    text-align: center;
    color: #333;
    font-size: 28px;
    margin-bottom: 20px;
}

/* -----------------------------------
   INPUTS AND BUTTON STYLING (LIGHT)
------------------------------------ */
label {
    font-weight: bold;
    color: #333;
}

input, select {
    width: 100%;
    padding: 12px;
    margin-top: 8px;
    margin-bottom: 20px;
    border-radius: 10px;
    border: none;
    font-size: 16px;
    background: rgba(255,255,255,0.55);
    color: #333;
    outline: none;
}

input::placeholder {
    color: #7f7f7f;
}

input:focus, select:focus {
    box-shadow: 0 0 10px rgba(150, 150, 150, 0.6);
}

/* -----------------------------------
   BUTTON (LIGHT)
------------------------------------ */
.btn {
    width: 100%;
    padding: 14px;
    background: #ffffff;
    color: #5a5ad1;
    border: none;
    font-size: 18px;
    border-radius: 12px;
    cursor: pointer;
    transition: 0.3s;
    font-weight: bold;
}

.btn:hover {
    transform: scale(1.05);
    background: #cbbdff;
    color: #333;
}

</style>
</head>

<body>

<!-- Bubbles Animation -->
<div class="bubble b1"></div>
<div class="bubble b2"></div>
<div class="bubble b3"></div>

<!-- Checkout Box -->
<div class="container">
    <h2>Delivery Details</h2>

    <form action="PlaceOrderServlet" method="post">

        <label>Delivery Address</label>
        <input type="text" name="address" placeholder="Enter full address" required>

        <label>Payment Method</label>
        <select name="payment" required>
            <option value="COD">Cash On Delivery</option>
            <option value="UPI">UPI</option>
            <option value="Card">Credit/Debit Card</option>
        </select>

        <button class="btn" type="submit">Place Order</button>

    </form>
</div>

</body>
</html>
