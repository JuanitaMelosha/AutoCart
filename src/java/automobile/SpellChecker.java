/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package automobile;

/**
 *
 * @author Hp-admin
 */
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SpellChecker {
    private List<String> vocabulary;
    public SpellChecker(String filePath) {
        loadVocabulary(filePath);
    }
    
    private void loadVocabulary(String filePath) {
        vocabulary = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                vocabulary.add(line.trim().toLowerCase());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<String> suggestCorrections(String word, int maxDistance) {
        List<String> suggestions = new ArrayList<>();

        for (String candidate : vocabulary) {
            int distance = calculateLevenshteinDistance(word, candidate);
            if (distance <= maxDistance) {
                suggestions.add(candidate);
            }
        }

        return suggestions;
    }

    private int calculateLevenshteinDistance(String word1, String word2) {
        int[][] dp = new int[word1.length() + 1][word2.length() + 1];

        for (int i = 0; i <= word1.length(); i++) {
            for (int j = 0; j <= word2.length(); j++) {
                if (i == 0) {
                    dp[i][j] = j;
                } else if (j == 0) {
                    dp[i][j] = i;
                } else {
                    dp[i][j] = min(
                            dp[i - 1][j - 1] + (word1.charAt(i - 1) == word2.charAt(j - 1) ? 0 : 1),
                            dp[i - 1][j] + 1,
                            dp[i][j - 1] + 1
                    );
                }
            }
        }

        return dp[word1.length()][word2.length()];
    }

    private int min(int a, int b, int c) {
        return Math.min(Math.min(a, b), c);
    }

    public static void main(String[] args) {
        SpellChecker spellChecker = new SpellChecker("wordFrequency.txt");

        // Example usage
        String userInput = "tosyota";
        int maxDistance = 2;

        List<String> suggestions = spellChecker.suggestCorrections(userInput.toLowerCase(), maxDistance);

        if (suggestions.isEmpty()) {
            System.out.println("No suggestions found. Check your spelling.");
        } else {
            System.out.println("Suggestions:");
            for (String suggestion : suggestions) {
                System.out.println(suggestion);
            }
        }
    }
}
