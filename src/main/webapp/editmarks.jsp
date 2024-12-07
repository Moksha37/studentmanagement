<!DOCTYPE html>
<html>
<head>
    <title>Edit Marks</title>
</head>
<body>
    <h2>Edit Marks and Feedback for Assignment</h2>
    <form action="/assignments/update/${assignment.id}" method="post">
        <input type="hidden" name="_method" value="PUT">
        
        <label for="title">Assignment Title:</label>
        <input type="text" id="title" name="title" value="${assignment.title}" readonly><br><br>
        
        <label for="description">Description:</label><br>
        <textarea id="description" name="description" rows="4" cols="50" readonly>${assignment.description}</textarea><br><br>
        
        <label for="marks">Marks:</label>
        <input type="number" id="marks" name="marks" value="${assignment.marks}" required><br><br>

        <label for="feedback">Feedback:</label><br>
        <textarea id="feedback" name="feedback" rows="3" cols="50">${assignment.feedback}</textarea><br><br>

        <button type="submit">Update</button>
    </form>
</body>
</html>
