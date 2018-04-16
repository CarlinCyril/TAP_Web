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
public class NurseryChoices {
    private String Booking;
    private String Nursery;

    public NurseryChoices(String Booking, String Nursery) {
        this.Booking = Booking;
        this.Nursery = Nursery;
    }

    public String getBooking() {
        return Booking;
    }

    public String getNursery() {
        return Nursery;
    }

    public void setBooking(String Booking) {
        this.Booking = Booking;
    }

    public void setNursery(String Nursery) {
        this.Nursery = Nursery;
    }
    
}
