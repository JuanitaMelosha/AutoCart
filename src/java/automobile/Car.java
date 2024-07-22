/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package automobile;

import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Hp-admin
 */
public class Car {
    String make;
    String model;
    String price;
    String millage; String seat;
    List<String> features;
    // Constructor
    public Car(String make, String model, String price,String millage, String seat,  List<String> features) {
        this.make = make;
        this.model = model;
        this.millage = millage;
        this.seat = seat;

        this.price = price;
        this.features = features;
    }

    public String getMillage() {
        return millage;
    }

    public void setMillage(String millage) {
        this.millage = millage;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getPrice() {
        return price;
    }
     public static List<Car> removeRepeatedSequences(List<Car> cars) {
        return cars.stream()
                .distinct()
                .collect(Collectors.toList());
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public List<String> getFeatures() {
        return features;
    }

    public void setFeatures(List<String> features) {
        this.features = features;
    }

    // Override toString for easy printing
    @Override
    public String toString() {
        return make + " " + model +  " $" + price;
    }
}




