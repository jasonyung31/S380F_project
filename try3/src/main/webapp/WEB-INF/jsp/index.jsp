<!-- index.jsp -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Store</title>
</head>
<body>
<h1>Book Store</h1>
<a href="addbook"><button>Add Book</button></a>
<c:if test="${not empty books}">
    <h2>Book List:</h2>
    <ul>
        <c:forEach var="book" items="${books}">
            <li>
                <a href="book/${book.id}">${book.name}</a>
                <a href="addtocart/${book.id}"><button>Add to Cart</button></a> <!-- Add to Cart button -->
            </li>
        </c:forEach>
    </ul>
    <!-- Add remove button only if there are books -->
    <c:url value="/removebook" var="removeBookUrl" />
    <c:choose>
        <c:when test="${not empty books}">
            <a href="${removeBookUrl}"><button>Remove Book</button></a>
        </c:when>
    </c:choose>
    <a href="shoppingcart"><button>Checkout</button></a> <!-- Checkout button -->
</c:if>
<c:if test="${empty books}">
    <p>No books available.</p>
</c:if>
</body>
</html>
