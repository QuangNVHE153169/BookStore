/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Role;
import Model.User;
import Utils.EncodeMD5;
import com.oracle.wls.shaded.org.apache.regexp.recompile;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.omg.CORBA.AnySeqHelper;

/**
 *
 * @author dell
 */
public class UserDAO extends DBContext {

    public void insertUser(User user) {
        try {
            String sql = "INSERT INTO [Users]\n"
                    + "           ([FullName]\n"
                    + "           ,[Email]\n"
                    + "           ,[Password]\n"
                    + "           ,[Phone]\n"
                    + "           ,[DOB]\n"
                    + "           ,[Address]\n"
                    + "           ,[Gender]\n"
                    + "           ,[DeleteFlag])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getFullName());
            stm.setString(2, user.getEmail());
            stm.setString(3, user.getPassword());
            stm.setString(4, user.getPhone());
            stm.setDate(5, user.getDob());
            stm.setString(6, user.getAddress());
            stm.setNString(7, user.getGender());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public User doLogin(String email, String pwd) {
        try {
            String sql = "SELECT [UserID]\n"
                    + "      ,[FullName]\n"
                    + "      ,[Email]\n"
                    + "      ,[Email_Id]\n"
                    + "      ,[Phone]\n"
                    + "      ,[DOB]\n"
                    + "      ,[Address]\n"
                    + "      ,[Avatar]\n"
                    + "      ,[RoleID]\n"
                    + "      ,[Status]\n"
                    + "      ,[Description]\n"
                    + "  FROM [Users] Where Email = ? and Password = ? and Status = 1;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, pwd);
            ResultSet rs = stm.executeQuery();

            RoleDAO rDao = new RoleDAO();

            if (rs.next()) {

                Role role = rDao.getRoleByID(rs.getInt("RoleID"));

                return new User(rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Email_Id"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        role,
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByID(int userID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Users] where UserID like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();

            RoleDAO rDao = new RoleDAO();

            if (rs.next()) {

                Role role = rDao.getRoleByID(rs.getInt("RoleID"));

                return new User(rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Email_Id"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        role,
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(User user) {
        try {
            String sql = "INSERT INTO [Users]\n"
                    + "           ([FullName]\n"
                    + "           ,[Email]\n"
                    + "           ,[Email_Id]\n"
                    + "           ,[Password]\n"
                    + "           ,[Phone]\n"
                    + "           ,[DOB]\n"
                    + "           ,[Address]\n"
                    + "           ,[Avatar]\n"
                    + "           ,[RoleID]\n"
                    + "           ,[Status]\n"
                    + "           ,[DeleteFlag])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "		  ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getFullName());
            stm.setString(2, user.getEmail());
            stm.setString(3, user.getEmailID());
            stm.setString(4, user.getPassword());
            stm.setString(5, user.getPhone());
            stm.setDate(6, user.getDob());
            stm.setString(7, user.getAddress());
            stm.setString(8, null);
            stm.setInt(9, 3);
            stm.setBoolean(10, true);
            stm.setBoolean(11, false);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUserGoogle(String EmailID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Users] where Email_Id like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, EmailID);
            ResultSet rs = stm.executeQuery();

            RoleDAO rDao = new RoleDAO();

            if (rs.next()) {

                Role role = rDao.getRoleByID(rs.getInt("RoleID"));

                return new User(rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Email_Id"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        role,
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean isUserExist(String email) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Users] where Email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public User getUserByID(int id, boolean status) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Users] where UserID like ? and Status = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setBoolean(2, status);
            ResultSet rs = stm.executeQuery();

            RoleDAO rDao = new RoleDAO();

            if (rs.next()) {

                Role role = rDao.getRoleByID(rs.getInt("RoleID"));

                return new User(rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Email_Id"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        role,
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<User> getAllUsers() {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Users]";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();

            RoleDAO rDao = new RoleDAO();

            ArrayList<User> users = new ArrayList<>();

            while (rs.next()) {

                Role role = rDao.getRoleByID(rs.getInt("RoleID"));
                System.out.println(rs.getInt("RoleID"));

                User user = new User(rs.getInt("UserID"),
                        rs.getNString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Email_Id"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        role,
                        rs.getBoolean("Status"),
                        rs.getString("Description"),
                        rs.getNString("gender"));

                users.add(user);
            }

            return users;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateUser(User user) {
        try {
            String sql = "UPDATE [Users] \n"
                    + "SET Fullname = ?, \n"
                    + "DOB = ?, \n"
                    + "Gender = ?, \n"
                    + "Email = ?, \n"
                    + "Address = ? \n"
                    + "WHERE UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setNString(1, user.getFullName());
            stm.setDate(2, user.getDob());
            stm.setNString(3, user.getGender());
            stm.setString(4, user.getEmail());
            stm.setString(5, user.getAddress());
            stm.setInt(6, user.getUserID());

            int result = stm.executeUpdate();

            if (result > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public boolean changePass(int id, String pass) {
        try {
            String sql = "UPDATE [Users] \n"
                    + "SET Password = ? \n"
                    + "WHERE UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, pass);
            stm.setInt(2, id);

            int result = stm.executeUpdate();

            if (result > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public boolean deleteUserById(int id) {
        try {
            String sql = "UPDATE [dbo].[Users]\n"
                    + "   SET [Status] = ?\n"
                    + "      ,[DeleteFlag] = ?\n"
                    + " WHERE UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, 0);
            stm.setInt(2, 1);
            stm.setInt(3, id);
            int result = stm.executeUpdate();

            if (result > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public void changePassword(String email, String encodeNewPass) {
        try {
            String sql = "UPDATE [dbo].[Users]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE Email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, encodeNewPass);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean isMailExist(String email) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Users]\n"
                    + "  Where Email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int resetPassWord(String email, String newPassword) {
        try {
            String sql = "UPDATE [dbo].[Users]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE Email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newPassword);
            stm.setString(2, email);
            return stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<User> getAllUsers(int offset, int recordsPerPage, String textSearch, int status, int roleID) {
        ArrayList<User> list = new ArrayList<>();
        RoleDAO rDao = new RoleDAO();
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
            String sql = "SELECT *\n"
                    + "  FROM [Users]\n"
                    + "  Where RoleID = ?\n";
            setter.put(++count, roleID);
            if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                sql += " and (FullName like ? or Email like ? or Phone like ? or Address like ?)\n";
                textSearch = "%" + textSearch + "%";
                setter.put(++count, textSearch);
                setter.put(++count, textSearch);
                setter.put(++count, textSearch);
                setter.put(++count, textSearch);
            }
            if (status != -1) {
                sql += " and Status = ?\n";
                setter.put(++count, status);
            }
            sql += "Order by UserID\n"
                    + "  Offset ? row\n"
                    + "  fetch next ? rows only";
            setter.put(++count, offset);
            setter.put(++count, recordsPerPage);
            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role role = rDao.getRoleByID(rs.getInt("RoleID"));

                list.add(new User(rs.getInt("UserID"),
                        rs.getNString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Email_Id"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        role,
                        rs.getBoolean("Status"),
                        rs.getString("Description"),
                        rs.getNString("gender")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalUser(String textSearch, int status, int roleID) {
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
            String sql = "SELECT count(*) as total\n"
                    + "  FROM [Users]\n"
                    + "  Where RoleID = ?\n";
            setter.put(++count, roleID);
            if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                sql += " and (FullName like ? or Email like ? or Phone like ? or Address like ?)\n";
                textSearch = "%" + textSearch + "%";
                setter.put(++count, textSearch);
                setter.put(++count, textSearch);
                setter.put(++count, textSearch);
                setter.put(++count, textSearch);
            }
            if (status != -1) {
                sql += " and Status = ?\n";
                setter.put(++count, status);
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void changeStatus(int userID, boolean status) {
        try {
            String sql = "UPDATE [dbo].[Users]\n"
                    + "   SET [Status] = ?\n"
                    + " WHERE UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, status);
            stm.setInt(2, userID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public static void main(String[] args) {
        UserDAO uDao = new UserDAO();
        EncodeMD5 encode = new EncodeMD5();
        User user = new User();
        user.setFullName("Quang NV");
        user.setPhone("0337498466");
        user.setEmail("quangnvhe153169@fpt.edu.vn");
        user.setPassword(encode.EncoderMD5("123456"));
        user.setAddress("336, Kim Đồng");
        Date dob = Date.valueOf(LocalDate.now());
        user.setDob(dob);
        
        uDao.insert(user);
        System.out.println(uDao.doLogin("email", encode.EncoderMD5("123456")));
    }
}
