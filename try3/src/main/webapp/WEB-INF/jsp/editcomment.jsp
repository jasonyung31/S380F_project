<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Comment</title>
</head>
<body>
<h1>Edit Comment</h1>
<form action="/OnlineBookStore/editcomment/${book.id}/${commentIndex}" method="post">
    <label for="editedComment">Edit Comment:</label>
    <input type="text" id="editedComment" name="editedComment" value="${comment}">
    <input type="submit" value="Confirm">
</form>
</body>
</html>
