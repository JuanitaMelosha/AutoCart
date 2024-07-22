package automobile;

import java.io.FileWriter;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WordFrequencyAnalyzer {
    private Map<String, Integer> wordFrequency = new HashMap<>();

    public void analyzeWordFrequency(String baseURL) {
        try {
            Document inputDoc = Jsoup.connect(baseURL).get();
            Elements contentInDoc = inputDoc.select("a"); // Adjust the selector based on the HTML structure

            for (Element eachContentData : contentInDoc) {
                String[] listOfWords = eachContentData.text().split("\\s+");
                for (String eachWord : listOfWords) {
                    eachWord = eachWord.toLowerCase().replaceAll("[^a-zA-Z]", "");
                     if (!eachWord.isEmpty() && eachWord.length()>3 ) {
                        wordFrequency.put(eachWord, wordFrequency.getOrDefault(eachWord, 0) + 1);
                    }
                }
            }
            contentInDoc = inputDoc.select("h3"); // Adjust the selector based on the HTML structure

            for (Element eachContentData : contentInDoc) {
                String[] listOfWords = eachContentData.text().split("\\s+");
                for (String eachWord : listOfWords) {
                    eachWord = eachWord.toLowerCase().replaceAll("[^a-zA-Z]", "");
                     if (!eachWord.isEmpty() && eachWord.length()>3 ) {
                        wordFrequency.put(eachWord, wordFrequency.getOrDefault(eachWord, 0) + 1);
                    }
                }
            }
              contentInDoc = inputDoc.select("p"); // Adjust the selector based on the HTML structure

            for (Element eachContentData : contentInDoc) {
                String[] listOfWords = eachContentData.text().split("\\s+");
                for (String eachWord : listOfWords) {
                    eachWord = eachWord.toLowerCase().replaceAll("[^a-zA-Z]", "");
                    if (!eachWord.isEmpty() && eachWord.length()>3 ) {
                        wordFrequency.put(eachWord, wordFrequency.getOrDefault(eachWord, 0) + 1);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
      public void storeAboveThresholdToFile(int threshold, String filename) {
        // Filter entries above the threshold
        Map<String, Integer> filteredMap = new HashMap<>();
        for (Map.Entry<String, Integer> eachEntry : wordFrequency.entrySet()) {
            if (eachEntry.getValue() > threshold) {
                filteredMap.put(eachEntry.getKey(), eachEntry.getValue());
            }
        }

        // Sort the filtered map in descending order
        List<Map.Entry<String, Integer>> sortedEntries = new ArrayList<>(filteredMap.entrySet());
        sortedEntries.sort(Map.Entry.comparingByValue(Comparator.reverseOrder()));

        // Write the sorted entries to a text file
        try (FileWriter writer = new FileWriter(filename)) {
            for (Map.Entry<String, Integer> entry : sortedEntries) {
                writer.write(entry.getKey() + "\n");
            }
            System.out.println("Word Frequency values above " + threshold + " stored in '" + filename + "'.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void displayWordFrequency() {
         List<Map.Entry<String, Integer>> sortedEntries = new ArrayList<>(wordFrequency.entrySet());
        sortedEntries.sort(Map.Entry.comparingByValue(Comparator.reverseOrder()));

        System.out.println("Word Frequency Analysis (Descending Order):");
        for (Map.Entry<String, Integer> entry : sortedEntries) {
            System.out.println(entry.getKey() + ": " + entry.getValue() + " occurrences");
        }
    }

    public static void main(String[] args) {
        WordFrequencyAnalyzer wordFrequencyAnalyzerObj = new WordFrequencyAnalyzer();
        String baseUniformResourceLink = "https://www.autocarindia.com/new-cars"; // Replace with the URL you want to analyze
        wordFrequencyAnalyzerObj.analyzeWordFrequency(baseUniformResourceLink);
        //analyzer.displayWordFrequency();
        wordFrequencyAnalyzerObj.storeAboveThresholdToFile(3, "wordFrequency.txt");

    }
}
