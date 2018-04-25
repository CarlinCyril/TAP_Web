/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author cyrilcarlin
 */
public class Activity {

    private String ID_Activity;
    private String name;
    private int price;

    public Activity(String ID_Activity, String name, int price) {
        this.ID_Activity = ID_Activity;
        this.name = name;
        this.price = price;
    }

    public String getID_Activity() {
        return ID_Activity;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
}
