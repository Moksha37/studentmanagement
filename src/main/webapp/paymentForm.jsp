<!DOCTYPE html>
<html>
<head>
    <title>Payment Gateway</title>
</head>
<body>
    <h1>Make a Payment</h1>
    <form action="/makePayment" method="post">
        Amount: <input type="number" name="amount" required><br>
        Currency: <input type="text" name="currency" required><br>
        <button type="submit">Pay</button>
    </form>
    <p>${message}</p>
</body>
</html>