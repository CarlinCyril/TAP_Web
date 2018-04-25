/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Time;
import java.util.ArrayList;

public class Group {
    private String ID_Group;
    private Activity activity;
    private String dayOfTheWeek;
    private Time startTime;
    private Time endTime;
    private Integer enrollment;
    private ArrayList<ClassLevel> levels;

    public Group(String ID_Group, Activity activity, String dayOfTheWeek, Time startTime, Time endTime, Integer enrollment, ArrayList<ClassLevel> levels) {
        this.ID_Group = ID_Group;
        this.activity = activity;
        this.dayOfTheWeek = dayOfTheWeek;
        this.startTime = startTime;
        this.endTime = endTime;
        this.enrollment = enrollment;
        this.levels = levels;
    }

    public void setLevel(ArrayList<ClassLevel> levels) {
        this.levels = levels;
    }

    public ArrayList<ClassLevel> getLevel() {
        return levels;
    }

    public void setID_Group(String ID_Group) {
        this.ID_Group = ID_Group;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public void setDayOfTheWeek(String dayOfTheWeek) {
        this.dayOfTheWeek = dayOfTheWeek;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public void setEnrollment(Integer enrollment) {
        this.enrollment = enrollment;
    }

    public String getID_Group() {
        return ID_Group;
    }

    public Activity getActivity() {
        return activity;
    }

    public String getDayOfTheWeek() {
        return dayOfTheWeek;
    }

    public Time getStartTime() {
        return startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public Integer getEnrollment() {
        return enrollment;
    }
    
    public String toStringLevels() {
        String result = new String();
        for(ClassLevel level : levels) {
            result += level.getLevel() +"/";
        }
        return result.substring(0, result.length()-1);
    }
    
    public String toStringWish() {
        String result = new String();
        result = "wish-" + getID_Group() + getActivity().getName();
        return result;
    }
}
