<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload Assignment</title>
</head>
<body>
    <h2>Upload Assignment</h2>
    <form action="/uploadassignment" method="post" enctype="multipart/form-data">
        <label for="file">Choose Assignment File:</label>
        <input type="file" name="file" id="file" required />
        <br /><br />
        <input type="submit" value="Upload" />
    </form>
    <br />
    <a href="/fachome">Back to Home</a>
</body>
</html>
