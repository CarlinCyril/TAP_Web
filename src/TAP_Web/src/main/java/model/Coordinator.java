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
public class Coordinator {
    private String idCoordinator;
    private String name;
    private String firstName;

    public Coordinator(String idCoordinator, String name, String firstName) {
        this.idCoordinator = idCoordinator;
        this.name = name;
        this.firstName = firstName;
    }

    public String getIdCoordinator() {
        return idCoordinator;
    }

    public void setIdCoordinator(String idCoordinator) {
        this.idCoordinator = idCoordinator;
    }



    public String getName() {
        return name;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    
}
