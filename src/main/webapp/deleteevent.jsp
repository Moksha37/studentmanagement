<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Courses</title>
    <style>
        table {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            border-collapse: collapse;
            table-layout: auto;
            background-color: #fff;
        }
        table, th, td {
            border: 2px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
            word-wrap: break-word;
        }
        th {
            background-color: black;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: #fff;
        }
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    <h3 style="text-align: center;"><u>Delete Courses</u></h3>
    <p style="text-align: center;">Total Courses: <c:out value="${ecount}"/></p>
    <table>
        <tr>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Description</th>
            <th>Status</th>
            <th>Total Count</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${eventList}" var="event">
            <tr>
                <td><c:out value="${event.eventId}" /></td>
                <td><c:out value="${event.name}"/></td>
                <td><c:out value="${event.description}"/></td>
                <td><c:out value="${event.status}"/></td>
                <td><c:out value="${event.totalCount}"/></td>
                <td>
                    <a href="<c:url value='/deleteeve?id=${event.eventId}'/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
