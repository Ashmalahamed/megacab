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
    }

    /* Form Heading */
    h2 {
      font-size: 2rem;
      margin-bottom: 20px;
      color: #333;
      text-align: start;
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
    }

    button:hover {
      background: linear-gradient(135deg, #2575fc, #6a11cb);
      transform: translateY(-2px);
    }

    button:active {
      transform: translateY(0);
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
  </style>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<h2>User Registration</h2>
<form action="register" method="post">
  <input type="text" name="name" placeholder="Enter your name" required>
  <input type="email" name="email" placeholder="Enter your email" required>
  <input type="password" name="password" placeholder="Enter your password" required>
  <button type="submit">Register</button>
</form>

<p>Already have an account? <a href="login.jsp">Login here</a></p>

</body>
</html>
