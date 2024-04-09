<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Book</title>
    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var author = document.getElementById("author").value;
            var price = document.getElementById("price").value;
            var description = document.getElementById("description").value;
            var cover = document.getElementById("cover").value;
            var availability = document.getElementById("availability").value;

            // Regular expression to match price with only one decimal place
            var priceRegex = /^\d+(\.\d{1})?$/;

            if (name == "" || author == "" || price == "" || description == "" || cover == "" || availability == "") {
                alert("Please fill in all fields");
                return false;
            }

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
<h1>Add Book</h1>
<form action="addbook" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <label for="name">Book Name:</label>
    <input type="text" id="name" name="name"><br>

    <label for="author">Book Author:</label>
    <input type="text" id="author" name="author"><br>

    <label for="price">Price of the Book: $</label>
    <input type="text" id="price" name="price"><br>

    <label for="description">Description Text of the Book:</label>
    <input type="text" id="description" name="description"><br>

    <label for="cover">Cover Photo of the Book:</label>
    <input type="file" id="cover" name="cover"><br>

    <label for="availability">Availability of the Book:</label>
    <input type="text" id="availability" name="availability"><br>

    <label for="comment">Comment:</label>
    <input type="text" id="comment" name="comment"><br>

    <input type="submit" value="Submit">
</form>
</body>
</html>
