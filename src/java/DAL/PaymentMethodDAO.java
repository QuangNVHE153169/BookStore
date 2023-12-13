/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.PaymentMethod;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class PaymentMethodDAO extends DBContext {
    
    public PaymentMethod getPaymentMethodById(int id) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [dbo].[PaymentMethods]\n"
                    + "  Where PaymentMethodId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                return new PaymentMethod(id, rs.getString("PaymentMethodName"), rs.getBoolean("Status"), rs.getBoolean("DeleteFlag"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentMethodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
