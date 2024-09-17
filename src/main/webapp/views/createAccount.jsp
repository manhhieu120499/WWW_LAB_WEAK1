<%--
  Created by IntelliJ IDEA.
  User: Mạnh Hiếu
  Date: 9/13/2024
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Account</title>
</head>
<body>
    <h3>CREATE ACCOUNT</h3>
    <form action="../controller" method="POST" style="width: 300px">
        <label style="display: block; margin-bottom: 12px">
            <span style="display: inline-block; width: 100px">AccountId:</span> <input type="text" name="accountId"/>
        </label>
        <label style="display: block; margin-bottom: 12px">
            <span style="display: inline-block; width: 100px">Fullname: </span> <input type="text" name="fullname"/>
        </label>
        <label style="display: block; margin-bottom: 12px">
            <span style="display: inline-block; width: 100px">Password: </span> <input type="password" name="password"/>
        </label>
        <label style="display: block; margin-bottom: 12px">
            <span style="display: inline-block; width: 100px">Email:</span> <input type="text" name="email"/>
        </label>
        <label style="display: block; margin-bottom: 12px">
            <span style="display: inline-block; width: 100px">Phone:</span> <input type="text" name="phone"/>
        </label>
        <label style="display: block; margin-bottom: 12px">
            <span style="display: inline-block; width: 100px">Status</span> <input type="text" name="status"/>
        </label>
        <label style="display: block; margin-bottom: 12px; margin-left: auto; margin-right: auto; text-align: center">
            <input type="submit" name="action" value="Add" style="width: 80px;
            background-color: green; color: white; text-align: center; border-radius: 8px; height: 30px"/>
        </label>
    </form>
</body>
</html>
