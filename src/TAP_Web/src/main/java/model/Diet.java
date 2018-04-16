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
public class Diet {
    private String idDiet;
    private String descriptif;

    public Diet(String idDiet, String descriptif) {
        this.idDiet = idDiet;
        this.descriptif = descriptif;
    }

    public void setIdDiet(String idDiet) {
        this.idDiet = idDiet;
    }

    public String getIdDiet() {
        return idDiet;
    }

    public String getDescriptif() {
        return descriptif;
    }

    public void setDescriptif(String descriptif) {
        this.descriptif = descriptif;
    }
    
}
