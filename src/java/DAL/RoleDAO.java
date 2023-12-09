/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Role;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class RoleDAO extends DBContext {

    public Role getRoleByID(int roleID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Roles] where RoleId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roleID);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return new Role(roleID, rs.getString("RoleName"), rs.getBoolean("Status"),rs.getBoolean("DeleteFlag"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Role> getRoles() {
        ArrayList<Role> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Roles] where RoleId != 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {
                list.add(getRoleByID(rs.getInt("RoleId")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        RoleDAO rDao = new RoleDAO();
        System.out.println(rDao.getRoles());
    }
}
