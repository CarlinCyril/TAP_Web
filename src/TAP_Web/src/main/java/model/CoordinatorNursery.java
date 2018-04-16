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
public class CoordinatorNursery {
    private String Nursery;
    private String Coordinator;

    public void setNursery(String Nursery) {
        this.Nursery = Nursery;
    }

    public void setCoordinator(String Coordinator) {
        this.Coordinator = Coordinator;
    }

    public String getNursery() {
        return Nursery;
    }

    public String getCoordinator() {
        return Coordinator;
    }

    public CoordinatorNursery(String Nursery, String Coordinator) {
        this.Nursery = Nursery;
        this.Coordinator = Coordinator;
    }
}
