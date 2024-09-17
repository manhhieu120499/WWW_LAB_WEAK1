package iuh.fit.week01_lab_vomanhhieu_21097401.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "role")
public class Role {
    @Id
    @Column(name = "role_id", nullable = false, length = 50)
    private String roleId;

    @Column(name = "role_name", nullable = false, length = 50)
    private String roleName;

    @Column(name = "description", length = 50)
    private String description;

    @Column(name = "status", nullable = false)
    private Byte status;

    public Role() {}

    public Role(String roleId, String roleName, String description, Byte status) {
        this.roleId = roleId;
        this.roleName = roleName;
        this.description = description;
        this.status = status;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleId='" + roleId + '\'' +
                ", roleName='" + roleName + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                '}';
    }
}