/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Author;
import Model.Publisher;
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
public class PublisherDAO extends DBContext {

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

    public ArrayList<Publisher> getPublishers() {
        ArrayList<Publisher> list = new ArrayList<>();
        try {
            String sql = "Select * From Publishers";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Publisher(rs.getInt("PublisherId"),
                        rs.getString("PublisherName"),
                        rs.getString("Country"),
                        rs.getInt("FoundedYear"),
                        rs.getBoolean("DeleteFlag")));
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public ArrayList<Publisher> getAllPublishersPagnition(int offset, int RecordPerPage) {
        PublisherDAO pDao = new PublisherDAO();
        ArrayList<Publisher> list = new ArrayList<>();
        int count = 0;
        try {
            String sql = "Select * From [Publishers] Where DeleteFlag = 0\n";
            HashMap<Integer, Object> setter = new HashMap<>();

            sql += "    Order by PublisherId\n";
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
                Publisher publisher = pDao.getPublisherById(rs.getInt("PublisherId"));
                list.add(publisher);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public int getTotalPublisher() {
        try {
            String sql = "Select count(*) From Publishers Where DeleteFlag = 0\n";
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
        PublisherDAO pDao = new PublisherDAO();
        System.out.println(pDao.getAllPublishersPagnition(0, 3).size());
    }
}
