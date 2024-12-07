<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>List PDF Files</title>
</head>
<body>
    <h1>List of Uploaded PDF Files</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>File Name</th>
            <th>Title</th>
            <th>Subject</th>
            <th>Description</th>
            <th>Due Date</th>
            <th>Year</th>
            <th>Actions</th>
        </tr>
        <!-- Iterate through files using JSTL -->
        <c:forEach var="file" items="${files}">
            <tr>
                <td>${file.id}</td>
                <td>${file.fileName}</td>
                <td>${file.title}</td>
                <td>${file.subject}</td>
                <td>${file.description}</td>
                <td>${file.dueDate}</td>
                <td>${file.year}</td>
                <td>
                    <a href="/api/pdf/view/${file.id}" target="_blank">View</a> |
                    <a href="/api/pdf/download/${file.id}">Download</a> |
                    <form action="/api/pdf/delete/${file.id}" method="post" style="display:inline;">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
