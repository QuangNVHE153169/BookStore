/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
class CategoryDAO extends DBContext {

    public Category getCategoryById(int id) {
        try {
            String sql = "Select * From Categories Where CategoryId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Category(rs.getInt("CategoryId"),
                        rs.getString("CategoryName"),
                        rs.getBoolean("Status"),
                        rs.getBoolean("DeleteFlag"));
            }
        } catch (SQLException e) {

        }

        return null;
    }
    
    public static void main(String[] args) {
        CategoryDAO cDao = new CategoryDAO();
        System.out.println(cDao.getCategoryById(1).toString());
    }
}
