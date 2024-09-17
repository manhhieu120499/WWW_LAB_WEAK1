package iuh.fit.week01_lab_vomanhhieu_21097401.services;

import iuh.fit.week01_lab_vomanhhieu_21097401.entities.Account;
import iuh.fit.week01_lab_vomanhhieu_21097401.entities.GrantAccess;
import iuh.fit.week01_lab_vomanhhieu_21097401.repositories.AccountRepository;

import java.sql.SQLException;

public class AccountService {
    private AccountRepository accountRepository;
    public AccountService() {
        accountRepository = new AccountRepository();
    }
    public Account getAccount(String id) {
        return accountRepository.getAccount(id);
    }
    public boolean deleteAccount(String id){
        return accountRepository.deleteAccount(id);
    }
    public boolean addAccount(Account account, GrantAccess grantAccess) {
        return accountRepository.addAccount(account, grantAccess);
    }
    public boolean updateAccount(Account account) {
        return accountRepository.updateAccount(account);
    }
}
