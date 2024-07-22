/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package automobile;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Hp-admin
 */
public class AutomobilePriceAnalysis {
    // Inverted Index
    public static Map<String, List<Car>> invertedIndex = new HashMap<>();

    // Indexing function
    public static void indexCar(Car car) {
        // Tokenize car information
        String[] tokens = {
                car.make.toLowerCase(),
                car.model.toLowerCase(), 
                String.valueOf(car.millage),
                String.valueOf(car.seat),
              
                String.valueOf(car.price),
                
        };
        for (String token : tokens) {
            invertedIndex.computeIfAbsent(token, k -> new ArrayList<>()).add(car);
        }
    }

    // Search function
    public static List<Car> search(String query) {
        // Convert the query to lowercase for case-insensitive search
        query = query.toLowerCase();

        // Check if the query exists in the inverted index
        if (invertedIndex.containsKey(query)) {
            return invertedIndex.get(query);
        } else {
            // If the query doesn't exist, return an empty list or handle accordingly
            return new ArrayList<>();
        }
    }

  }