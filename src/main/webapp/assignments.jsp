<!-- assignments.jsp -->
<html>
<head>
    <title>Assignments</title>
</head>
<body>
    <h1>Student Assignments</h1>
    <p>Here you can view, upload, and manage your assignments.</p>

    <!-- Upload Form -->
    <h2>Upload New Assignment</h2>
    <form action="/assignments/upload" method="post" enctype="multipart/form-data">
        <label for="assignmentTitle">Title:</label>
        <input type="text" id="assignmentTitle" name="title" required><br><br>
        
        <label for="dueDate">Due Date:</label>
        <input type="date" id="dueDate" name="dueDate" required><br><br>

        <label for="assignmentFile">File:</label>
        <input type="file" id="assignmentFile" name="file" required><br><br>

        <button type="submit">Upload Assignment</button>
    </form>

    <!-- Assignments Table -->
    <h2>Your Assignments</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Assignment ID</th>
                <th>Title</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Math Homework</td>
                <td>2024-12-10</td>
                <td>Pending</td>
                <td>
                    <form action="/assignments/delete/1" method="post" style="display:inline;">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Science Project</td>
                <td>2024-12-15</td>
                <td>Submitted</td>
                <td>
                    <form action="/assignments/delete/2" method="post" style="display:inline;">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
