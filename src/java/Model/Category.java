/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Category {

    int categoryId;
    String categoryName;
    Boolean status;
    Boolean deleteFlag;

    public Category(int categoryId, String categoryName, Boolean status, Boolean deleteFlag) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.status = status;
        this.deleteFlag = deleteFlag;
    }

    public Category(String categoryName, Boolean status, Boolean deleteFlag) {
        this.categoryName = categoryName;
        this.status = status;
        this.deleteFlag = deleteFlag;
    }

    public Category() {
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryName=" + categoryName + ", status=" + status + ", deleteFlag=" + deleteFlag + '}';
    }

}
