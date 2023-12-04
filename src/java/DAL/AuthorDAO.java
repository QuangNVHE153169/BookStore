/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Author;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class AuthorDAO extends DBContext {
    public Author getAuthorById(int id) {
        try {
            String sql = "Select * From Authors Where AuthorId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                return new Author(rs.getInt("AuthorId"),
                        rs.getString("AuthorName"),
                        rs.getDate("DOB"),
                        rs.getBoolean("Status"), 
                        rs.getBoolean("DeleteFlag"));
            }
        } catch (SQLException e) {
            
        }
        
        return null;
    }
}
