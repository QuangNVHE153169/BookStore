/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Publisher {

    int publisherId;
    String publisherName;
    String country;
    int foundedYear;
    Boolean deleteFlag;

    public Boolean getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public Publisher(String publisherName, String country, int foundedYear, Boolean deleteFlag) {
        this.publisherName = publisherName;
        this.country = country;
        this.foundedYear = foundedYear;
        this.deleteFlag = deleteFlag;
    }

    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getFoundedYear() {
        return foundedYear;
    }

    public void setFoundedYear(int foundedYear) {
        this.foundedYear = foundedYear;
    }

    public Publisher() {
    }

    public Publisher(int publisherId, String publisherName, String country, int foundedYear, Boolean deleteFlag) {
        this.publisherId = publisherId;
        this.publisherName = publisherName;
        this.country = country;
        this.foundedYear = foundedYear;
        this.deleteFlag = deleteFlag;
    }

    @Override
    public String toString() {
        return "Publisher{" + "publisherId=" + publisherId + ", publisherName=" + publisherName + ", country=" + country + ", foundedYear=" + foundedYear + ", deleteFlag=" + deleteFlag + '}';
    }

}
