/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author dell
 */
public class Role {

    private int id;
    private String name;
    private boolean status;
    private boolean deleteFlag;

    public Role(int id, String name, boolean status, boolean deleteFlag) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.deleteFlag = deleteFlag;
    }

    public Role(int id, String name, boolean deleteFlag) {
        this.id = id;
        this.name = name;
        this.deleteFlag = deleteFlag;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Role() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    @Override
    public String toString() {
        return "Role{" + "id=" + id + ", name=" + name + ", status=" + status + ", deleteFlag=" + deleteFlag + '}';
    }

}
