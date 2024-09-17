<%@ page import="iuh.fit.week01_lab_vomanhhieu_21097401.entities.Account" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Mạnh Hiếu
  Date: 9/8/2024
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>

    <h1>Dashboard</h1>
    <p>AccountId: <%= request.getSession().getAttribute("accountId").toString()%></p>
    <p>Name: <%= request.getSession().getAttribute("accountName").toString()%></p>
    <p>Email: <%= request.getSession().getAttribute("accountEmail").toString()%></p>
    <p>Phone: <%= request.getSession().getAttribute("accountPhone").toString()%></p>
    <p>Status: <%= request.getSession().getAttribute("accountStatus").toString()%></p>
    <p>Role: <%= request.getSession().getAttribute("role").toString()%></p>

    <%!
        String renderUserToTable(HttpSession session) {
            StringBuilder result = new StringBuilder();
            List<Account> listAccounts = (List<Account>) session.getAttribute("listAccount");
            for (Account listAccount : listAccounts) {
                StringBuilder html = new StringBuilder();
                String status = listAccount.getStatus() == 1 ? "active" :
                        listAccount.getStatus() == 0 ? "deactive" : "delete";
                html.append("<tr>");
                html.append("<td>").append(listAccount.getAccountId()).append("</td>");
                html.append("<td>").append(listAccount.getFullName()).append("</td>");
                html.append("<td>").append(listAccount.getEmail()).append("</td>");
                html.append("<td>").append(listAccount.getPhone()).append("</td>");
                html.append("<td>").append(status).append("</td>");
                html.append("<td>" + "user role" + "</td>");
                html.append("<td>");
                html.append("<form action=\"..\\controller\" method=\"POST\" style=\"display: flex;justify-content: space-around; align-items: center; margin: 6px\" id=");
                html.append(listAccount.getAccountId());
                html.append("\">");
                html.append("<input type=\"submit\" name=\"action\" value=\"add\" />");
                html.append("<input type=\"submit\" name=\"action\" value=\"update\" />");
                html.append("<input type=\"submit\" name=\"action\" value=\"delete\" />");
                html.append("<input type=\"hidden\" name=\"accountId\"value=").append(listAccount.getAccountId()).append(" />");
                html.append("</form>");
                html.append("</td>");
                html.append("</tr>");
                result.append(html.toString());
            }
            return result.toString();
        }



    %>

    <div style="display: flex; justify-content: space-between; width: 80%; align-items: center">
        <h3>Table user</h3>
        <a href="createAccount.jsp" style="
            display: block;
            width: 120px;
            height: 30px;
            background-color: cornflowerblue;
            color: white;
            text-align: center;
            line-height: 30px;
            text-decoration: none;
            font-size: 16px;
            border-radius: 8px;
        "
        >Add Account</a>
    </div>
    <table border="1" width="80%">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Status</th>
            <th>Role</th>
            <th>Option</th>
        </tr>
        <tbody>
            <%=renderUserToTable(session)%>
        </tbody>
    </table>
    <form action="../controller" method="POST"
    >
        <label>
            <input type="submit" name="action" value="Logout" style="
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
                margin-top: 50px;"/>
        </label>
        <label>
            <input type="hidden" name="accountId" value=<%=request.getSession().getAttribute("accountId").toString()%> />
        </label>
    </form>
</body>
</html>
