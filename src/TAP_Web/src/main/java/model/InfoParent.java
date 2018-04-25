/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author demarquq
 */
public class InfoParent {
    private String idParents;
    private User user;
    private String name;
    private String firstname;
    private String phoneNumber;
    private String address;

    public InfoParent(String idParents, User user, String name, String firstname, String phoneNumber, String address) {
        this.idParents = idParents;
        this.user = user;
        this.name = name;
        this.firstname = firstname;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public String getIdParents() {
        return idParents;
    }

    public void setIdParents(String idParents) {
        this.idParents = idParents;
    }

    public void setLogin(User user) {
        this.user = user;
    }


    public User getUser() {
        return user;
    }

    public String getName() {
        return name;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
