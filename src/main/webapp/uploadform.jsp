<!DOCTYPE html>
<html>
<head>
    <title>Upload PDF</title>
</head>
<body>
    <h1>Upload PDF</h1>
    <form action="/pdf/upload" method="post" enctype="multipart/form-data">
        Title: <input type="text" name="title" required><br>
        Subject: <input type="text" name="subject" required><br>
        Description: <input type="text" name="description" required><br>
        Due Date: <input type="date" name="dueDate" required><br>
        Year: <input type="number" name="year" required><br>
        File: <input type="file" name="file" required><br><br>
        <button type="submit">Upload</button>
    </form>
    <p>${message}</p>
</body>
</html>
