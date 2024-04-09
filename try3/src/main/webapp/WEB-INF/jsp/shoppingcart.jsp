<!-- shoppingcart.jsp -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
</head>
<body>
<h1>Shopping Cart</h1>

<table border="1">
    <tr>
        <th>Book Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
    </tr>
    <c:set var="totalPrice" value="0" />
    <c:forEach var="item" items="${cart}">
        <tr>
            <td>${item.name}</td>
            <td>${item.price}</td>
            <td>${item.quantity}</td>
            <td>${item.price * item.quantity}</td>
            <td>
                <a href="removefromcart/${item.id}">Remove</a> <!-- Modify this line to send a request to remove the item -->
            </td>
            <c:set var="totalPrice" value="${totalPrice + (item.price * item.quantity)}" />
        </tr>
    </c:forEach>
    <tr>
        <td colspan="3"><b>Total:</b></td>
        <td>${totalPrice}</td>
        <td></td>
    </tr>
</table>

<a href="/OnlineBookStore/index"><button>Continue Shopping</button></a>
<a href="/OnlineBookStore/pay"><button>Pay</button></a> <!-- Added Pay button -->
</body>
</html>
