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
            BookImage image = new BookImage();
            while (rs.next()) {
                image.setBookId(rs.getInt("BookId"));
                image.setImageId(rs.getInt("ImageId"));
                image.setUrl(rs.getNString("Url"));
                image.setDeleteFlag(rs.getBoolean("DeleteFlag"));
                
                list.add(image);
            }
        } catch (SQLException e) {
            
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
                image.setUrl(rs.getNString("Url"));
                image.setDeleteFlag(rs.getBoolean("DeleteFlag"));
                
                return image;
            }
        } catch (SQLException e) {
            
        }
        
        return null;
    }
}