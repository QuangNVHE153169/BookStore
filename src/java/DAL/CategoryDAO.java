/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {

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
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Category> getAllCategories() {
        CategoryDAO cDao = new CategoryDAO();
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "Select * From Categories Where DeleteFlag = 0";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category category = cDao.getCategoryById(rs.getInt("CategoryId"));
                list.add(category);
            }
        } catch (SQLException e) {

        }
        return list;
    }
}
