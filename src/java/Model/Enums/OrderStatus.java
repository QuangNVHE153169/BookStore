/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Enum.java to edit this template
 */
package Model.Enums;

/**
 *
 * @author Admin
 */
public enum OrderStatus {
    PENDING(1),
    CANCELED(2),
    ACCEPTED(3);
    
    private final int status;

    // Constructor for enum with a value
    OrderStatus(int status) {
        this.status = status;
    }

    // Getter method to retrieve the value
    public int getStatusValue() {
        return status;
    }
}
