<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Assignments</title>
</head>
<body>
    <h2>Assignments List</h2>
    <c:if test="${not empty assignments}">
        <table border="1">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Due Date</th>
                    <th>Subject</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="assignment" items="${assignments}">
                    <tr>
                        <td>${assignment.title}</td>
                        <td>${assignment.description}</td>
                        <td>${assignment.dueDate}</td>
                        <td>${assignment.subject}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty assignments}">
        <p>No assignments found.</p>
    </c:if>
</body>
</html>
