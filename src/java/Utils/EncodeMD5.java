/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class EncodeMD5 {
    public String EncoderMD5(String input){
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");

            byte[] inputBytes = input.getBytes();
            
            byte[] hashBytes = md.digest(inputBytes);
            
            
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            String md5Hash = sb.toString();
            return md5Hash;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        EncodeMD5 encode = new EncodeMD5();
        System.out.println(encode.EncoderMD5("123@123"));
    }
}
