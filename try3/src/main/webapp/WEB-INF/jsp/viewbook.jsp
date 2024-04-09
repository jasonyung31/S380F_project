<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Book</title>
</head>
<body>
<h1>View Book</h1>

<!-- Display Cover Photo if available -->
<c:if test="${not empty book.photoFileName}">
    <img src="/OnlineBookStore/book/photo/${book.id}" alt="Book Cover" style="max-width: 300px; max-height: 300px;">
</c:if>


<p>Book Name: ${book.name}</p>
<p>Book Author: ${book.author}</p>
<p>Price of the Book: $${book.price}</p>
<p>Description Text of the Book: ${book.description}</p>
<p>Availability of the Book: ${book.availability}</p>

<!-- Display Comments -->
<p>Comments:</p>
<c:if test="${not empty book.comments}">
    <ul>
        <c:forEach var="comment" items="${book.comments}" varStatus="status">
            <li>${comment}
                <a href="/OnlineBookStore/editcomment/${book.id}/${status.index}">Edit</a>
                <a href="/OnlineBookStore/deletecomment/${book.id}/${status.index}">Delete</a>
            </li>
        </c:forEach>
    </ul>
</c:if>

<!-- Add Comment Form -->
<form action="/OnlineBookStore/addcomment/${book.id}" method="post">
    <label for="newComment">Add Comment:</label>
    <input type="text" id="newComment" name="newComment">
    <input type="submit" value="Add">
</form>

<a href="/OnlineBookStore/editbook/${book.id}"><button>Edit Book</button></a>
<a href="/OnlineBookStore/index"><button>Back to Index Page</button></a>


</body>
</html>
