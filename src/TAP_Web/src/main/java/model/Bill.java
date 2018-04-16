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
public class Bill {
    private String idBill;
    private String login;
    private String period;
    private int totalPrice;
    private String date;
    private int billNumber;

    public Bill(String idBill, String login, String period, int totalPrice, String date, int billNumber) {
        this.idBill = idBill;
        this.login = login;
        this.period = period;
        this.totalPrice = totalPrice;
        this.date = date;
        this.billNumber = billNumber;
    }


    public int getTotalPrice() {
        return totalPrice;
    }

    public String getDate() {
        return date;
    }

    public int getBillNumber() {
        return billNumber;
    }
    
    
}
