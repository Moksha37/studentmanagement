<!DOCTYPE html>
<html>
<head>
    <title>Add Assignment</title>
</head>
<body>
    <h2>Add New Assignment</h2>
    <form action="submitassignment" method="post">
        <label for="title">Title:</label>
        <input type="text" name="title" required><br><br>
        
        <label for="description">Description:</label><br>
        <textarea name="description" required></textarea><br><br>
        
        <label for="deadline">Deadline:</label>
        <input type="date" name="deadline" required><br><br>
        
        <input type="submit" value="Add Assignment">
    </form>
</body>
</html>
