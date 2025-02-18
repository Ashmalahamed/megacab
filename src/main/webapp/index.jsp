<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Maga Cab Service</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('D:/magacitycab/megacity_cab/cab.png') no-repeat center center;
            background-size: contain;
            opacity: 0.1;
            z-index: 0;
        }

        header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            color: #333;
            position: relative;
            z-index: 1;
        }

        header p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 2rem;
            position: relative;
            z-index: 1;
        }

        nav {
            display: flex;
            justify-content: space-around;
            position: relative;
            z-index: 1;
        }

        .btn {
            text-decoration: none;
            color: #fff;
            background-color: #ff6f61;
            padding: 0.75rem 1.5rem;
            border-radius: 25px;
            font-size: 1rem;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn:hover {
            background-color: #ff3b2f;
            transform: translateY(-3px);
        }

        .btn:active {
            transform: translateY(0);
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>Welcome to Maga Cab Service</h1>
        <p>Your reliable partner for safe and comfortable rides.</p>
    </header>
    <nav>
        <a href="register.jsp" class="btn">Register</a>
        <a href="login.jsp" class="btn">Login</a>
    </nav>
</div>
</body>
</html>