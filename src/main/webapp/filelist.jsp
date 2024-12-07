<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>PDF Files</title>
</head>
<body>
    <h1>All PDF Files</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Subject</th>
            <th>Description</th>
            <th>Year</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="file" items="${files}">
            <tr>
                <td>${file.id}</td>
                <td>${file.title}</td>
                <td>${file.subject}</td>
                <td>${file.description}</td>
                <td>${file.year}</td>
                <td>
                    <a href="/pdf/view/${file.id}">View</a> |
                    <a href="/pdf/download/${file.id}">Download</a> |
                    <a href="/pdf/delete/${file.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
