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
    public String[] cafeteriaDays;
    public String diet;
    public String idBooking;
    public String idChild;
    public String login;

    public Booking(String[] cafeteriaDays, String diet, String idBooking, String idChild, String login) {
        this.cafeteriaDays = cafeteriaDays;
        this.diet = diet;
        this.idBooking = idBooking;
        this.idChild = idChild;
        this.login = login;
    }

    public void setCafeteriaDays(String[] cafeteriaDays) {
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

    public String[] getCafeteriaDays() {
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
