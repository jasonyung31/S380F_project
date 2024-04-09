<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Remove Book</title>
</head>
<body>
<h1>Remove Book</h1>
<form action="remove" method="post">
    <c:if test="${empty books}">
        <p>No books available to remove.</p>
    </c:if>
    <c:if test="${not empty books}">
        <h2>Select books to remove:</h2>
        <ul>
            <c:forEach var="book" items="${books}">
                <li>
                    <label>
                        <input type="checkbox" name="bookIds" value="${book.id}">
                            ${book.name}
                    </label>
                </li>
            </c:forEach>
        </ul>
        <button type="submit">Confirm Removal</button>
    </c:if>
</form>
<a href="index"><button>Back to Index</button></a>
</body>
</html>
