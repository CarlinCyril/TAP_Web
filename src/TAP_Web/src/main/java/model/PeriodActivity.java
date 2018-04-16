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
public class PeriodActivity {
    private String Period;
    private String Activity;

    public PeriodActivity(String Period, String Activity) {
        this.Period = Period;
        this.Activity = Activity;
    }

    public String getPeriod() {
        return Period;
    }

    public String getActivity() {
        return Activity;
    }

    public void setPeriod(String Period) {
        this.Period = Period;
    }

    public void setActivity(String Activity) {
        this.Activity = Activity;
    }
    
    
}
