/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Author;
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

    public ArrayList<Author> getAuthors() {
        ArrayList<Author> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Authors]\n";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Author(rs.getInt("AuthorId"),
                        rs.getString("AuthorName"),
                        rs.getDate("DOB"),
                        rs.getBoolean("Status"),
                        rs.getBoolean("DeleteFlag")));
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public ArrayList<Author> getAllAuthorsActive() {
        ArrayList<Author> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Authors]\n"
                    + "  Where Status = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Author(rs.getInt("AuthorId"),
                        rs.getString("AuthorName"),
                        rs.getDate("DOB"),
                        rs.getBoolean("Status"),
                        rs.getBoolean("DeleteFlag")));
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public ArrayList<Author> getAllAuthorsPagnition(int offset, int RecordPerPage) {
        ArrayList<Author> list = new ArrayList<>();
        int count = 0;
        try {
            String sql = "Select * From Authors Where DeleteFlag = 0\n";
            HashMap<Integer, Object> setter = new HashMap<>();

            sql += "    Order by AuthorId\n";
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
                list.add(new Author(rs.getInt("AuthorId"),
                        rs.getString("AuthorName"),
                        rs.getDate("DOB"),
                        rs.getBoolean("Status"),
                        rs.getBoolean("DeleteFlag")));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public int getTotalAuthor() {
        try {
            String sql = "Select count(*) From Authors Where DeleteFlag = 0\n";
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

    public static void main(String[] args) {
        AuthorDAO auDao = new AuthorDAO();
        System.out.println(auDao.getAllAuthorsActive());
    }

    public void insertAuthor(Author author) {
        try {
            String sql = "INSERT INTO [dbo].[Authors]\n"
                    + "           ([AuthorName]\n"
                    + "           ,[Status]\n"
                    + "           ,[DOB]\n"
                    + "           ,[DeleteFlag])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, author.getAuthorName());
            ps.setBoolean(2, author.getStatus());
            ps.setDate(3, author.getDob());
            ps.setBoolean(4, author.getDeleteFlag());
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateAuthor(Author author) {
        try {
            String sql = "UPDATE [dbo].[Authors]\n"
                    + "   SET [AuthorName] = ?\n"
                    + "      ,[DOB] = ?\n"
                    + " WHERE AuthorId = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, author.getAuthorName());
            ps.setDate(2, author.getDob());
            ps.setInt(3, author.getAuthorId());
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

}
