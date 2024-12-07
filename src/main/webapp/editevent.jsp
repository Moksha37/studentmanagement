<!DOCTYPE html>
<html>
<head>
    <title>Assignments</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
            padding: 20px;
        }

        /* Header styling */
        h1 {
            color: #333;
            text-align: center;
        }

        /* Paragraph styling */
        p {
            color: #555;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
        }

        td {
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td:nth-child(4) {
            font-weight: bold;
        }

        /* Add responsiveness for smaller screens */
        @media screen and (max-width: 768px) {
            table, th, td {
                font-size: 14px;
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <h1>Student Assignments</h1>
    <p>Here you can view and manage your assignments.</p>
    <table border="1">
        <thead>
            <tr>
                <th>Assignment ID</th>
                <th>Title</th>
                <th>Due Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Math Homework</td>
                <td>2024-12-10</td>
                <td>Pending</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Science Project</td>
                <td>2024-12-15</td>
                <td>Submitted</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
