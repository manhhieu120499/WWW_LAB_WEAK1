package iuh.fit.week01_lab_vomanhhieu_21097401.services;

import iuh.fit.week01_lab_vomanhhieu_21097401.entities.Account;
import iuh.fit.week01_lab_vomanhhieu_21097401.entities.Role;
import iuh.fit.week01_lab_vomanhhieu_21097401.repositories.RoleRepository;

import java.util.List;

public class RoleService {
    private RoleRepository roleRepository;

    public RoleService() {
        roleRepository = new RoleRepository();
    }

    public List<Account> getAccountsOfRole(String roleName) {
        return roleRepository.getAccountsOfRole(roleName);
    }

    public Role getRoleOfAccount(String accountId) {
        return roleRepository.getRoleOfAccount(accountId);
    }

    public Role getRole(String name) {
        return roleRepository.getRole(name);
    }


}
