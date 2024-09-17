package iuh.fit.week01_lab_vomanhhieu_21097401.controllers;

import iuh.fit.week01_lab_vomanhhieu_21097401.entities.*;
import iuh.fit.week01_lab_vomanhhieu_21097401.services.AccountService;
import iuh.fit.week01_lab_vomanhhieu_21097401.services.LogService;
import iuh.fit.week01_lab_vomanhhieu_21097401.services.RoleService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;
import java.time.ZoneId;
import java.util.List;

@WebServlet(name = "ControllerServlet", value = "/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action").toLowerCase();
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        AccountService serviceAccount = new AccountService();
        RoleService serviceRole = new RoleService();
        LogService serviceLog = new LogService();
        switch (action){
            case "login": {
                String acc = req.getParameter("account_id");
                String password = req.getParameter("psw");
                if(acc != null && password != null){
                    Account account = serviceAccount.getAccount(acc);
                    Role role = serviceRole.getRoleOfAccount(acc);
                    if(account != null && role != null){
                        // set data to session
                        session.setAttribute("accountId", account.getAccountId());
                        session.setAttribute("accountName", account.getFullName());
                        session.setAttribute("accountEmail", account.getEmail());
                        session.setAttribute("accountPhone", account.getPhone());
                        session.setAttribute("accountStatus",
                                account.getStatus() == 1 ? "active" : account.getStatus() == 0 ? "deactive": "delete");
                        session.setAttribute("role", role.getDescription());
                        // write log
                        Log logAccount = new Log(account.getAccountId(), Instant.now(), Instant.now(), "");
                        serviceLog.writeLog(logAccount);
                        // check role to redirect to page
                        if(role.getRoleId().equals("admin")){
                            List<Account> listAccount = serviceRole.getAccountsOfRole("user");
                            session.setAttribute("listAccount", listAccount);
                            resp.sendRedirect("views/dashboard.jsp");
                        }else {
                            resp.sendRedirect("views/account_detail.jsp");
                        }
                    }else {
                        out.println("<h1>Account not exists</h1>");
                    }
                }else {
                    out.println("<h1>Please enter information</h1>");
                }
                break;
            }
            case "add": {
                String accountId = req.getParameter("accountId");
                String fullname = req.getParameter("fullname");
                String password = req.getParameter("password");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");
                String status = req.getParameter("status");

                if(accountId != null && fullname != null && password != null
                        && email != null && phone != null && status != null){
                    Account acc = new Account(accountId, fullname, password, email, phone, Byte.parseByte(status));
                    Role role = serviceRole.getRole("user");
                    GrantAccessId id = new GrantAccessId(role.getRoleId(), acc.getAccountId());
                    GrantAccess grantAccess = new GrantAccess(id, role, acc, true, " ");
                    if(serviceAccount.addAccount(acc, grantAccess)) {
                        session.setAttribute("listAccount", serviceRole.getAccountsOfRole("user"));
                        resp.sendRedirect("views/dashboard.jsp");
                    }else {
                        out.println("<h1>Add account failed</h1>");
                    }
                }else {
                    out.println("<h1>Please enter information</h1>");
                }

                break;
            }
            case "delete": {
                String accId = req.getParameter("accountId");
                System.out.println(accId);
                if(accId != null) {
                    if(serviceAccount.deleteAccount(accId)){
                        session.setAttribute("listAccount", serviceRole.getAccountsOfRole("user"));
                        resp.sendRedirect("views/dashboard.jsp");
                    }else {
                        out.println("<h1>Delete account not success</h1>");
                    }
                }
                break;
            }
            case "logout": {
                String accountId = req.getParameter("accountId");
                Log log = serviceLog.getLog(accountId);
                log.setLogoutTime(Instant.now());
                serviceLog.updateLog(log);
                resp.sendRedirect("index.jsp");
                break;
            }
            case "update": {
                String accountId = req.getParameter("accountId");
                if (accountId != null) {
                    Account acc = serviceAccount.getAccount(accountId);
                    System.out.println(acc);
                    session.setAttribute("acc", acc);
                    resp.sendRedirect("views/updateAccount.jsp");
                }else {
                    out.println("<h1>Account not exists</h1>");
                }
                break;
            }
            case "save": {
                String fullname = req.getParameter("fullname");
                String accId = req.getParameter("accountId");
                String password = req.getParameter("password");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");
                String status = req.getParameter("status");

                if(accId != null && fullname != null && password != null && email != null && phone != null && status != null){
                    Account acc = new Account(accId, fullname, password, email, phone, Byte.parseByte(status));
                    if(serviceAccount.updateAccount(acc)){
                        session.setAttribute("listAccount", serviceRole.getAccountsOfRole("user"));
                        resp.sendRedirect("views/dashboard.jsp");
                    }else {
                        out.println("<h1>Update account failed</h1>");
                    }
                }else {
                    out.println("<h1>Can't update account because not enough info</h1>");
                }
                break;
            }
        }
    }


}
