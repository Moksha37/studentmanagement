<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Student Submissions</title>
</head>
<body>
    <h2>Student Submissions</h2>
    <c:choose>
        <c:when test="${not empty submissions}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Email</th>
                        <th>Submission File</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="submission" items="${submissions}">
                        <tr>
                            <td>${submission.name}</td>
                            <td>${submission.email}</td>
                            <td><a href="/viewSubmissionFile?fileName=${submission.fileName}">Download</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>No submissions found.</p>
        </c:otherwise>
    </c:choose>
    <br />
    <a href="/fachome">Back to Home</a>
</body>
</html>
