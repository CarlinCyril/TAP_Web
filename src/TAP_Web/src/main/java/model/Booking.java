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
public class Booking {
    public String idBooking;
    public Integer cafeteriaDays;
    public String idChild;
    public String login;
    public String diet;

    public Booking(String idBooking, Integer cafeteriaDays, String idChild, String login, String diet) {
        this.idBooking = idBooking;
        this.cafeteriaDays = cafeteriaDays;
        this.idChild = idChild;
        this.login = login;
        this.diet = diet;
    }

    public void setCafeteriaDays(Integer cafeteriaDays) {
        this.cafeteriaDays = cafeteriaDays;
    }

    public void setDiet(String diet) {
        this.diet = diet;
    }

    public void setIdBooking(String idBooking) {
        this.idBooking = idBooking;
    }

    public void setIdChild(String idChild) {
        this.idChild = idChild;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public Integer getCafeteriaDays() {
        return cafeteriaDays;
    }

    public String getDiet() {
        return diet;
    }

    public String getIdBooking() {
        return idBooking;
    }

    public String getIdChild() {
        return idChild;
    }

    public String getLogin() {
        return login;
    }
}
