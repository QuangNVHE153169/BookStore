/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author dell
 */
public class User {

    private int userID;
    private String fullName;
    private String phone;
    private String email;
    private String emailID;
    private String password;
    private Date dob;
    private String address;
    private String avatar;
    private Role role;
    private boolean status;
    private String description;
    private String gender;

    public User() {
    }

    public User(int customerId, String fullName, String phone, String email, Date dob, String address, String avatar, Role role, boolean status, String description) {
        this.userID = customerId;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.dob = dob;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.status = status;
        this.description = description;
    }
    
    public User(int customerId, String fullName, String phone, String email, Date dob, String address, String avatar, Role role, boolean status, String description, String gender) {
        this.userID = customerId;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.dob = dob;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.status = status;
        this.description = description;
        this.gender = gender;
    }

    public User(int customerId, String fullName, String phone, String email, String emailID, Date dob, String address, String avatar, Role role, boolean status, String description) {
        this.userID = customerId;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.emailID = emailID;
        this.dob = dob;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.status = status;
        this.description = description;
    }

    public User(int userID, String fullName, String phone, String email, String emailID, String password, Date dob, String address, String avatar, Role role, boolean status, String description, String gender) {
        this.userID = userID;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.emailID = emailID;
        this.password = password;
        this.dob = dob;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.status = status;
        this.description = description;
        this.gender = gender;
    }

    public User(int userID, String fullName, String phone, String email, String emailID, Date dob, String address, String avatar, Role role, boolean status, String description, String gender) {
        this.userID = userID;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.emailID = emailID;
        this.dob = dob;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.status = status;
        this.description = description;
        this.gender = gender;
    }
    
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailID() {
        return emailID;
    }

    public void setEmailID(String emailID) {
        this.emailID = emailID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", fullName=" + fullName + ", phone=" + phone + ", email=" + email + ", emailID=" + emailID + ", password=" + password + ", dob=" + dob + ", address=" + address + ", avatar=" + avatar + ", role=" + role + ", status=" + status + ", description=" + description + ", gender=" + gender + '}';
    }

    
}
