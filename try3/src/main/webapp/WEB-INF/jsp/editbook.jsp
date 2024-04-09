<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <script>
        function validateForm() {
            var price = document.getElementById("price").value;

            // Regular expression to match price with only one decimal place
            var priceRegex = /^\d+(\.\d{1})?$/;

            // Check if price matches the format with only one decimal place
            if (!priceRegex.test(price)) {
                alert("Price should be a number with only one decimal place.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
<h1>Edit Book</h1>
<form action="/OnlineBookStore/editbook/${book.id}" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <label for="name">Book Name:</label>
    <input type="text" id="name" name="name" value="${book.name}"><br>

    <label for="author">Book Author:</label>
    <input type="text" id="author" name="author" value="${book.author}"><br>

    <label for="price">Price of the Book: $</label>
    <input type="text" id="price" name="price" value="${book.price}"><br>

    <label for="description">Description Text of the Book:</label>
    <input type="text" id="description" name="description" value="${book.description}"><br>

    <label for="cover">Cover Photo of the Book:</label>
    <input type="file" id="cover" name="cover"><br>

    <label for="availability">Availability of the Book:</label>
    <input type="text" id="availability" name="availability" value="${book.availability}"><br>

    <label for="comment">Comment:</label>
    <input type="text" id="comment" name="comment" value="${book.comments[0]}"><br>

    <input type="submit" value="Finish">
</form>
</body>
</html>
