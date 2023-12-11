/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class PaymentMethod {
    private int paymentMethodId;
    private String paymentMethodName;
    private Boolean status;
    private Boolean deleteFlag;

    public PaymentMethod() {
    }

    public PaymentMethod(int paymentMethodId, String paymentMethodName, Boolean status, Boolean deleteFlag) {
        this.paymentMethodId = paymentMethodId;
        this.paymentMethodName = paymentMethodName;
        this.status = status;
        this.deleteFlag = deleteFlag;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public String getPaymentMethodName() {
        return paymentMethodName;
    }

    public void setPaymentMethodName(String paymentMethodName) {
        this.paymentMethodName = paymentMethodName;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Boolean getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    @Override
    public String toString() {
        return "PaymentMethod{" + "paymentMethodId=" + paymentMethodId + ", paymentMethodName=" + paymentMethodName + ", status=" + status + ", deleteFlag=" + deleteFlag + '}';
    }
    
    
}
