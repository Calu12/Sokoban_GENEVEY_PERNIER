package sokoban;

import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Agent {
    public static void main(String[] args) {
        String solution;

        try (BufferedReader reader = new BufferedReader(new FileReader("src/main/java/sokoban/solution.txt"))) {
            while ((solution = reader.readLine()) != null) {
                for (char c : solution.toCharArray()) System.out.println(c);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
       
        
    }
}
