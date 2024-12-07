<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File Upload</title>
    <style>
        .upload-section {
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 50%;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .upload-section h2 {
            margin-bottom: 15px;
            font-size: 24px;
        }

        .upload-section label {
            font-weight: bold;
            margin-right: 10px;
        }

        .upload-section input {
            margin-bottom: 15px;
        }

        .upload-section button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-transform: uppercase;
            cursor: pointer;
            border-radius: 4px;
        }

        .upload-section button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <!-- File Upload Section -->
    <div class="upload-section">
        <h2>Upload File</h2>
        <form action="${pageContext.request.contextPath}/uploadfile" method="post" enctype="multipart/form-data">
            <label for="file">Choose a file to upload:</label>
            <input type="file" name="file" id="file" required />
            <br><br>
            <button type="submit">Upload</button>
        </form>
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>
    </div>
</body>
</html>
