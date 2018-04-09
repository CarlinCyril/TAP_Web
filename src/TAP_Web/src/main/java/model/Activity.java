/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author cyrilcarlin
 */
public class Activity {
    private String name;
    private String level;
    private int price;

    public Activity(String name, String level, int price) {
        this.name = name;
        this.level = level;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public String getLevel() {
        return level;
    }

    public int getPrice() {
        return price;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
}
