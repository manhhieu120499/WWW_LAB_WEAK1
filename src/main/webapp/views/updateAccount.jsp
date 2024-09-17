<%@ page import="iuh.fit.week01_lab_vomanhhieu_21097401.entities.Account" %><%--
  Created by IntelliJ IDEA.
  User: Mạnh Hiếu
  Date: 9/14/2024
  Time: 6:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Account</title>
</head>
<body>
<%
    Account acc = (Account)request.getSession().getAttribute("acc");
%>
<h3>Update Account</h3>
<form action="../controller" method="POST" style="width: 300px">
    <label style="display: block; margin-bottom: 12px">
        <span style="display: inline-block; width: 100px">AccountId:</span> <input type="text" name="accountId" value="<%=acc.getAccountId()%>" readOnly />
    </label>
    <label style="display: block; margin-bottom: 12px">
        <span style="display: inline-block; width: 100px">Fullname: </span> <input type="text" name="fullname" value="<%=acc.getFullName()%>" />
    </label>
    <label style="display: block; margin-bottom: 12px">
        <span style="display: inline-block; width: 100px">Password: </span> <input type="password" name="password" value="<%=acc.getPassword()%>" />
    </label>
    <label style="display: block; margin-bottom: 12px">
        <span style="display: inline-block; width: 100px">Email:</span> <input type="text" name="email" value="<%=acc.getEmail()%>" />
    </label>
    <label style="display: block; margin-bottom: 12px">
        <span style="display: inline-block; width: 100px">Phone:</span> <input type="text" name="phone" value="<%=acc.getPhone()%>" />
    </label>
    <label style="display: block; margin-bottom: 12px">
        <span style="display: inline-block; width: 100px">Status</span> <input type="text" name="status" value="<%=acc.getStatus()%>" />
    </label>
    <label style="display: block; margin-bottom: 12px; margin-left: auto; margin-right: auto; text-align: center">
        <input type="submit" name="action" value="Save" style="width: 80px;
            background-color: green; color: white; text-align: center; border-radius: 8px; height: 30px"/>
    </label>
</form>
</body>
</html>
