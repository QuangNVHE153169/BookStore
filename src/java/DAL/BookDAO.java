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

    public int getLatestBook() {
        try {
            String sql = "Select * FROM [dbo].[Books]\n"
                    + " Order by BookId desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("BookId");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public int getTotalPage(BookBinding binding) {
        int totalRecord = 0;
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
            String sql = "Where DeleteFlag = 0";

            if (binding.getAuthorId() > 0) {
                sql += "  and AuthorId = ?";
                setter.put(++count, binding.getAuthorId());
            }
            if (binding.getCategoryID() > 0) {
                sql += " and CategoryId = ?";
                setter.put(++count, binding.getCategoryID());
            }
            if (binding.getPublisherID() > 0) {
                sql += " and PublisherId = ?";
                setter.put(++count, binding.getPublisherID());
            }
            if (!binding.getTextSearch().isEmpty() && !binding.getTextSearch().equalsIgnoreCase("")) {
                String textSearch = "%" + binding.getTextSearch() + "%";
                sql += " and Title like ?";
                setter.put(++count, textSearch);
            }
            if (binding.getStatus() > 0) {
                sql += " and Status = ?";
                setter.put(++count, binding.getStatus());
            }
            sql = "Select * from Books " + sql;
            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                totalRecord++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return (int) Math.ceil((double) totalRecord / Constant.RecordPerPage);
    }

    public Boolean softDeleteBook(int id) {
        try {
            String sql = "UPDATE [dbo].[Books]\n"
                    + "   SET [DeleteFlag] = 1,\n"
                    + "       [Status] = 0\n"
                    + " WHERE BookId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            int result = ps.executeUpdate();

            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
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

    public Boolean update(Book book) {
        try {
            String sql = "UPDATE [Books] SET \n"
                    + "Price = ?, \n"
                    + "PageCount = ?, \n"
                    + "CategoryId = ?, \n"
                    + "PublicationYear = ?, \n"
                    + "Description = ?, \n"
                    + "Quantity = ? \n"
                    + "WHERE BookId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setDouble(1, book.getPrice());
            stm.setInt(2, book.getPageCount());
            stm.setInt(3, book.getCategoryId());
            stm.setInt(4, book.getPublicationYear());
            stm.setNString(5, book.getDescription());
            stm.setInt(6, book.getQuantity());
            stm.setInt(7, book.getBookId());

            int result = stm.executeUpdate();

            if (result > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public Book getBookById(int id) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Books] where BookId like ? and DeleteFlag = 0";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            AuthorDAO auDao = new AuthorDAO();
            PublisherDAO puDao = new PublisherDAO();
            CategoryDAO cDao = new CategoryDAO();
            BookImageDAO biDao = new BookImageDAO();

            if (rs.next()) {

                Book book = new Book(rs.getInt("BookId"),
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
                        biDao.getLatestImageByBookId(rs.getInt("BookId")));

                //get book image
                book.setImages(biDao.getImagesByBookId(book.getBookId()));
                book.setAuthor(auDao.getAuthorById(rs.getInt("AuthorId")));
                book.setPublisher(puDao.getPublisherById(rs.getInt("PublisherId")));
                book.setCategory(cDao.getCategoryById(rs.getInt("CategoryId")));

                return book;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Book getBookDetailById(int id) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Books] where BookId like ? and DeleteFlag = 0";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            BookImageDAO biDao = new BookImageDAO();
            AuthorDAO auDao = new AuthorDAO();
            PublisherDAO puDao = new PublisherDAO();
            CategoryDAO cDao = new CategoryDAO();

            if (rs.next()) {
                Book book = new Book();
                book = getBookById(rs.getInt("BookId"));
                book.setAuthor(auDao.getAuthorById(rs.getInt("AuthorId")));
                book.setPublisher(puDao.getPublisherById(rs.getInt("PublisherId")));
                book.setCategory(cDao.getCategoryById(rs.getInt("CategoryId")));

                return book;
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
                sql += " and PublisherId = ?";
                setter.put(++count, binding.getPublisherID());
            }
            if (binding.getStatus() > 0) {
                sql += " and Status = ?";
                setter.put(++count, binding.getStatus());
            }
            if (!binding.getTextSearch().isEmpty() && !binding.getTextSearch().equalsIgnoreCase("")) {
                String textSearch = "%" + binding.getTextSearch() + "%";
                sql += " and Title like ?";
                setter.put(++count, textSearch);
            }

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

            if (pageNumber <= 0) {
                pageNumber = 1;
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
        BookBinding binding = new BookBinding(1, 1, 1, 1, "", 1000000, 1);
//        Book book = new Book();
//        book.setPrice(1);
//        book.setPageCount(1);
//        book.setCategoryId(1);
//        book.setPublicationYear(1);
//        book.setDescription("");
//        book.setQuantity(100);
//        book.setBookId(31);
//        bDao.softDeleteBook(3);
//        Book book = new Book("quangnv", 12343, 1234, 1, 1, 1, 1, 1, "abcd");
//        bDao.update(book);
//        System.out.println(bDao.getBookById(3).toString());
//        BookBinding test = new BookBinding();
//        test.setAuthorId(1);
//        System.out.println(test.toString());

        System.out.println(bDao.getTotalPage(binding));
        ArrayList<Book> books = bDao.getBookPaginate(3, 10, binding, -1);
        for (int i = 0; i < 10; i++) {
            System.out.println(books.get(i).toString());
        }
    }

    public ArrayList<Book> getAllBook() {
        BookDAO bDao = new BookDAO();
        ArrayList<Book> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [dbo].[Books] Where Status = 1 and DeleteFlag = 0";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Book book = new Book();
                book = bDao.getBookById(rs.getInt("BookId"));
                list.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
