<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form>
    <p>Calculator</p>
    <div class="d-flex">
        <label for="firstOperand">First operand</label>
        <input type="number" id="firstOperand" name="firstOperand" value="firstOperand">
    </div>
    <div class="d-flex">
        <label for="operator">Operator</label>
        <select name="operator" id="operator">
            <option value="addition" name="addition">Addition</option>
            <option value="minus" name="minus">Minus</option>
            <option value="plus" name="plus">Plus</option>
            <option value="divide" name="divide">Divide</option>
        </select>
    </div>
    <div class="d-flex">
        <label for="secondOperand">First operand</label>
        <input type="number" id="secondOperand" name="secondOperand" value="secondOperand">
    </div>
</form>
</body>
</html>