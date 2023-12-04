/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import Model.Publisher;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
class PublisherDAO extends DBContext {
    public Publisher getPublisherById(int id) {
        try {
            String sql = "Select * From Publishers Where PublisherId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                return new Publisher(rs.getInt("PublisherId"),
                        rs.getString("PublisherName"),
                        rs.getString("Country"), 
                        rs.getInt("FoundedYear"),
                        rs.getBoolean("DeleteFlag"));
            }
        } catch (SQLException e) {
            
        }
        
        return null;
    }
}