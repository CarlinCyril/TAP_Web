/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author carlinc
 */
public class ReservationChild {
    private Booking booking;
    private ArrayList<GroupChoices> groups;
    private ArrayList<NurseryChoices> nursery;

    public ReservationChild(Booking booking, ArrayList<GroupChoices> groups, ArrayList<NurseryChoices> nursery) {
        this.booking = booking;
        this.groups = groups;
        this.nursery = nursery;
    }

    public Booking getBooking() {
        return booking;
    }

    public ArrayList<GroupChoices> getGroups() {
        return groups;
    }

    public ArrayList<NurseryChoices> getNursery() {
        return nursery;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public void setGroups(ArrayList<GroupChoices> groups) {
        this.groups = groups;
    }

    public void setNursery(ArrayList<NurseryChoices> nursery) {
        this.nursery = nursery;
    }
    
    public Boolean checkNursery(String IdNursery) {
        for(NurseryChoices nurseryGroup : nursery) {
            if(nurseryGroup.getNursery().equals(IdNursery))
                return true;
        }
        return false;
    }
    
    public Boolean checkGroup(String IdGroup) {
        for(GroupChoices group : groups) {
            if(group.getIdGroup().equals(IdGroup))
                return true;
        }
        return false;
    }
    
    public Boolean checkCafeteria(Integer dayCafeteria) {
        Integer cafeteriaDayBooking = booking.getCafeteriaDays();
        return (dayCafeteria & cafeteriaDayBooking) != 0;
    }
    
    public Boolean checkActivity(String IdActivity) {
        for(GroupChoices group : groups) {
        if(group.getIdActivity().equals(IdActivity))
            return true;
        }
        return false;
    }
}
