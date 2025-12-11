<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <style>
    /* ---------------------------------------------------
   BEAUTIFUL ANIMATED BACKGROUND (SOFT PINK → CORAL → PURPLE)
----------------------------------------------------*/
body {
    margin: 0;
    padding: 0;
    font-family: "Poppins", sans-serif;
    height: 100vh;
    overflow: hidden;

    /* Medium pastel gradient */
    background: linear-gradient(135deg, #ff85b3, #ff9f5c, #ff6fa9, #c27bff);
    background-size: 400% 400%;
    animation: gradientShift 12s infinite ease-in-out;

    display: flex;
    justify-content: center;
    align-items: center;
}

/* Soft gradient animation */
@keyframes gradientShift {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* ---------------------------------------------------
   FLOATING SOFT BLURRED SHAPES
----------------------------------------------------*/
.shape {
    position: absolute;
    border-radius: 50%;
    filter: blur(60px);
    opacity: 0.45;
    animation: floatShapes 8s infinite ease-in-out;
}

.shape1 {
    width: 280px;
    height: 280px;
    background: #ff9ccc;  /* soft medium pink */
    top: 7%;
    left: 6%;
}

.shape2 {
    width: 350px;
    height: 350px;
    background: #ffb473; /* soft warm coral */
    bottom: 8%;
    right: 8%;
}

@keyframes floatShapes {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-30px); }
    100% { transform: translateY(0px); }
}

/* ---------------------------------------------------
   GLASSMORPHIC LOGIN CARD (MEDIUM OPACITY)
----------------------------------------------------*/
.login-container {
    position: relative;
    width: 390px;
    padding: 40px;
    border-radius: 25px;

    background: rgba(255, 255, 255, 0.15);
    box-shadow: 0 0 30px rgba(255, 200, 255, 0.25);
    backdrop-filter: blur(18px);
    border: 1px solid rgba(255, 255, 255, 0.25);

    animation: fadeIn 1.2s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-20px); }
    to   { opacity: 1; transform: translateY(0); }
}

h1 {
    text-align: center;
    margin-bottom: 25px;
    color: #ffffff;
    font-size: 30px;
    font-weight: 700;
    text-shadow: 0 0 12px rgba(255, 255, 255, 0.4);
}

/* ---------------------------------------------------
   INPUT FIELDS (SOFT WHITE GLOW)
----------------------------------------------------*/
label {
    font-weight: bold;
    color: #f5f5f5;
}

input {
    width: 100%;
    margin-top: 8px;
    padding: 14px;

    background: rgba(255, 255, 255, 0.25);
    border: none;
    border-radius: 12px;
    color: #fff;
    font-size: 16px;

    transition: 0.3s ease-in-out;
}

input::placeholder {
    color: #f0e4f5;
}

input:focus {
    outline: none;
    background: rgba(255, 255, 255, 0.35);
    box-shadow: 0 0 18px rgba(255, 220, 255, 0.7);
}

/* ---------------------------------------------------
   BUTTON (MEDIUM PURPLE → SOFT PINK)
----------------------------------------------------*/
button {
    width: 100%;
    padding: 14px;

    background: linear-gradient(135deg, #d466ff, #ff79c5);
    color: white;

    border: none;
    border-radius: 12px;
    font-size: 18px;
    cursor: pointer;
    font-weight: bold;

    transition: 0.3s ease;
}

button:hover {
    transform: scale(1.05);
    box-shadow: 0 0 22px rgba(255, 130, 220, 0.7);
}

/* ---------------------------------------------------
   LINKS
----------------------------------------------------*/
.link {
    text-align: center;
    margin-top: 18px;
}

.link a {
    color: #fff0f5;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s ease-in-out;
}

.link a:hover {
    color: #ffd966;
    text-shadow: 0 0 12px #ffd966;
}


    </style>

</head>
<body>

<!-- Floating animated shapes -->
<div class="shape shape1"></div>
<div class="shape shape2"></div>

<div class="login-container">
    <h1>User Login</h1>

    <form action="LoginServlet" method="post">
        <label>Email</label>
        <input type="text" name="email" placeholder="Enter email" required><br><br>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required><br><br>

        <button type="submit">Login</button>
    </form>

    <div class="link">
        <p>Don't have an account? <a href="register.jsp">Register</a></p>
    </div>
</div>

</body>
</html>
