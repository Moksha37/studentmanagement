<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.sdp.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Navigation Bar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style>
        /* General Body Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            min-height: 100vh;
            background-color: #f4f4f9;
            transition: margin-left 0.3s ease;
            margin-left: 220px; /* Offset body content for sidebar */
        }

        /* Navbar Styling */
        .navbar {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 10px 0;
            background-color: #333;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 200px;
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .navbar-heading {
            color: white;
            text-align: center;
            width: 100%;
            margin: 0;
            padding: 20px 0;
            border-bottom: 1px solid #555;
            font-size: 1.5em;
        }

        .navbar a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            width: 100%;
            box-sizing: border-box;
        }

        .navbar a:hover {
            background-color: #555;
            color: white;
        }

        /* Upload Form Styling */
        .upload-section {
            margin-left: 220px; /* Offset content */
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin: 20px 0;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="file"] {
            margin-bottom: 10px;
        }

        button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Message Styling */
        .message {
            text-align: center;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <!-- Student Navigation Bar -->
    <div class="navbar">
        <h3 class="navbar-heading">Student Portal</h3>
        <ul>
          <nav>
    <ul>
        <li><a href="${pageContext.request.contextPath}/studenthome">Home</a></li><br>
        <li><a href="${pageContext.request.contextPath}/studentprofile">Profile</a></li><br>
        <li><a href="${pageContext.request.contextPath}/viewassignments">View Assignments</a></li><br>
        <li><a href="${pageContext.request.contextPath}/uploadfilepage">Upload Files</a></li><br>
        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li><br>
    </ul>
</nav>

        </ul>
    </div>

    <!-- File Upload Section -->
    <div class="upload-section">
        <h2>Upload File</h2>
        <form action="${pageContext.request.contextPath}/uploadfile" method="post" enctype="multipart/form-data">
            <label for="file">Choose a file to upload:</label>
            <input type="file" name="file" id="file" required />
            <br><br>
            <button type="submit">Upload</button>
        </form>
    </div>

    <!-- Display Success or Error Message -->
    <div class="message">
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>
    </div>

    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>
