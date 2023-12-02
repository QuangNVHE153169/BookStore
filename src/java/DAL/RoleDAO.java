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
                    + "  FROM [Role] where RoleID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roleID);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return new Role(roleID, rs.getString("RoleName"), rs.getBoolean("deleteFlag"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
