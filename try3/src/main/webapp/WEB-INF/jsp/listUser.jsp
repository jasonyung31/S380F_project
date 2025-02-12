<!DOCTYPE html>
<html>
<head>
    <title>Customer Support User Management</title>
</head>
<body>
    <c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<br /><br />

<a href="<c:url value="/book/index" />">Go to book store</a>
<a href="<c:url value="/user/update" />">Update Your Information</a>


<h2>Users</h2>


<c:choose>
    <c:when test="${fn:length(ticketUsers) == 0}">
        <i>There are no users in the system.</i>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>Username</th><th>Password</th><th>Full Name</th><th>Email Address</th><th>Delivery Address</th><th>Roles</th><th>Action</th><th>Action</th>
            </tr>
            <c:forEach items="${ticketUsers}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${fn:substringAfter(user.password, '{noop}')}</td>
                    <td>${user.fullname}</td>
                    <td>${user.email}</td>
                    <td>${user.delivery}</td>
                    <td>
                        <c:forEach items="${user.roles}" var="role" varStatus="status">
                            <c:if test="${!status.first}">, </c:if>
                            ${role.role}
                        </c:forEach>
                    </td>
                    <td>
                        [<a href="<c:url value="/user/updateUser/${user.username}" />">Update</a>]
                    </td>
                    <td>
                        [<a href="<c:url value="/user/delete/${user.username}" />">Delete</a>]
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>