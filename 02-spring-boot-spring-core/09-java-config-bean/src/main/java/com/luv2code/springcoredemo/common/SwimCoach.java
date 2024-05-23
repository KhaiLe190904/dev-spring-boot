package com.luv2code.springcoredemo.common;

import org.springframework.beans.factory.annotation.Configurable;

public class SwimCoach implements Coach{
    public SwimCoach() {
        System.out.println("In constructor: " + (getClass().getSimpleName()));
    }

    @Override
    public String getDailyWorkout() {
        return "Swim 1000m as a warm up";
    }
}
