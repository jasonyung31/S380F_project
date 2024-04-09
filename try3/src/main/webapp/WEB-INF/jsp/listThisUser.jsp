<!DOCTYPE html>
<html>
<head><title>Customer Support User Management</title></head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<br /><br />

<a href="<c:url value="/user/update" />">Update your Information</a><br /><br />
<a href="<c:url value="/book/index" />">Go to book store</a>

<h2>Users</h2>

<security:authorize access="hasRole('ADMIN')">
    <a href="<c:url value="/user/list" />">Manage User</a><br /><br />
</security:authorize>

