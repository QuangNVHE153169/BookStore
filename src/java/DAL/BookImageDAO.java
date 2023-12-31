/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.BookImage;
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
public class BookImageDAO extends DBContext {

    public void insert(BookImage bi) {
        try {
            String sql = "INSERT INTO [dbo].[BookImages]\n"
                    + "           ([BookId]\n"
                    + "           ,[Url]\n"
                    + "           ,[DeleteFlag])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, bi.getBookId());
            stm.setString(2, bi.getUrl());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<BookImage> getImagesByBookId(int id) {
        ArrayList<BookImage> list = new ArrayList<>();
        try {
            String sql = "Select * FROM BookImages Where BookId = ? and DeleteFlag = 0";
            PreparedStatement ps = connection.prepareStatement(sql);
            try {
                ps.setInt(1, id);
            } catch (SQLException ex) {
                Logger.getLogger(BookImageDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookImage image = new BookImage();
                image.setBookId(rs.getInt("BookId"));
                image.setImageId(rs.getInt("ImageId"));
                image.setUrl(rs.getString("Url"));
                image.setDeleteFlag(rs.getBoolean("DeleteFlag"));

                list.add(image);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public BookImage getLatestImageByBookId(int id) {
        try {
            String sql = "Select * FROM BookImages Where BookId = ? and DeleteFlag = 0 Order by ImageId";
            PreparedStatement ps = connection.prepareStatement(sql);
            try {
                ps.setInt(1, id);
            } catch (SQLException ex) {
                Logger.getLogger(BookImageDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookImage image = new BookImage();
                image.setBookId(rs.getInt("BookId"));
                image.setImageId(rs.getInt("ImageId"));
                image.setUrl(rs.getString("Url"));
                image.setDeleteFlag(rs.getBoolean("DeleteFlag"));

                return image;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static void main(String[] args) {
        BookImageDAO biDao = new BookImageDAO();

        BookImage bi = new BookImage(10, "images/7d71dbe1-0186-46bb-8b5c-7c75f899d737.png");
        biDao.insert(bi);
    }

    public void deleteImageByBookId(int bookId) {
        try {
            String sql = "UPDATE [dbo].[BookImages]\n"
                    + "   SET [DeleteFlag] = 1\n"
                    + " WHERE BookId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bookId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
