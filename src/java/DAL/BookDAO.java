/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Author;
import Model.Bindings.BookBinding;
import Model.Book;
import Model.BookEnums;
import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Constant;
import Model.Publisher;

/**
 *
 * @author Admin
 */
public class BookDAO extends DBContext {

    public int getTotalPage(int itemPerPage) {
        int totalRow = 0;
        try {
            String sql = "Select COUNT(*) as total FROM [dbo].[Books]\n"
                    + " WHERE DeleteFlag = 0 and Status = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalRow = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return (int) Math.ceil((double) totalRow / itemPerPage);
    }

    public void softDeleteBook(int id) {
        try {
            String sql = "UPDATE [dbo].[Books]\n"
                    + "   SET [DeleteFlag] = 1,\n"
                    + "       [Status] = 0\n"
                    + " WHERE BookId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insert(Book book) {
        try {
            String sql = "INSERT INTO [Books]\n"
                    + "           ([Title]\n"
                    + "           ,[Price]\n"
                    + "           ,[PageCount]\n"
                    + "           ,[Status]\n"
                    + "           ,[Quantity]\n"
                    + "           ,[CategoryId]\n"
                    + "           ,[AuthorId]\n"
                    + "           ,[PublisherId]\n"
                    + "           ,[PublicationYear]\n"
                    + "           ,[Description]\n"
                    + "           ,[DeleteFlag])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,1\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, book.getTitle());
            stm.setDouble(2, book.getPrice());
            stm.setInt(3, book.getPageCount());
            stm.setInt(4, book.getQuantity());
            stm.setInt(5, book.getCategoryId());
            stm.setInt(6, book.getAuthorId());
            stm.setInt(7, book.getPublisherId());
            stm.setInt(8, book.getPublicationYear());
            stm.setNString(9, book.getDescription());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Book getBookById(int id) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Books] where BookId like ? and DeleteFlag = 0";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            BookImageDAO biDao = new BookImageDAO();

            if (rs.next()) {

                return new Book(rs.getInt("BookId"),
                        rs.getString("Title"),
                        rs.getInt("Price"),
                        rs.getInt("PageCount"),
                        rs.getBoolean("Status"),
                        rs.getInt("Quantity"),
                        rs.getInt("CategoryId"),
                        rs.getInt("AuthorId"),
                        rs.getInt("PublisherId"),
                        rs.getInt("PublicationYear"),
                        rs.getString("Description"),
                        rs.getBoolean("DeleteFlag"),
                        biDao.getLatestImageByBookId(rs.getInt("BookId"))
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Book> getBookPaginate(int pageNumber, int recordsPerPage,
            BookBinding binding, int sortOption) {
        ArrayList<Book> list = new ArrayList<>();
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
//            String sql = "SELECT Distinct b.Title\n"
//                    + "FROM [Books] b\n"
//                    + "left join Authors au\n"
//                    + "on au.AuthorId = b.AuthorId\n"
//                    + "left join Categories c\n"
//                    + "on c.CategoryId = b.CategoryId\n"
//                    + "left join Publishers pu\n"
//                    + "on b.PublisherId = pu.PublisherId\n"
//                    + "left join BookImages bi\n"
//                    + "on b.BookId = bi.BookId\n"
//                    + "Where b.Price >= ? and b.Price <= ? and b.DeleteFlag = 0\n";
            String sql = "Where Price >= ? and Price <= ? and DeleteFlag = 0";
            setter.put(++count, binding.getMinPrice());
            setter.put(++count, binding.getMaxPrice());

            if (binding.getAuthorId() > 0) {
                sql += "  and AuthorId = ?";
                setter.put(++count, binding.getAuthorId());
            }
            if (binding.getCategoryID() > 0) {
                sql += " and CategoryId = ?";
                setter.put(++count, binding.getCategoryID());
            }
            if (binding.getPublisherID() > 0) {
                sql += " and PushisherId = ?";
                setter.put(++count, binding.getPublisherID());
            }
            if (!binding.getTextSearch().isEmpty() && !binding.getTextSearch().equalsIgnoreCase("")) {
                String textSearch = "%" + binding.getTextSearch() + "%";
                sql += " and Title like ?";
                setter.put(++count, textSearch);
            }

//            sql = "Select Books.* from Books\n"
//                    + "right join\n"
//                    + "(" + sql;
//
//            sql += ") as pro\n"
//                    + "on pro.Title = Books.Title\n";

            sql = "Select * from Books " + sql;

            switch (sortOption) {
                case BookEnums.BookIdAsc:
                    sql += " order by BookId asc\n";
                    break;
                case BookEnums.TitleAsc:
                    sql += " order by Title asc\n";
                    break;
                case BookEnums.TitleDesc:
                    sql += " order by Title desc\n";
                    break;
                case BookEnums.PriceAsc:
                    sql += " order by Price asc\n";
                    break;
                case BookEnums.PriceDesc:
                    sql += " order by Price desc\n";
                    break;
                default:
                    sql += " order by BookId desc\n";
                    break;
            }
            sql += "  offset ? ROW\n"
                    + "  FETCH Next ? Rows only";

            int maxPage = getTotalPage(recordsPerPage);
            if (pageNumber <= 0) {
                pageNumber = 1;
            }
            if (pageNumber > maxPage) {
                pageNumber = maxPage;
            }
            int offset = (pageNumber - 1) * recordsPerPage;
            setter.put(++count, offset);
            setter.put(++count, recordsPerPage);

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();
            Book book = new Book();
            
            AuthorDAO auDao = new AuthorDAO();
            PublisherDAO puDao = new PublisherDAO();
            CategoryDAO cDao = new CategoryDAO();
            
            while (rs.next()) {
                book = getBookById(rs.getInt("BookId"));
                book.setAuthor(auDao.getAuthorById(rs.getInt("AuthorId")));
                book.setPublisher(puDao.getPublisherById(rs.getInt("PublisherId")));
                book.setCategory(cDao.getCategoryById(rs.getInt("CategoryId")));
                list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        BookDAO bDao = new BookDAO();
        BookBinding binding = new BookBinding(1, 1, 1, "", 0, 1000000);
//        bDao.softDeleteBook(3);
        Book book = new Book("quangnv", 12343, 1234, 1, 1, 1, 1, 1, "abcd");
//        bDao.insert(book);
//        System.out.println(bDao.getBookById(3).toString());
        BookBinding test = new BookBinding();
        test.setAuthorId(1);
//        System.out.println(test.toString());

        System.out.println(bDao.getTotalPage(Constant.RecordPerPage));
        ArrayList<Book> books = bDao.getBookPaginate(1, 10, test, -1);
        for (int i = 0; i < books.size(); i++) {
            System.out.println(books.get(i).toString());
        }
    }
}
