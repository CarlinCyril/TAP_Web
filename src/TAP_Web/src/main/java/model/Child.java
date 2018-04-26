/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author demarquq
 */
public class Child {
    private String idChild;
    private String login;
    private String name;
    private String firstName;
    private String diet;
    private Date birthdate;
    private String gender;
    private String level;
    private ReservationChild reservation = null;

    public Child(String idChild, String login, String name, String firstName, 
            Date birthdate, String gender, String diet, String level) {
        this.idChild = idChild;
        this.login = login;
        this.name = name;
        this.firstName = firstName;
        this.diet = diet;
        this.birthdate = birthdate;
        this.gender = gender;
        this.level = level;
    }

    public void setReservation(ReservationChild reservation) {
        this.reservation = reservation;
    }

    public ReservationChild getReservation() {
        return reservation;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getLogin() {
        return login;
    }

    public String getIdChild() {
        return idChild;
    }

    public void setIdChild(String idChild) {
        this.idChild = idChild;
    }



    public String getName() {
        return name;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getDiet() {
        return diet;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public String getGender() {
        return gender;
    }

    public String getLevel() {
        return level;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setDiet(String diet) {
        this.diet = diet;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setLevel(String level) {
        this.level = level;
    }
    
    
}
