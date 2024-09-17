<%--
  Created by IntelliJ IDEA.
  User: Mạnh Hiếu
  Date: 9/9/2024
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account Detail</title>
</head>
<body>
    <h1>Account Detail</h1>
    <p>AccountId: <%= request.getSession().getAttribute("accountId").toString()%></p>
    <p>Name: <%= request.getSession().getAttribute("accountName").toString()%></p>
    <p>Email: <%= request.getSession().getAttribute("accountEmail").toString()%></p>
    <p>Phone: <%= request.getSession().getAttribute("accountPhone").toString()%></p>
    <p>Status: <%= request.getSession().getAttribute("accountStatus").toString()%></p>
    <p>Role: <%= request.getSession().getAttribute("role").toString()%></p>
    <a href="../index.jsp" style="
                 display: block;
                width: 120px;
                height: 30px;
                border-width: 1px;
                border-style: solid;
                border-color: black;
                color: black;
                text-align: center;
                line-height: 30px;
                text-decoration: none;
                font-size: 16px;
                border-radius: 8px;
                margin-top: 50px;
    "
    >LOGOUT</a>
</body>
</html>
