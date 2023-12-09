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
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {

    public static void main(String[] args) {
        CategoryDAO cDao = new CategoryDAO();
        System.out.println(cDao.getCategoryById(1).toString());
    }

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

    public ArrayList<Category> getCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "Select * From Categories";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Category(rs.getInt("CategoryId"),
                        rs.getString("CategoryName"),
                        rs.getBoolean("Status"),
                        rs.getBoolean("DeleteFlag")));
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public ArrayList<Category> getAllCategoriesPagnition(int offset, int RecordPerPage) {
        CategoryDAO cDao = new CategoryDAO();
        ArrayList<Category> list = new ArrayList<>();
        int count = 0;
        try {
            String sql = "Select * From [Categories] Where DeleteFlag = 0\n";
            HashMap<Integer, Object> setter = new HashMap<>();

            sql += "    Order by CategoryId\n";
            sql += "    offset ? rows\n"
                    + " fetch next ? rows only";

            setter.put(++count, offset);
            setter.put(++count, RecordPerPage);

            PreparedStatement ps = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                ps.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category c = cDao.getCategoryById(rs.getInt("CategoryId"));
                list.add(c);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public int getTotalCategories() {
        try {
            String sql = "Select count(*) From [Categories] Where DeleteFlag = 0\n";
            HashMap<Integer, Object> setter = new HashMap<>();

            PreparedStatement ps = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                ps.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public void insertCategory(Category category) {
        try {
            String sql = "INSERT INTO [dbo].[Categories]\n"
                    + "           ([CategoryName]\n"
                    + "           ,[Status]\n"
                    + "           ,[DeleteFlag])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, category.getCategoryName());
            ps.setBoolean(2, category.getStatus());
            ps.setBoolean(3, category.getDeleteFlag());
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateCategory(Category category) {
        try {
            String sql = "UPDATE [dbo].[Categories]\n"
                    + "   SET [CategoryName] = ?\n"
                    + " WHERE CategoryId = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, category.getCategoryName());
            ps.setInt(2, category.getCategoryId());
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

}
