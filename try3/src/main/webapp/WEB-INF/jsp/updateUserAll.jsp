<!DOCTYPE html>
<html>
<head><title>Customer Support</title></head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Update the User</h2>
<form:form method="POST" modelAttribute="ticketUser">
    <form:label path="password">Password</form:label><br/>
    <form:input type="text" path="password"/><br/><br/>
    <form:label path="fullname">Fullname</form:label><br/>
    <form:input type="text" path="fullname"/><br/><br/>
    <form:label path="email">Email Address</form:label><br/>
    <form:input type="text" path="email"/><br/><br/>
    <form:label path="delivery">Delivery Address</form:label><br/>
    <form:input type="text" path="delivery"/><br/><br/>
    <br/><br/>
    <input type="submit" value="Update User"/>
</form:form>
</body>
</html>