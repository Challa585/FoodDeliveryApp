<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Order Confirmation</title>

<style>

   body {
    margin: 0;
    padding: 0;
    font-family: "Poppins", sans-serif;

    /* Soft premium gradient */
    background: linear-gradient(135deg, #a18cd1, #fbc2eb);
    
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    animation: fadeInBg 1.2s ease-in-out;
}

@keyframes fadeInBg {
    from { opacity: 0; }
    to { opacity: 1; }
}

/* Clean premium white card */
.box {
    background: rgba(255, 255, 255, 0.9);
    width: 450px;
    padding: 30px;
    border-radius: 20px;
    text-align: center;

    /* Soft shadow */
    box-shadow: 0px 12px 28px rgba(0,0,0,0.20);

    animation: popup 0.9s ease;
}

@keyframes popup {
    from { transform: scale(0.8); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
}

/* Beautiful green success icon */
.success-icon {
    font-size: 80px;
    color: #3bb54a;
    margin-bottom: 15px;
    animation: bounce 0.8s ease infinite alternate;
}

@keyframes bounce {
    from { transform: translateY(0); }
    to { transform: translateY(-10px); }
}

h2 {
    color: #4a4a4a;
    font-size: 22px;
    line-height: 30px;
    margin-top: 5px;
}

/* Premium button colors */
.btn {
    display: inline-block;
    padding: 12px 22px;
    background: #9b59b6; /* soft purple */
    color: white;
    text-decoration: none;
    border-radius: 12px;
    font-size: 16px;
    margin-top: 25px;
    transition: 0.3s;
}

.btn:hover {
    background: #6a11cb;
    transform: translateY(-3px);
    box-shadow: 0px 6px 15px rgba(0,0,0,0.25);
}


</style>

</head>
<body>

<div class="box">

    <div class="success-icon">✔</div>

    <h2>
        Your Order has been placed successfully!
    </h2>

    <a class="btn" href="<%= request.getContextPath() %>/restaurant">
        ⟵ Back to Restaurants
    </a>

</div>

</body>
</html>
