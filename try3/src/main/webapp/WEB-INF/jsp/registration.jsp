<!DOCTYPE html>
<html>
<head><title>Customer Support</title></head>
<body>

<style>
    body {background-image: url("https://www.arca24.com/en/wp-content/uploads/2022/02/form-register-arca24.jpg");}
    h2{text-align:center}
    form{text-align:center}
</style>

<h2>Registration Center</h2>

<form:form method="POST" modelAttribute="ticketUser">
    <form:label path="username">Username</form:label><br/>
    <form:input type="text" path="username"/><br/><br/>
    <form:label path="password">Password</form:label><br/>
    <form:input type="text" path="password"/><br/><br/>
    <form:label path="fullname">Fullname</form:label><br/>
    <form:input type="text" path="fullname"/><br/><br/>
    <form:label path="email">Email Address</form:label><br/>
    <form:input type="text" path="email"/><br/><br/>
    <form:label path="delivery">Delivery Address</form:label><br/>
    <form:input type="text" path="delivery"/><br/><br/>
    <br/><br/>
    <input type="submit" value="Register"/>
</form:form>
</body>
</html>