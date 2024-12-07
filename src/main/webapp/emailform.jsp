<!DOCTYPE html>
<html>
<head>
    <title>Email Service</title>
</head>
<body>
    <h1>Send an Email</h1>
    <form action="/sendEmail" method="post">
        To: <input type="email" name="to" required><br>
        Subject: <input type="text" name="subject" required><br>
        Body: <textarea name="body" required></textarea><br>
        <button type="submit">Send Email</button>
    </form>
    <p>${message}</p>
</body>
</html>