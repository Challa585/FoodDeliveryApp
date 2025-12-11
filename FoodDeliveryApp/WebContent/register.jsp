<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
            height: 100vh;
            overflow: hidden;

            background: linear-gradient(135deg, #ff00cc, #333399, #00d4ff, #7f00ff);
            background-size: 400% 400%;
            animation: gradientShift 12s infinite ease-in-out;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .register-container {
            width: 420px;
            padding: 40px;
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 35px rgba(255, 255, 255, 0.15);
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            text-align: center;
            color: #fff;
            margin-bottom: 25px;
            font-size: 28px;
            text-shadow: 0 0 10px rgba(255,255,255,0.6);
        }

        label {
            color: #e6e6e6;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 7px;
            margin-bottom: 18px;
            border: none;
            border-radius: 10px;
            font-size: 15px;

            background: rgba(255, 255, 255, 0.2);
            color: white;
            transition: 0.3s;
        }

        input::placeholder {
            color: #dddddd;
        }

        input:focus {
            outline: none;
            box-shadow: 0 0 15px rgba(255,255,255,0.5);
            background: rgba(255,255,255,0.35);
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #ff00cc, #7f00ff);
            color: white;
            font-size: 18px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s ease;
        }

        button:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(255,0,200,0.7);
        }

        .link {
            margin-top: 15px;
            text-align: center;
        }

        .link a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .link a:hover {
            text-shadow: 0 0 10px #ffea00;
            color: #ffea00;
        }
    </style>
</head>

<body>

    <div class="register-container">
        <h1>User Registration</h1>

        <form action="RegisterServlet" method="post">

            <label>Username</label>
            <input type="text" name="username" placeholder="Enter name" required>

            <label>Email</label>
            <input type="email" name="email" placeholder="Enter email" required>

            <label>Phone Number</label>
            <input type="text" name="phone" placeholder="Enter phone number" required>

            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password" required>

            <label>Address</label>
            <input type="text" name="address" placeholder="Enter address" required>

            <button type="submit">Register</button>
        </form>

        <div class="link">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
    </div>

</body>
</html>
