<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "LOGIN" %>
</h1>
<br/>
<form action="controller" method="POST">
    <label style="display: block; margin-bottom: 12px">
        <span style="display: inline-block; width: 100px">Account:</span> <input type="text" name="account_id"/>
    </label>
    <label style="display: block; margin-bottom: 12px">
        <span style="display: inline-block; width: 100px">Password:</span> <input type="password" name="psw"/>
    </label>
    <label style="width: 250px; display: flex; justify-content: space-around; margin-top: 25px">
        <input type="submit" name="action" value="Login" style="width: 70px; height: 30px; border-radius: 5px; background-color: green; color: white"/>
        <input type="reset" style="width: 70px; height: 30px; border-radius: 5px"/>
    </label>
</form>
</body>
</html>