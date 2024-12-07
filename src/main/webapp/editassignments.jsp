<!DOCTYPE html>
<html>
<head>
    <title>Edit Assignment</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2>Edit Assignment</h2>
    <form action="updateassignment" method="post">
        <input type="hidden" name="id" value="${assignment.id}">
        <label for="title">Title:</label>
        <input type="text" name="title" value="${assignment.title}" required><br>
        <label for="description">Description:</label>
        <textarea name="description" required>${assignment.description}</textarea><br>
        <label for="dueDate">Due Date:</label>
        <input type="date" name="dueDate" value="${assignment.dueDate}" required><br>
        <input type="submit" value="Update Assignment">
    </form>
</body>
</html>
