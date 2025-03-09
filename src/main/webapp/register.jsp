<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-02-18
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
  <title>User Registration</title>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    /* General Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* Body Styling */
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      color: #333;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      overflow: hidden;
    }

    /* Form Container */
    form {
      background: rgba(255, 255, 255, 0.95);
      padding: 30px;
      max-width: 400px;
      width: 100%;
      border-radius: 15px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.1);
      animation: fadeIn 1.5s ease-in-out;
    }

    /* Form Heading */
    h2 {
      font-size: 2rem;
      margin-bottom: 20px;
      color: #333;
      text-align: start;
      position: relative;
    }

    h2::after {
      content: '';
      position: absolute;
      bottom: -10px;
      left: 0;
      width: 50px;
      height: 3px;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      border-radius: 5px;
    }

    /* Input Fields */
    input {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 1rem;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input:focus {
      border-color: #6a11cb;
      box-shadow: 0 0 8px rgba(106, 17, 203, 0.3);
      outline: none;
    }

    /* Button Styling */
    button {
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      color: white;
      padding: 12px;
      width: 100%;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    button:hover {
      background: linear-gradient(135deg, #2575fc, #6a11cb);
      transform: translateY(-2px);
    }

    button:active {
      transform: translateY(0);
    }

    /* Button Hover Effect */
    button::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: rgba(255, 255, 255, 0.3);
      transition: left 0.5s ease;
      z-index: -1;
    }

    button:hover::before {
      left: 0;
    }

    /* Link Styling */
    p {
      margin-top: 15px;
      font-size: 0.9rem;
      color: #555;
      text-align: center;
    }

    a {
      color: #6a11cb;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    a:hover {
      color: #2575fc;
    }

    /* Animations */
    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>
<body>
<form action="register" method="post">
  <h2>User Registration</h2>
  <input type="text" name="name" placeholder="Enter your name" required>
  <input type="email" name="email" placeholder="Enter your email" required>
  <input type="password" name="password" placeholder="Enter your password" required>
  <input type="tel" name="phoneNumber" placeholder="Enter your phone number" required>
  <input type="text" name="address" placeholder="Enter your address" required>
  <button type="submit">Register</button>
  <p>Already have an account? <a href="login.jsp">Login here</a></p>
</form>
</body>
</html>