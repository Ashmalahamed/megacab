<%--
  Created by IntelliJ IDEA.
  User: ahame
  Date: 2025-03-01
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Vehicle</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #4CAF50;
        }
        .btn-primary {
            background-color: #4CAF50;
            border: none;
        }
        .btn-primary:hover {
            background-color: #45a049;
        }
        .error-message {
            color: red;
            font-size: 0.9rem;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2 class="text-center">Register Vehicle</h2>

    <%-- Display error messages --%>
    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger">
        <%= request.getParameter("error").replace("<br>", "<br>") %>
    </div>
    <% } %>

    <form action="RegisterVehicleServlet" method="post" id="vehicleForm" onsubmit="return validateForm()">
        <div class="mb-3">
            <label for="vehicleName" class="form-label">Vehicle Name</label>
            <input type="text" class="form-control" id="vehicleName" name="vehicleName" required>
            <div id="vehicleNameError" class="error-message"></div>
        </div>

        <div class="mb-3">
            <label for="vehicleType" class="form-label">Vehicle Type</label>
            <select class="form-select" id="vehicleType" name="vehicleType" required>
                <option value="">Select Vehicle Type</option>
                <option value="Standed">SUV</option>
                <option value="Luxury">Van</option>
                <option value="SUV">Luxury</option>
            </select>
            <div id="vehicleTypeError" class="error-message"></div>
        </div>

        <div class="mb-3">
            <label for="registrationNumber" class="form-label">Registration Number</label>
            <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" required>
            <div id="registrationNumberError" class="error-message"></div>
        </div>

        <div class="mb-3">
            <label for="driverName" class="form-label">Driver Name</label>
            <input type="text" class="form-control" id="driverName" name="driverName" required>
            <div id="driverNameError" class="error-message"></div>
        </div>

        <div class="mb-3">
            <label for="contactNumber" class="form-label">Contact Number</label>
            <input type="text" class="form-control" id="contactNumber" name="contactNumber" required>
            <div id="contactNumberError" class="error-message"></div>
        </div>

        <button type="submit" class="btn btn-primary w-100">Register Vehicle</button>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function validateForm() {
        let isValid = true;

        // Clear previous error messages
        document.getElementById("vehicleNameError").innerText = "";
        document.getElementById("vehicleTypeError").innerText = "";
        document.getElementById("registrationNumberError").innerText = "";
        document.getElementById("driverNameError").innerText = "";
        document.getElementById("contactNumberError").innerText = "";

        // Validate Vehicle Name
        const vehicleName = document.getElementById("vehicleName").value.trim();
        if (!vehicleName) {
            document.getElementById("vehicleNameError").innerText = "Vehicle Name is required.";
            isValid = false;
        }

        // Validate Vehicle Type
        const vehicleType = document.getElementById("vehicleType").value.trim();
        if (!vehicleType) {
            document.getElementById("vehicleTypeError").innerText = "Please select a Vehicle Type.";
            isValid = false;
        }

        // Validate Driver Name
        const driverName = document.getElementById("driverName").value.trim();
        if (!driverName) {
            document.getElementById("driverNameError").innerText = "Driver Name is required.";
            isValid = false;
        } else if (!/^[a-zA-Z\s]+$/.test(driverName)) {
            document.getElementById("driverNameError").innerText = "Driver Name should only contain letters.";
            isValid = false;
        }

        // Validate Contact Number
        const contactNumber = document.getElementById("contactNumber").value.trim();
        if (!contactNumber) {
            document.getElementById("contactNumberError").innerText = "Contact Number is required.";
            isValid = false;
        } else if (!/^\d{10}$/.test(contactNumber)) {
            document.getElementById("contactNumberError").innerText = "Contact Number must be 10 digits.";
            isValid = false;
        }

        return isValid;
    }
</script>
</body>
</html>