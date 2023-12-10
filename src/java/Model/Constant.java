/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author dell
 */
public class Constant {

    public static final int RoleAdmin = 1;
    public static final int RoleCustomer = 2;
    public static final int RoleAdminSale = 3;

    public static final int GenderMale = 1;
    public static final int GenderFemale = 0;

    public static final boolean StatusActive = true;
    public static final boolean StatusDeactive = false;

    public static final boolean DeleteTrue = true;
    public static final boolean DeleteFalse = false;

    //Paginator
    public static final int RecordPerPage = 6;

    public static String DefaultAvatar = "https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png";
    public static String DefaultPassword = "12345678@";

    //Actions
//    public static final char Create = 'C';
//    public static final char Update = 'U';
//    public static final char Delete = 'D';
    public static final String Create = "C";
    public static final String Update = "U";
    public static final String Delete = "D";
    public static final String UpdateStatus = "US";
}
