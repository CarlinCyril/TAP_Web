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
public class Nursery {
    private String idNursery;
    private String startTime;
    private String endTime;
    private int price;

    public Nursery(String idNursery, String startTime, String endTime, int price) {
        this.idNursery = idNursery;
        this.startTime = startTime;
        this.endTime = endTime;
        this.price = price;
    }

    public String getIdNursery() {
        return idNursery;
    }

    public void setIdNursery(String idNursery) {
        this.idNursery = idNursery;
    }



    public String getStartTime() {
        return startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public int getPrice() {
        return price;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
}
