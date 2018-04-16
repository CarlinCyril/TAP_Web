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
public class PeriodYear {
    private String idPeriod;
    private String startDay;
    private String endDay;
    
    
    public void setIdPeriod(String idPeriod) {
        this.idPeriod = idPeriod;
    }

    public void setStartDay(String startDay) {
        this.startDay = startDay;
    }

    public void setEndDay(String endDay) {
        this.endDay = endDay;
    }

    public String getIdPeriod() {
        return idPeriod;
    }

    public PeriodYear(String idPeriod, String startDay, String endDay) {
        this.idPeriod = idPeriod;
        this.startDay = startDay;
        this.endDay = endDay;
    }

    public String getStartDay() {
        return startDay;
    }

    public String getEndDay() {
        return endDay;
    }

    public PeriodYear(String startDay, String endDay) {
        this.startDay = startDay;
        this.endDay = endDay;
    }
}
