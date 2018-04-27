/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author demarquq
 */
public class PeriodYear {
    private String idPeriod;
    private Date startDay;
    private Date endDay;
    
    
    public void setIdPeriod(String idPeriod) {
        this.idPeriod = idPeriod;
    }

    public void setStartDay(Date startDay) {
        this.startDay = startDay;
    }

    public void setEndDay(Date endDay) {
        this.endDay = endDay;
    }

    public String getIdPeriod() {
        return idPeriod;
    }

    public PeriodYear(String idPeriod, Date startDay, Date endDay) {
        this.idPeriod = idPeriod;
        this.startDay = startDay;
        this.endDay = endDay;
    }

    public Date getStartDay() {
        return startDay;
    }

    public Date getEndDay() {
        return endDay;
    }

}
