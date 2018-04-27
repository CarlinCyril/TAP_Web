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
public class Bill {
    private String idBill;
    private String login;
    private String period;
    private int totalPrice;
    private Date date;
    private int billNumber;
    private String IdBooking;

    public Bill(String idBill, int billNumber, int totalPrice, String period, String login, String IdBooking) {
        this.idBill = idBill;
        this.login = login;
        this.period = period;
        this.totalPrice = totalPrice;
        this.billNumber = billNumber;
        this.IdBooking = IdBooking;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getIdBill() {
        return idBill;
    }

    public String getLogin() {
        return login;
    }

    public String getPeriod() {
        return period;
    }

    public String getIdBooking() {
        return IdBooking;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public Date getDate() {
        return date;
    }

    public int getBillNumber() {
        return billNumber;
    }
    
    
}
