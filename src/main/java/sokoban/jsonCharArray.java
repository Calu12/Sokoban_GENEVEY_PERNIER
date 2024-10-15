package sokoban;

import org.json.JSONObject;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;


public class jsonCharArray {
    public static void main(String[] args) {
        // Remplacez "path/to/your/file.json" par le chemin de votre fichier JSON
        String filePath = "config/test11.json";

        try {
            // Lire le contenu du fichier
            String content = new String(Files.readAllBytes(Paths.get(filePath)));
            
            // Parser le contenu JSON
            JSONObject jsonObject = new JSONObject(content);
            
            // Récupérer la chaîne depuis la clé "testIn"
            String testIn = jsonObject.getString("testIn");
            
            // Convertir la chaîne en tableau à deux dimensions
            char[][] charArray = convertTo2DArray(testIn);

            // Afficher le tableau
            print2DArray(charArray);

            // Générer le problème PDDL
            String pddlProblem = generatePddlProblem(charArray);
            System.out.println(pddlProblem);

            // Écrire le problème PDDL dans un fichier
            FileWriter fileWriter = new FileWriter(new File("sokoban_problem.pddl"));
            fileWriter.write(pddlProblem);
            fileWriter.close();

            System.out.println("Fichier PDDL généré avec succès.");


        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Erreur lors du traitement du JSON : " + e.getMessage());
        }
    }

    private static char[][] convertTo2DArray(String input) {
        // Séparer les lignes par saut de ligne
        String[] lines = input.split("\n");
        int rows = lines.length;

        // Créer le tableau à deux dimensions avec des longueurs variables
        char[][] array = new char[rows][];

        // Remplir le tableau avec les caractères
        for (int i = 0; i < rows; i++) {
            array[i] = lines[i].toCharArray(); // Convertir chaque ligne en tableau de caractères
        }

        return array;
    }

    private static void print2DArray(char[][] array) {
        for (char[] row : array) {
            for (char c : row) {
                System.out.print(c);
            }
            System.out.println();
        }
    }

    private static String generatePddlProblem(char[][] array) {
        StringBuilder sb = new StringBuilder();
        sb.append("(define (problem ").append("sokoban").append(")\n");
        sb.append("  (:domain sokoban_domain)\n");

        // Définir les objets (boxes, destinations, walls, agent)
        sb.append("  (:objects\n");

        for (int i = 0; i < array.length; i++) { // Pour chaque ligne
            for (int j = 0; j < array[i].length; j++) {
                char ch = array[i][j];
                sb.append(" loc").append(i).append("_").append(j).append(" - location\n");
                switch (ch) {
                    case '#':
                        sb.append(" wall").append(i).append("_").append(j).append(" - wall\n");
                        break;
                    case '$':
                        sb.append(" box").append(i).append("_").append(j).append(" - box\n");
                        break;
                    case '*':
                        sb.append(" box").append(i).append("_").append(j).append(" - box\n");
                        break;
                    case '@':
                        sb.append(" agent - agent\n");
                        break;
                    case '+':
                        sb.append(" agent - agent\n");
                        break;
                }
            }
        }
        sb.append("  )\n");

        // Définir les préconditions initiales
        sb.append("  (:init\n");
        for (int i = 0; i < array.length; i++) { // Pour chaque ligne
            for (int j = 0; j < array[i].length; j++) {
                char ch = array[i][j];
                switch (ch) {
                    case '#':
                        sb.append("(at wall").append(i).append("_").append(j).append(" loc").append(i).append("_").append(j).append(" ) \n");
                        break;
                    case '$':
                        sb.append("(at box").append(i).append("_").append(j).append(" loc").append(i).append("_").append(j).append(" ) \n");
                        break;
                    case '*':
                        sb.append("(at box").append(i).append("_").append(j).append(" loc").append(i).append("_").append(j).append(" ) \n");
                        sb.append("(is_destination loc").append(i).append("_").append(j).append(" ) \n");
                        sb.append("(wellPlaced box").append(i).append("_").append(j).append(" ) \n");
                        break;
                    case '@':
                        sb.append("(at agent loc").append(i).append("_").append(j).append(" ) \n");
                        break;
                    case '+':
                        sb.append("(at agent loc").append(i).append("_").append(j).append(" ) \n");
                        sb.append("(is_destination loc").append(i).append("_").append(j).append(" ) \n");
                        break;
                    case '.':
                        sb.append("(is_destination loc").append(i).append("_").append(j).append(" ) \n");
                        sb.append("(empty loc").append(i).append("_").append(j).append(" ) \n");
                        break;
                    case ' ':
                        sb.append("(empty loc").append(i).append("_").append(j).append(") \n");
                        break;
                }

                // Vérifier si la case au dessus existe
                if (i-1 < array.length&&i-1>=0&&j>=0&&j<array[i-1].length) {
                    sb.append("(under loc").append(i).append("_").append(j).append(" loc").append(i-1).append("_").append(j).append(" ) \n");
                    
                }
                // Vérifier si la case a gauche existe 
                if (j-1>=0&&j-1<array[i].length) {
                    sb.append("(rightTo loc").append(i).append("_").append(j).append(" loc").append(i).append("_").append(j-1).append(" ) \n");
                }
            }
        }

        sb.append("  )\n");

        // État final
        sb.append("  (:goal \n");
        sb.append("    (forall (?b - box) \n"+"    (wellPlaced ?b) )\n");
        sb.append("  ))\n");

        return sb.toString();
    }

}