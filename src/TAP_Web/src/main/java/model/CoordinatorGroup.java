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
public class CoordinatorGroup {
    private String Group;
    private String Activity;
    private String Coordinator;

    public CoordinatorGroup(String Group, String Activity, String Coordinator) {
        this.Group = Group;
        this.Activity = Activity;
        this.Coordinator = Coordinator;
    }

    public String getGroup() {
        return Group;
    }

    public String getActivity() {
        return Activity;
    }

    public String getCoordinator() {
        return Coordinator;
    }

    public void setGroup(String Group) {
        this.Group = Group;
    }

    public void setActivity(String Activity) {
        this.Activity = Activity;
    }

    public void setCoordinator(String Coordinator) {
        this.Coordinator = Coordinator;
    }
    
    

}
